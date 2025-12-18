\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"
#(set-global-staff-size 24)

\header {
  title =  "Viltu Elska Mig Á Morgun"
  tagline =  ""
  composer = "KK"
  arranger = "úts. David Blurton"
}

\paper {
  markup-system-spacing.basic-distance = #20
}

keyTime = { \time 6/8 \key c \major }

PartVoiceMelody = \relative c'' {
  \clef "treble" \keyTime
  \tempo 4. = 60
  
  \section \sectionLabel Intro
  
  a4. g | \time 3/8 \partial 4. e4 d8 | \time 6/8 c2. |
  r8 c e d4. | a2. \break
  
  \improvisationOn
  \omit Stem
  
  \repeat volta 2 {
  
  \repeat volta 2 {
  
  \section \sectionLabel Verse
  4. 4. | \time 3/8 \partial 4. 4. | \time 6/8 4. 4. |
  4. 4. | \time 3/8 \partial 4. 4. | \time 6/8 4. 4. |
  4. 4. | 4. 4. |
  
  \section \sectionLabel Verse
  4. 4. | \time 3/8 \partial 4. 4. | \time 6/8 4. 4. |
  4. 4. | \time 3/8 \partial 4. 4. | \time 6/8 4. 4. |
  4. 4. | 4. 4. | 4. 4. | 4. 4.
  }
  
  \section \sectionLabel Chorus
  4. 4. | 4. 4. | 4. 4. | 4. 4. | 
  4. 4. | 4. 4. | 4. 4. |  
  
  \alternative {
      \volta 1 { 4. 4. | 4. 4. }
      \volta 2 { 4. 4. }
  }
   }
   
   \repeat volta 2 {
   
 \section \sectionLabel Chorus
  4. 4. | 4. 4. | 4. 4. | 4. 4. | 
  4. 4. | 4. 4. | 4. 4. | 
  
  \alternative {
    \volta 1 { 4. 4. }
      \volta 2 { 4. 4. | 4. 4. }
      
  }
   }
   
  \section \sectionLabel Outro
  4. 4. | 4. 4. | 
  4. 4. | 4. 4. | 
  4. 4. | 4. 4. | \fine
 
  
  \improvisationOff
  \undo \omit Stem
}


PartVoiceMelodyLyrics = \lyricmode {

}

PartVoiceMelodyChords = \chords {
  \set chordChanges = ##f
  f4. c | \partial 4. e:7 | f2. 
  c4. e:7 | f2.
  
  f4. c | \partial 4. e:7 | f2. 
  f4. c | \partial 4. e:7 | f2. 
  c4. e:7 | f2.
  
  f4. c | \partial 4. e:7 | f2. 
  f4. c | \partial 4. e:7 | f2. 
  c4. g | f aes | c g | g:sus4 g |
  
  c2. | g | a:m | f |
  c2. | g | a:m | f | f
  
  f
  
  c2. | g | a:m | f |
  c2. | g | a:m | f |
  f | f
  
  c4. e:7 | f2.
  c4. e:7 | f2.
  bes     | c
}

Score = <<
  \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}

  \new Voice \with {
  \consists Pitch_squash_engraver
} \PartVoiceMelody

>>
\score {
  \Score
}  

\book {
  \bookOutputSuffix "D"
  
  \score {
    \transpose c d {
      \Score
    }
  }  
}