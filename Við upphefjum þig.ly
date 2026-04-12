\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"
#(set-global-staff-size 21)

\header {
  title =  "Við upphefjum þig"
  subtitle = "I worship you Almighty God"
  tagline =  ""
  composer = "Pete Sanchez, Jr."
  arranger = "úts. David Blurton"
}

\paper {
  markup-system-spacing.basic-distance = #25
}

keyTime = { \time 4/4 \key d \major }

PartVoiceMelody =  \relative c' {
  \clef "treble" \keyTime
  \tempo 4 = 70
  \partial 2.
  r8 a8 d4 fis | 
  g2. (fis4) |
  e4 a,8 a \tuplet 3/2 {cis4 (d) e} |
  fis2. (e4) |
  d4 r4 \tuplet 3/2 {d e fis} |
  g4 g4~ g4 g8 fis |
  e2 d4 b |
  a2 r2 |
  
  r4 r8 a8 d4 fis | \break
  g2. (fis4) |
  e4 a,8 a \tuplet 3/2 {cis4 (d) e} |
  fis2. (e4) |
  d4 r4 \tuplet 3/2 {d e fis} | \break
  g4 g4~ g4 g8 fis |
  e2 d4 cis |
  d1~ |
  d2 a'4 a4 | \break
  
  %chorus
  \repeat volta 2 {
    \sectionLabel Viðlag
    a4. a8 a2~ |
    a4 r4  a a |
    a4. a8 a2~ |
    a4 r4 a a | 
    a4. g8 g2~ | 
    g4 r4 fis (a) |
    a1~ |
    \alternative {
      {a4 r4 a a |}
      {a4 r4 r2 \fine }
    } 
  }
}

PartVoiceMelodyLyrics = \lyricmode {
Þú ert hinn hæst -- i,
yf -- ir all -- an heim -- inn.
Þitt nafn upp -- haf -- ið,
yf -- ir öll önn -- ur nöfn.

Þú ert hinn hæst -- i,
yf -- ir all -- an heim -- inn.
Þitt nafn upp -- haf -- ið,
yf -- ir öll önn -- ur nöfn.

Við upp -- hefj -- um þig
Við upp -- hefj -- um þig
Við upp -- hefj -- um þig
ó, Guð.

Við upp
}

PartVoiceMelodyChords = \chords {
  \set chordChanges = ##t
  \partial 2.
  s2.
  e1:m7 | 
  a2:7sus4 a:7 |
  d2. a4/cis |
  b1:m7 |
  e1:m7 | 
  a2:7 a:7sus4 |
  d2 d:sus4 |
  d2 b:m7 |
  
  e1:m7 | 
  a2:7sus4 a:7 |
  d2 fis:7 |
  b1:m7 |
  e1:m7 | 
  a2:7 a:7sus4 |
  d2 d:sus4 |
  d2 a:7sus4 |
  
  d1 |
  d1 |
  a1 |
  a1 |
  g1 |
  e2:m7 a:7sus4 |
  d2 d:sus4 |
  d2 a:7sus4 |
  
  d1 |
}

Score = <<
  \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}
  \context Voice = "PartVoiceMelody" { \PartVoiceMelody }
  \new Lyrics \lyricsto "PartVoiceMelody" { \PartVoiceMelodyLyrics }
>>

\header {
  %key = "D"
}

\bookOutputSuffix "D"

\score {
  \Score
}  

\book {
  \bookOutputSuffix "F"
  \header {
    key = "F"
  }
  
  \score {
    \transpose e f {
      \Score
    }
  }  
}