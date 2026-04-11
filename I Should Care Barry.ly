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
     des4 g:7 ges:maj7 ees:m7.5- | 
     f4:m7 b:7 bes2:7.9- 
  }
  

  \new PianoStaff <<
    
  \new Staff \relative c' { 
    \time 4/4 \key des \major

    <f, aes des>4 <d' e f a> <aes' bes des> <a, des ees ges> | 
    <aes c ees f> <cis dis eis gis> <b ges'> <d ges ces>
  }
  \new Staff \relative { 
    \clef bass \time 4/4 \key des \major
    
    <des, aes' des> <g f'> <ges f'> <ees' ges> |
    <f, ees'> <b a'> <bes aes'> <aes'>
  }
>>
>>
