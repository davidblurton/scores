\version "2.19.12"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jazz-style chord symbol rendering
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Root note naming with alterations (for Opus Chords Std font)
#(define (JazzChordNames pitch majmin)
  (let* ((alt (ly:pitch-alteration pitch)))
    (make-line-markup
      (list
	(make-simple-markup
	  (vector-ref #("C" "D" "E" "F" "G" "A" "B")
	    (ly:pitch-notename pitch)))
	(if (= alt 0)
	  (markup "")
	  (if (= alt FLAT)
	    (markup "¨")
	    (markup "©")
	  )
	)
      )
    )
  )
)

%----- markup commands for chord quality display -----

% minor chord dash
#(define-markup-command (acMin layout props extension) (string?)
  (interpret-markup layout props
    (markup "‹" extension)))

% major chord "maj" superscript
#(define-markup-command (acMaj layout props extension) (string?)
  (interpret-markup layout props
    (markup #:raise 0.5 #:fontsize -2 "maj" extension)))

% flat symbol with extension number
#(define-markup-command (acFlat layout props extension) (string?)
  (interpret-markup layout props
    (markup #:raise 0.5 "¨" extension)))

#(define acSharp "#")
#(define acSixNine "%")
#(define acAdd "'")
#(define acDim "—")
#(define acSus "“")

%----- chord exceptions -----
% This is the complete set of recognized chord qualities.
% Any chord quality not listed here will cause a compilation error.
% Pitch sets map to chordmode equivalents as noted in comments.

JazzChordsList = {
  % triads
  <c e g>1-\markup { "" }                                       % (major)
  <c es g>-\markup { \acMin #"" }                                % m
  <c es ges>-\markup { #acDim }                                  % dim
  <c d g>-\markup { "(" #acSus "2)" }                                     % sus2
  <c f g>-\markup { "(" #acSus "4)" }                                     % sus4

  % added tone
  <c d>-\markup { #(string-append acAdd "2") }                    % 2
  <c e g a>-\markup { #"6" }                                     % 6

  % 7th chords
  <c e g bes>-\markup { #"7" }                                   % 7
  <c f g bes>-\markup { "7sus" }                                 % 7sus4
  <c e g b>-\markup { \acMaj #"7" }                              % maj7 (also 7+)
  <c es g bes>-\markup { \acMin #"7" }                           % m7
  <c es ges bes>-\markup { \acMin #"7" "(" \acFlat "5" ")" }    % m7.5-
  <c es ges beses>-\markup { #acDim "7" }                        % dim7

  % 9th and extended chords
  <c e g bes d'>-\markup { #"9" }                                % 9
  <c e g b d'>-\markup { \acMaj #"9" }                           % maj9
  <c e g bes des'>-\markup { #"7" "(" \acFlat "9" ")" }         % 7.9-
  <c e g bes dis'>-\markup { #"7" "(" #acSharp "9" ")" }        % 7.9+
  <c e g bes fis'>-\markup { #"7" "(" #acSharp "11" ")" }       % 7.11+
  <c e g bes d' fis'>-\markup { #(string-append "9(" acSharp "11)") }  % 9.11+
}

JazzChords = #(append
  (sequential-music-to-chord-exceptions JazzChordsList #t)
  ignatzekExceptions)

% Strict chord naming: errors on any chord quality not in the dictionary.
% known-intervals is derived from a root-inclusive (#f) table to avoid
% the dominated-7th key collisions that occur with #t.
#(define known-intervals
  (map (lambda (exc)
         (map ly:pitch-semitones (car exc)))
       (sequential-music-to-chord-exceptions JazzChordsList #f)))

#(define (strict-chord-names pitches bass inversion context)
  (let* ((root (car pitches))
         (semitones (map (lambda (p)
                           (ly:pitch-semitones (ly:pitch-diff p root)))
                         pitches)))
    (if (member semitones known-intervals)
        (ignatzek-chord-names pitches bass inversion context)
        (begin
          (ly:error "Chord not in dictionary: ~a" semitones)
          (make-simple-markup "?")))))

\layout {
  \context {
    \ChordNames
    chordRootNamer = #JazzChordNames
    chordNameExceptions = #JazzChords
    chordNameFunction = #strict-chord-names
    \override ChordName.font-size = #2
    \override ChordName.font-name = #"Opus Chords Std"
  }
}
