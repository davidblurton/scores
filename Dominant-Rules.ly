\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title = "Dominant Rules"
  tagline = ""
}

\layout {

}

\paper {
  markup-system-spacing.basic-distance = #25
}

%Association list of pitches to colors.
#(define color-mapping
   (list
    (cons (ly:make-pitch 0 4 NATURAL) (x11-color 'red))
    (cons (ly:make-pitch 0 5 NATURAL) (x11-color 'red))
    (cons (ly:make-pitch 0 6 NATURAL) (x11-color 'red))
))

%Compare pitch and alteration (not octave).
#(define (pitch-equals? p1 p2)
   (and
    (= (ly:pitch-alteration p1) (ly:pitch-alteration p2))
    (= (ly:pitch-notename p1) (ly:pitch-notename p2))))

#(define (pitch-to-color pitch)
   (let ((color (assoc pitch color-mapping pitch-equals?)))
     (if color
         (cdr color))))

#(define (color-notehead grob)
   (pitch-to-color
    (ly:event-property (event-cause grob) 'pitch)))

<<
  \chords {
     d1:7 | g:maj7
  }
  \new Staff \relative c'' {
    #(set-accidental-style 'voice)
    \key c \major
    \override NoteHead.color = #color-notehead
    r2 
    \textMark "scale degree 1 (1 half-step)"
    aes8 g ges f | e1
  }
>>

<<
    \chords {
     d1:7 | g:maj7
  }
  \new Staff \relative c'' {
    #(set-accidental-style 'voice)
    \key c \major
\override NoteHead.color = #color-notehead
    r2 
    \textMark "scale degree 2 (0 half-steps)"
    bes8 aes ges f | e1
  }
>>

<<
    \chords {
     d1:7 | g:maj7
  }
  \new Staff \relative c'' {
    #(set-accidental-style 'voice)
    \key c \major
\override NoteHead.color = #color-notehead
    r2 
    \textMark "scale degree 2 (2 half-steps)"
    bes8 a aes g | fis1
  }
>>

<<
    \chords {
     d1:7 | g:maj7
  }
  \new Staff \relative c'' {
    #(set-accidental-style 'voice)
    \key c \major
\override NoteHead.color = #color-notehead
    r2 
    \textMark "scale degree 3 (1 half-step)"
    c8 bes aes g | fis1
  }
>>

<<
    \chords {
     d1:7 | g:maj7
  }
  \new Staff \relative c'' {
    #(set-accidental-style 'voice)
    \key c \major
\override NoteHead.color = #color-notehead
    r2 
    \textMark "scale degree 3 (3 half-steps)"
    c8 b bes a | g1
  }
>>


