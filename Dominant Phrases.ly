\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title = "Dominant Phrases"
  % subtitle = "Solo by Chris Parks"
  tagline = ""
  composer = "Transcribed by David Blurton"
}

\layout {

}

\paper {
  markup-system-spacing.basic-distance = #25
}

<<
  \chords {
     g1:m7 | c:7 | f:maj7
  }
  \new Staff \relative c''' {
    #(set-accidental-style 'voice)
    \key g \major

    bes8 c a aes g f d dis |
    e des bes b c bes g gis |
    a1 \bar "||" |
  }
>>

<<
  \chords {
     a1:m7 | d:7 | g:maj7
  }
  \new Staff \relative c''' {
    #(set-accidental-style 'voice)
    \key g \major

    c8 b g gis  a8 g e eis | 
    fis e c cis d c a ais | b1 \fine |
    \bar "||" |
  }
>>