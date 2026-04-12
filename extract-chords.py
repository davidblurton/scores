#!/usr/bin/env python3
"""
Extract unique chord qualities from LilyPond (.ly) files.

Parses \\chords and \\chordmode blocks, strips root pitch, duration,
and bass notes, then collects the unique chord quality suffixes.
"""

from pathlib import Path
import sys

# LilyPond note names (Dutch naming, longest first for greedy matching)
NOTE_NAMES = sorted([
    'cisis', 'ceses', 'disis', 'deses', 'eisis', 'eeses',
    'fisis', 'feses', 'gisis', 'geses', 'aisis', 'aeses',
    'bisis', 'beses',
    'cis', 'ces', 'dis', 'des', 'eis', 'ees',
    'fis', 'fes', 'gis', 'ges', 'ais', 'aes',
    'bis', 'bes',
    'as', 'es',
    'c', 'd', 'e', 'f', 'g', 'a', 'b',
], key=len, reverse=True)

EXCLUDED_FILES = {'Chord Symbol Test.ly'}


def find_chord_blocks(text):
    """Extract content of all \\chords{} and \\chordmode{} blocks."""
    blocks = []
    i = 0
    n = len(text)

    while i < n:
        # Skip line comments
        if text[i] == '%':
            while i < n and text[i] != '\n':
                i += 1
            continue

        keyword = None
        if text[i:i + 10] == '\\chordmode' and (i + 10 >= n or not text[i + 10].isalpha()):
            keyword = '\\chordmode'
        elif text[i:i + 7] == '\\chords' and (i + 7 >= n or not text[i + 7].isalpha()):
            keyword = '\\chords'

        if keyword:
            i += len(keyword)
            while i < n and text[i].isspace():
                i += 1
            if i < n and text[i] == '{':
                depth = 1
                start = i + 1
                i += 1
                while i < n and depth > 0:
                    if text[i] == '{':
                        depth += 1
                    elif text[i] == '}':
                        depth -= 1
                    elif text[i] == '%':
                        while i < n and text[i] != '\n':
                            i += 1
                        continue
                    i += 1
                blocks.append(text[start:i - 1])
            continue

        i += 1

    return blocks


def try_read_note(text, pos):
    """Match a LilyPond note name at pos.

    Returns (name, end_pos) or (None, pos). Checks longest names
    first and requires a non-alpha boundary after the name.
    """
    n = len(text)
    for name in NOTE_NAMES:
        end = pos + len(name)
        if end <= n and text[pos:end] == name and (end >= n or not text[end].isalpha()):
            return name, end
    return None, pos


def extract_qualities(block):
    """Parse chord-block content and return the set of quality strings.

    Chord tokens have the form: note [duration] [: quality] [/ [+] bass]
    This extracts the quality part, or '' for unmodified major chords.
    """
    qualities = set()
    pos = 0
    n = len(block)

    while pos < n:
        # Skip whitespace
        while pos < n and block[pos] in ' \t\n\r':
            pos += 1
        if pos >= n:
            break

        # Skip line comments
        if block[pos] == '%':
            while pos < n and block[pos] != '\n':
                pos += 1
            continue

        ch = block[pos]

        # Barlines and braces
        if ch in '|{}':
            pos += 1
            continue

        # Commands: \keyword
        if ch == '\\':
            pos += 1
            while pos < n and (block[pos].isalpha() or block[pos] == '_'):
                pos += 1
            continue

        # Scheme literals: ##t, ##f, #number, etc.
        if ch == '#':
            pos += 1
            if pos < n and block[pos] == '#':
                pos += 1
            while pos < n and block[pos].isalnum():
                pos += 1
            continue

        # Punctuation from command arguments
        if ch in ',()=':
            pos += 1
            continue

        # String literals
        if ch == '"':
            pos += 1
            while pos < n and block[pos] != '"':
                pos += 1
            if pos < n:
                pos += 1
            continue

        # Skip/silence: s with optional duration
        if ch == 's':
            note, _ = try_read_note(block, pos)
            if note is None:
                pos += 1
                while pos < n and block[pos].isdigit():
                    pos += 1
                while pos < n and block[pos] == '.':
                    pos += 1
                continue

        # Try to read a chord token
        note, new_pos = try_read_note(block, pos)
        if note is not None:
            pos = new_pos
            # Duration
            while pos < n and block[pos].isdigit():
                pos += 1
            while pos < n and block[pos] == '.':
                pos += 1
            # Quality
            quality = None
            if pos < n and block[pos] == ':':
                pos += 1
                qstart = pos
                while pos < n and block[pos] not in ' \t\n\r|{}/%':
                    pos += 1
                quality = block[qstart:pos]
            # Bass note
            if pos < n and block[pos] == '/':
                pos += 1
                if pos < n and block[pos] == '+':
                    pos += 1
                _, pos = try_read_note(block, pos)
            qualities.add(quality if quality is not None else '')
            continue

        # Unknown alphabetic word (e.g. "volta", "Chorus")
        if ch.isalpha():
            while pos < n and block[pos].isalpha():
                pos += 1
            continue

        # Anything else (digits from command args, etc.)
        pos += 1

    return qualities


def main():
    scores_dir = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(__file__).parent
    all_qualities = set()
    file_count = 0

    for ly_file in sorted(scores_dir.glob('*.ly')):
        if ly_file.name in EXCLUDED_FILES:
            continue
        text = ly_file.read_text(encoding='utf-8')
        blocks = find_chord_blocks(text)
        if blocks:
            file_count += 1
            for block in blocks:
                all_qualities |= extract_qualities(block)

    print(f"Scanned {file_count} files with chord blocks")
    print(f"Found {len(all_qualities)} unique chord qualities:\n")

    for q in sorted(all_qualities, key=lambda s: (s == '', s)):
        print(f"  {q}" if q else "  (major)")


if __name__ == '__main__':
    main()
