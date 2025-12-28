\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"
%\include "./stylesheet/jazzchords.ily"

\header {
  \pointAndClickOff
  title =  "Í Betlehem"
  subtitle = ""
  tagline =  ""
  composer = "úts. Óskar Einarsson"
  copyright = "tölvus. David Blurton (2025)"
}

\paper {
  system-system-spacing.basic-distance = #16
}

keyTime = { \time 4/4 \key e \major }

PartVoiceMelody = \new Voice \with {
  \consists Pitch_squash_engraver
} \relative c' {
  \clef "treble" \keyTime
  %\tempo 4 = 80
  \override Score.TimeSignature.break-visibility = ##(#t #t #t)
  \unset Staff.explicitKeySignatureVisibility

  \improvisationOn \omit Stem
  \sectionLabel "1 og 2"
  \repeat volta 2 {
    b4 b b b | b b b b | b b b b | b b b b |
    b b b b | b b b b | \time 6/4 b4 b b b b b | \time 5/4 b4 b b b b | 
    \time 4/4 b4 b b b |
  }
  
  \section
  \sectionLabel "3"
  b4 b b b | b b b b | b b b b | b b b b |
  b b b b | b b b b | \time 6/4 b4 b b b b b | \time 5/4 b4 b b b b | 
  \time 4/4 b4 b b b |
  
  \section
  \sectionLabel "4–8"
  \repeat volta 5 {
    \key f \major
    b4 b b b | b b b b | b b b b | b b b b |
    b b b b | b b b b | \time 6/4 b4 b b b b b | \time 5/4 b4 b b b b | 
    \time 4/4
    \alternative {
      \volta 4,5,6,7 { b4 b b b |}
      \volta 8 { b4 b b b |}
    }
  }
  
  \section
  \sectionLabel "9"
  \key ges \major
  b4 b b b | b b b b | b b b b | b b b b |
  b b b b | b b b b | \time 6/4 b4 b b b b b | \time 5/4 b4 b b b b | 
  \time 4/4 b1 | \fine
  
}

PartVoiceMelodyChords = \chords {
  e2 fis:m7 | 
  e/gis a | 
  e/b a4/cis b/dis | 
  e1 | 
  dis2:m7.5- gis4:7sus4 gis:7 |
  a2:6 ais:dim | 
  e/b b4 e2. | 
  e4/gis cis2:m b2 | 
  e1
  
  e2/b b |
  e1/b | 
  e2/b b |
  e1/b |
  e4/b c:dim cis:m b |
  a2 fis:m |
  e2/b b4 e2. |
  e4/gis cis2:m b2 | 
  e2 c:7
  
  f2 g:m7 | 
  f/a bes | 
  f/c bes4/d c/e | 
  f1 | 
  e2:m7.5- a4:7sus4 a:7 |
  bes2:6 b:dim | 
  f/c c4 f2. | 
  f4/a d2:m c2 |
  
  \alternative {
    \volta 4,5,6,7 { f1 }
    \volta 8 { f2 des:7 | }
  }
  
  
  ges2 as:m7 | 
  ges/bes ces | 
  ges/des ces4/es des/f | 
  ges1 | 
  f2:m7.5- bes4:7sus4 bes:7 |
  ces2:6 c:dim | 
  ges/des des4 ges2. | 
  ges4/bes es2:m des2 | 
  ges1
  
}

Score = <<
  \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}
  \context Voice = "PartVoiceMelody" { \PartVoiceMelody }
>>

\header {
  
}

\score {
  \Score
}