\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title =  "María vissir þú"
  subtitle = "Mary Did You Know"
  tagline =  ""
  composer = "Mark Lowry"
  arranger = "úts. David Blurton"
}

\paper {
  system-system-spacing.basic-distance = #15
  markup-system-spacing.basic-distance = #20
}

keyTime = { \time 4/4 \key c \major }

sb = {
 b4 b4 b4 b4
}

PartVoiceMelody = \new Voice \with {
  \consists Pitch_squash_engraver
} \relative c'' {
  \clef "treble" \keyTime
  \tempo 4 = 100
  \improvisationOn \omit Stem
  
  \section
  \sectionLabel "Intro"
  b4-"acc. guitar" b4 b4 b4 | \sb | \sb | \sb | \break
  
  
  \section
  \sectionLabel "Verse 1"
  \sb | \sb | \sb | \sb | 
  \sb | \sb | \sb | \sb | 
  
  \sb | \sb | \sb | \sb |
  \sb | \sb | \sb | \sb |
  
  \section
  \sectionLabel "Verse 2"
  b4-"+drums +bass" b4 b4 b4 | \sb | \sb | \sb | 
  \sb | \sb | \sb | \sb | 
  
  \sb | \sb | \sb | \sb | 
  \sb | \sb | \sb | \sb | 
  
  \section
  \sb | \sb | \sb | b4\< b4  b4 b4\! |
  
  \section
  \sectionLabel "Bridge"
  
  \sb | \sb | \sb | \sb | 
  \sb | \sb | \sb | \sb | \sb | b4\> b4 b4 b4\! | 
   
  \section
  \sectionLabel "Verse 3"
  \sb | \sb | \sb | \sb | 
  \sb | \sb | \sb | \sb | 
  
  \sb | \sb | \sb | \sb | 
  \sb | \sb | b4 \> b4 b4 b4 | b4 b4 b4 b4\! | 
  
  b1 \fermata
  \fine
  
  \undo \omit Stem \improvisationOff
}

PartVoiceMelodyChords = \chords {
  \set chordChanges = ##t
  
  a1:m | g | f | e2:7sus4 e:7 |
  
  a1:m | g | f | e2:7sus4 e:7 |
  a1:m | g | f | e2:7sus4 e:7 |
  
  d1:m7 | g | c2 c/e | f1:maj7 |
  d1:m7 | d:m7 | e:7sus4 | e:7 |
  
  a1:m | g | f | e2:7sus4 e:7 |
  a1:m | g | f | e2:7sus4 e:7 |
  
  d1:m7 | g | c2 c/e | f1:maj7 |
  d1:m7 | d:m7 | e:7sus4 | e:7 |
  
  a1:m | g | f | e2:7sus4 e:7 |
  
  f1 | g | a:m | a:m |
  f1 | g | e:7sus4 | e:7sus4 | e:7 | e:7 |
  
  a1:m | g | f | e2:7sus4 e:7 |
  a1:m | g | f | e2:7sus4 e:7 |
  
  d1:m7 | g | c2 c/e | f1:maj7 |
  d1:m7 | d:m7 | e:7sus4 | e:7 |
    
  a1:m |
}

Score = <<
  \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}
  \context Voice = "PartVoiceMelody" { \PartVoiceMelody  }
>>

\bookOutputSuffix "F"

\score {
  \Score
}  