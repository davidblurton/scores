\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title =  "Mary Did You Know"
  subtitle = ""
  tagline =  ""
  composer = "Mark Lowry"
  arranger = "arr. David Blurton"
}

\paper {
  system-system-spacing.basic-distance = #15
  markup-system-spacing.basic-distance = #20
}

keyTime = { \time 4/4 \key f \major }

slash = {
        \improvisationOn \omit Stem
        b4
        \undo \omit Stem \improvisationOff
}

sb = {
 \slash \slash \slash \slash | 
}

PartVoiceMelody = \new Voice \with {
  \consists Pitch_squash_engraver
} \relative c'' {
  \clef "treble" \keyTime
  \tempo 4 = 100
  
  
  \section
  \sectionLabel "Intro"
  \partial 2 d8-"piano" e f g |
  a2. \slash | \sb | \sb | \sb | \break
  
  
  \section
  \sectionLabel "Verse 1"
  -"+acc. guitar"\sb | \sb | \sb | \sb | 
  \sb | \sb | \sb | \sb | 
  
  \sb | \sb | \sb | \sb |
  \sb | \sb | \sb | \sb-"+drums +bass" |
  
  \section
  \sectionLabel "Verse 2"
  \sb | \sb | \sb | \sb | 
  \sb | \sb | \sb | \sb | 
  
  \sb | \sb | \sb | \sb | 
  \sb | \sb | \sb | \sb | 
  
  \section
  \sb | \sb | \sb | \< \sb \! |
  
  \section
  \sectionLabel "Bridge"
  
  \sb | \sb | \sb | \sb | 
  \sb | \sb | \sb | \sb | \sb | \> \sb \! | 
   
  \section
  \sectionLabel "Verse 3"
  \sb | \sb | \sb | \sb | 
  \sb | \sb | \sb | \sb | 
  
  \sb | \sb | \sb | \sb | 
  \sb | \sb | \< \sb | \sb \! | 
  
  \section
  \sectionLabel "Outro"
  d,,2-"elec. guitar" e4 f | c'2 bes4 a | g1 | \sb |
  d,2 e4 f | c'2 bes4 a | g1\> |-"rit."\! \sb | 
  
  \improvisationOn \omit Stem b1 \fermata
  \fine
  
}

PartVoiceMelodyChords = \chords {
  \set chordChanges = ##t
  
  \partial 2 \skip2 |
  d1:m | c | bes | a2:7sus4 a:7 |
  
  d1:m | c | bes | a2:7sus4 a:7 |
  d1:m | c | bes | a2:7sus4 a:7 |
  
  g1:m7 | c | f2 f/a | bes1:maj7 |
  g1:m7 | g:m7 | a:7sus4 | a:7 |
  
  d1:m | c | bes | a2:7sus4 a:7 |
  d1:m | c | bes | a2:7sus4 a:7 |
  
  g1:m7 | c | f2 f/a | bes1:maj7 |
  g1:m7 | g:m7 | a:7sus4 | a:7 |
  
  d1:m | c | bes | a2:7sus4 a:7 |
  
  bes1 | c | d:m | d:m |
  bes1 | c | a:7sus4 | a:7sus4 | a:7 | a:7 |
  
  d1:m | c | bes | a2:7sus4 a:7 |
  d1:m | c | bes | a2:7sus4 a:7 |
  
  g1:m7 | c | f2 f/a | bes1:maj7 |
  g1:m7 | g:m7 | a:7sus4 | a:7 |
  
  d2:m c4/e f | bes1:maj7 | g:m7 | e2:m7.5- a:7 |
  d2:m c4/e f | bes1:maj7 | g:m7 | a2:7sus4 a:7 |
  
  d1:m |
}

Score = <<
  \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}
  \context Voice = "PartVoiceMelody" { \PartVoiceMelody  }
>>

\bookOutputSuffix "F"

\score {
  \Score
}  