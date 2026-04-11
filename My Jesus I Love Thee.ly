\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"
%\include "./stylesheet/jazzchords.ily"

\header {
  %\pointAndClickOff
  title =  "My Jesus I Love Thee"
  subtitle = "from the album \"I Surrender All\""
  tagline =  ""
  composer = "Carman"
  copyright = "David Blurton"
}

\paper {
  markup-system-spacing.basic-distance = #22
  system-system-spacing.basic-distance = #18
  print-page-number = ##f
}

keyTime = { \time 4/4 \key f \major }

PartVoiceMelody = \new Voice \with {
  \consists Pitch_squash_engraver
} \relative c' {
  \clef "treble" \keyTime
  \tempo 2 = 60
  
  \sectionLabel "Intro"
  \section
      
    \stemDown f,8 c' f \stemUp c'8\noBeam  f4~f8 c8 | \stemNeutral bes4. a16 g  a4. g16 a | a2.~ a8 bes16 a | g1 \break
    f2 c' | bes a | g1~ | g2 f'4\< g8 a | \break
    
    a1\!-"+ bass" | bes2. bes4 | a2. g4 | f2 bes,4 f'8 e16 d | \break 
    c2 bes | a g | f1~ | f1\> | \break  
    
    \improvisationOn \omit Stem
    
    \section 
    \sectionLabel "A"
  
    b4\!-"piano only" b b b | b b b b | b b b b | b b b b | \break
    b4 b b b-">" | b b b b | b b b b | b b b b | \break
    b4 b b b | b b b b | b b b b | b b b b | \break
    b4 b b b | b b b b | b b b b | b b b b | \break
    b4-"+ bass" b b b | 
    
    \improvisationOff \undo \omit Stem
    a4 g g f | f ees d c | b \improvisationOn \omit Stem b b b | \break
    b4 b b b | b b b b | b b b b | b b b b | \break
    b4 b b b | b b b b | b b b b | b b b b | \break
    b4 b b b | b b b b | \break
    
    \section
    
    \improvisationOff \undo \omit Stem
    r4 r8 c'8 f4~f8 c8 | bes1 | r4-"+ drums" r8 c8 f4~f8 c8 | bes1\< | \break
    \improvisationOn \omit Stem
    
    \repeat volta 3 {
    \section
    \sectionLabel "A2"
    b4-"band in"\! b b b | b b b b | b b b b | b b b b \break
    b4 b b b | b b b b | b b b b | b b b b | \break
    b4 b b b | b b b b | b b b b | b b b b | \break
    b4 b b b | b b b b | b b b b | b b b b | \break
     
    \section
    b-"4/4 feel" b b b | 
    \improvisationOff \undo \omit Stem
    a4 g g f | 
    f ees d c | b \improvisationOn \omit Stem b b b | \break
    

    b4 b b b | b b b b | b b b b | b b b b | \break
    b4 b b b | b b b b | b b b b | b b b b | \break
                    
    \alternative {
        \volta 1,2 {
          b4 b b b | b b b b | \break
          \section
          \improvisationOff \undo \omit Stem          
    r4 r8 c'8 f4~f8 c8 | bes1 | r4 r8 c8 f4~f8 c8 | bes1 | \break
    \improvisationOn \omit Stem
        }
        


        \volta 3 {
    b4 b b b | 
        }
    }
    
    
    }
    
    
    b\> b b b | b-"rit."\! b b b | b b b b | \break
    b4 b b b | b b b b | b1 | \fine      
    
}

PartVoiceMelodyChords = \chords {
  f2 f/e | bes/d f/c | bes1:maj7 | c1:sus4
  f1/a | bes2 g/b | c1 | c2 bes/c |
  f1 | bes/d | f2./c a4:7/cis | d2:m bes |
  f2/a bes/d | f/c c:7 | bes1/f | f |
  
  % A section
  f1 | bes/f | f2. bes4/f | f1 |
  g1:m7 | c2:6 c:7 | f2 f/e | bes1/d |
  f1 | bes/f | a:7 | d:m7 |
  g1:m7 | c2:6 c:7 | bes1/f | f |
  a1:m7 | bes2:maj7 f/a | ees/g d/fis | g/f c:7/e |
  f1 | bes | f/c | c2:7 bes/c |
  
  %page 2
  f1 | bes/d | f2./c a4:7/cis | d1:m |
  f2/a bes | f/c c:7 |
  
  f1 | bes/f | f2 f/e | bes1/d |
  
  % A2 section
  \repeat volta 3 {
    
  f1 | bes/f |
  f2. bes4/f | f2 g:7 | c1 | c1 |
  f1 | bes2/f f | f1 | bes/f |
  f2. bes4/f | f2 g:7 | c1 | c1 |
  bes1/f | f | 
  
  f1/a | bes2 f/a | 
  ees/g d/fis | g/f c:7/e | f1 | bes |
  f/c | c2:7 bes/c | f1 | bes/d |
  a:7/cis | d:m7 | 
  
  \alternative {
   \volta 1,2 {
     f2/a bes | f/c c:7 | 
     f1 | bes/f | f2 f/e | bes1/d |
   } 
   \volta 3 { f2/a bes | 
  }
  }
  
  }
  
  f/c a:7/cis | d1:m7 | g:7 | f2/a bes | f/c c | 
  f1
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