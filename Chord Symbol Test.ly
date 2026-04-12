\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title = "Chord Symbol Test"
  tagline = ##f
}

\paper {
  markup-system-spacing.basic-distance = #20
}

\layout {
  
}

theChords = \chordmode {
  % triads
  c1           % major
  c1:m         % minor
  c1:dim       % diminished
  c1:sus2      % suspended 2nd
  c1:sus4      % suspended 4th

  % added tone
  c1:2         % add 2nd
  c1:6         % 6th

  % 7th chords
  c1:7         % dominant 7th
  c1:7sus4     % dominant 7sus4
  c1:maj7      % major 7th
  c1:m7        % minor 7th
  c1:m7.5-     % half-diminished
  c1:dim7      % diminished 7th

  % 9th and extended chords
  c1:9         % dominant 9th
  c1:maj9      % major 9th
  c1:7.9-      % dominant 7 flat 9
  c1:7.9+      % dominant 7 sharp 9
  c1:7.11+     % dominant 7 sharp 11
  c1:9.11+     % dominant 9 sharp 11
}

<<
  \new ChordNames \theChords
  \new Staff \theChords
>>

<<
  \new ChordNames \transpose c bes \theChords
  \new Staff \transpose c bes, \theChords
>>
