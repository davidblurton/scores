\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"
\pointAndClickOff

\header {
  title =  "Mary Did You Know"
  subtitle = "Ellý"
  tagline =  ""
  composer = "Mark Lowry"
  arranger = "tölvus. David Blurton"
}

\paper {
  system-system-spacing.basic-distance = #15
  markup-system-spacing.basic-distance = #22
}

keyTime = { \time 4/4 \key c \major }

PartVoiceMelody = \new Voice \with {
  \consists Pitch_squash_engraver
} \relative c'' {
  \clef "treble" \keyTime
  \tempo 4 = 100
  \improvisationOn \omit Stem
  
  \section
  \sectionLabel "Intro"
  b4-"ac. guitar only" b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | 
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b2\fermata | 
  
  
  \section
  \sectionLabel "Verse 1"
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | 
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | 
  
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 |
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 |
  
  \section
  \sectionLabel "Verse 2"
  b4-"+pad" b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | 
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | 
  
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | 
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b1 | 
  
  \section
  \sectionLabel "Instrumental"
  b4-"band in" b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | 
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4\< b4 b4 b4 | 
  
  \section
  \sectionLabel "Bridge"
  b4\! b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | 
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b1~\> | b1 | 
   
  \section
  \sectionLabel "Verse 3"
  b4-"band out"\! b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | 
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | 
  
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4-"rit." b4 b4 b4 | b1\fermata | 
  b1 | b1 | b1 | b1 |
  
  \section
  \sectionLabel "Outro"
  b4-"a tempo" b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | 
  b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b4 b4 | b4 b4 b2\fermata | 
  
  b1 \fermata
  \fine
  
  \undo \omit Stem \improvisationOff
}

PartVoiceMelodyChords = \chords {
  \set chordChanges = ##t
  
  a1:m | g | d:m | a2:sus2 e |
  a1:m | g | d:m | a2:sus2 e |
  
  % Verse 1
  a1:m | g | d:m | a2:sus2 e |
  a1:m | g | d:m | a2:sus2 e |
  
  d1:m | g | c2 g/b | a1:m |
  d1:m | d:m | a:sus2 | e |
  
  % Verse 2
  a1:m | g | d:m | a2:sus2 e |
  a1:m | g | d:m | a2:sus2 e |
  
  d1:m | g | c2 g/b | a1:m |
  d1:m | d:m | a:sus2 | e |
  
  % Instrumental
  a1:m | g | d:m | a2:sus2 e |
  a1:m | g | d:m | a2:sus2 e |
  

  % Bridge
  f1 | g | c2 g/b | a1:m |
  f1 | g | a:sus2 | a:sus2 | e | e |
  
  % Verse 3
  a1:m | g | d:m | a2:sus2 e |
  a1:m | g | d:m | a2:sus2 e |
  
  d1:m | g | c2 g/b | a1:m |
  d1:m | d:m | a:sus2 | e |
  
  %Outro
  a1:m | g | d:m | a2:sus2 e |
  a1:m | g | d:m | a2:sus2 e |
    
  a1:m |
}

Score = <<
  \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}
  \context Voice = "PartVoiceMelody" { \PartVoiceMelody  }
>>

\score {
  \Score
}  