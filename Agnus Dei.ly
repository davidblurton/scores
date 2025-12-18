\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  \pointAndClickOff
  title =  "Agnus Dei"
  subtitle = ""
  tagline =  ""
  composer = \markup \column {
  \right-align \line { Michael W. Smith }
  \vspace #-.2
  \right-align \line { ísl. texti: Guðlaugur Gunnarsson }
}
  copyright = "tölvusetning: David Blurton"
}

\paper {
  markup-system-spacing.basic-distance = #25
}

keyTime = { \time 4/4 \key e \major }

PartVoiceMelody =  \relative c' {
  \clef "treble" \keyTime
  \tempo 4 = 66

    r2 r4 fis8. gis16 | 
    \sectionLabel Viðlag
    \repeat volta 2 {
    gis2 r4 fis8. gis16 |
    gis2 r4 e8 gis |
    \tuplet 3/2 { a4 gis2~ } gis8 fis16( e) e8. fis16 |
    fis2 r4 fis16 gis fis e |
    cis2 r4 fis16 gis fis e |
    cis2 cis8 dis e fis16( gis) |
    gis2 r4 fis8. gis16 |
    gis2 r4 e8 gis |
    \tuplet 3/2 { a4 gis2~ } gis8 fis16( e) e8. fis16 |
    fis2 r4 fis16 gis fis e |
    cis2 r4 fis16 gis fis e |
    \alternative {
      \volta 1 { cis2 cis8 dis e fis16( gis) | }
      \volta 2 { cis,4 r4 cis (dis) | e1 \fine }
    }
    }
    
    
    
    
}

PartVoiceMelodyLyrics = \lyricmode {
  Ho -- ly, Ho -- ly
  Are You Lord God, Al -- might -- y
  Wor -- thy is the Lamb, wor -- thy is the Lamb
  You are Ho -- ly, Ho -- ly
  Are You Lord God, Al -- might -- y
  Wor -- thy is the Lamb, wor -- thy is the Lamb
    You are Ho -- 
    Lamb. A -- men.
}

PartVoiceMelodyIsLyrics = \lyricmode {
  
Heil -- ag -- \repeat volta 2 { ur, heil -- ag -- ur 
ert þú Drott -- inn Guð alls -- herj -- ar!
Verð -- ugt er Guðs lamb!
Verð -- ugt er Guðs lamb!
Þú ert heil -- ag -- ur; heil -- ag -- ur 
ert þú Drott -- inn Guð alls -- herj -- ar!
Verð -- ugt er Guðs lamb!
Verð -- ugt er Guðs
  \alternative {
      \volta 1 { lamb! Þú ert heil -- ag }
      \volta 2 { lamb! A -- men.  }
  }
  }

}

PartVoiceMelodyChords = \chords {
  b1
  e2. b4/e | 
  e1 |
  a4/e e2 cis4:m | 
  b1 |
  a1 |
  a1 |
  e2. b4/e | 
  e1 |
  a4/e e2 cis4:m | 
  b1 |
  a1 |
  a1 |
  a1 |
  e1
  
}

Score = <<
  \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}
  \context Voice = "PartVoiceMelody" { \PartVoiceMelody }
  %\new Lyrics \lyricsto "PartVoiceMelody" { \PartVoiceMelodyLyrics }
  \new Lyrics \lyricsto "PartVoiceMelody" { \PartVoiceMelodyIsLyrics }
>>

\header {
  key = "E"
}

\bookOutputSuffix "E"

\score {
  \Score
}