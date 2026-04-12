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

#(define-markup-command (acExt layout props extension) (markup?)
  (interpret-markup layout props
    (markup "(" extension ")")))

% major chord "maj" superscript
#(define-markup-command (acMaj layout props extension) (string?)
  (interpret-markup layout props
    (markup "^" extension)))

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
  <c d>-\markup { #(string-append "(" acAdd "2" ")" ) }                    % 2
  <c e g a>-\markup { #"6" }                                     % 6

  % 7th chords
  <c e g bes>-\markup { #"7" }                                   % 7
  <c f g bes>-\markup { "7" "(" #acSus "4)" }                                 % 7sus4
  <c e g b>-\markup { \acMaj #"7" }                              % maj7 (also 7+)
  <c es g bes>-\markup { \acMin #"7" }                           % m7
  <c es ges bes>-\markup { \acMin #"7" \acExt { "b5" } }    % m7.5-
  <c es ges beses>-\markup { #acDim "7" }                        % dim7

  % 9th and extended chords
  <c e g bes d'>-\markup { #"9" }                                % 9
  <c e g b d'>-\markup { \acMaj #"9" }                           % maj9
  <c e g bes des'>-\markup { #"7" "("  "b9" ")" }         % 7.9-
  <c e g bes dis'>-\markup { #"7" "(" "#9" ")" }        % 7.9+
  <c e g bes fis'>-\markup { #"7" "(" "#11" ")" }       % 7.11+
  <c e g bes d' fis'>-\markup { #(string-append "9(" "#11)") }  % 9.11+
}

% Build exception table with #f to preserve all entries without
% the dominated-7th key collisions that #t causes.
JazzChords = #(sequential-music-to-chord-exceptions JazzChordsList #f)

% Chord naming function that looks up exceptions directly and errors
% on any chord quality not in the dictionary.
#(define (strict-chord-names pitches bass inversion context)
  (let* ((root (car pitches))
         (intervals (map (lambda (p) (ly:pitch-diff p root)) pitches))
         (match (find (lambda (exc) (equal? (car exc) intervals))
                      JazzChords)))
    (if match
        (let* ((root-namer (ly:context-property context 'chordRootNamer))
               (root-markup (root-namer root #f))
               (quality-markup (cadr match))
               (chord-markup (make-line-markup (list root-markup quality-markup))))
          (if (and (ly:pitch? bass) (not (equal? bass root)))
              (make-line-markup
                (list chord-markup
                      (make-simple-markup "/")
                      (root-namer bass #f)))
              chord-markup))
        (begin
          (ly:error "Chord not in dictionary: ~a"
            (map (lambda (p) (ly:pitch-semitones (ly:pitch-diff p root))) pitches))
          (make-simple-markup "?")))))

\layout {
  \context {
    \ChordNames
    chordRootNamer = #JazzChordNames
    chordNameFunction = #strict-chord-names
    %\override ChordName.font-size = #2
    \override ChordName.font-name = #"Opus Chords Std"
  }
}
