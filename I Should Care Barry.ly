\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title = "I Should Care"
  subtitle = "As played by Barry Harris on \"Solo\""
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
     c4 ges:7 f:maj7 f:m6 | 
     e4:m7 bes:7 a2:7.9- 
  }
  

  \new PianoStaff <<
  
  \new Staff \relative c { 
    \time 4/4 \key c \major

    <e g c>4 <bes' c ees as> <g' a c> <aes, c f> | 
    <g b e> <c d e g> <bes f'> <des f bes>
  }
  \new Staff \relative { 
    \clef bass \time 4/4 \key c \major
    
    <c, g' c> <ges' fes'> <f e'> <d'> |
    <e, d'> <bes' aes'> <a g'> <g'>
  }
>>
>>
