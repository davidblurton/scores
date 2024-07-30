\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title =  "Ég lofa þig, þú mikli Guð"
  subtitle = "I worship you Almighty God"
  tagline =  ""
  composer = "Sondra Corbett"
  arranger = "úts. David Blurton"
}

\paper {
  markup-system-spacing.basic-distance = #30
}

keyTime = { \time 4/4 \key e \major }

PartVoiceMelody =  \relative c' {
  \clef "treble" \keyTime
  \tempo 4 = 60

  \partial 4
  b4 \bar "||" |
  fis'4. e8 e4. b8 | % 2
  fis'4. e8 e4 r4 | % 3
  r4 gis8 [ fis8 ] e4 cis4 | % 4
  b2 r4 r8 b8 \break | % 5
  fis'4. e8 e4 r8 b8 | % 6
  fis'4. gis8 e4 r4 | % 7
  r4 cis8 [ dis8 ] e4 fis4 | % 8
  gis4. a8 fis4 r8 b,8 \break | % 9
  a'4. gis8 gis2 ~ | \barNumberCheck #10
  gis4 r4 cis,8 [ dis8 ] e8 [
  fis8 ] | % 11
  gis4. a8 fis2 ~ | % 12
  fis4 r4 r4 b,4 \break | % 13
  fis'4. e8 e4 r8 b8 | % 14
  fis'4. e8 e4 r4 | % 15
  r4 gis8 [ fis8 ] e4 dis4 | % 16
  e2. 
  
  \new CueVoice {
    b4
  }
  
  \bar "|." |
}

PartVoiceMelodyLyrics = \lyricmode {
  Ég lo -- fa þig, þú mi -- kli Guð eng -- inn er sem þú.
  Ég lo -- fa þig þú fri -- ðar -- prins Það eitt vil ég ge -- ra nú.
  Ég gef þér allt því þú ert mitt rétt -- læ -- ti
  Ég lo -- fa þig, þú mik -- li Guð eng -- inn er sem þú.
}

PartVoiceMelodyChords = \chords {
  \partial 4 s4 |
  e1 |
  b2/+cis cis2:m7 |
  fis2:m7 a/+b |
  e2 fis4:m7 a4/+b |
  e1  |
  b2/+cis cis:m7 |
  fis1:m7 |
  b1:7 |
  e2:sus4 e4 b/+dis | \barNumberCheck #10
  cis1:m7 |
  fis1:m7 |
  a2/+b b:7 |
  e1 |
  b2/+cis cis:m7 |
  fis2:m7 a/+b |
  e2 fis4:m7 a4/+b \bar "|."
}

\book {
  \bookOutputSuffix "E"
  \header {
      key = "E"
  }
  \score {
    <<
      \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}
      \context Voice = "PartVoiceMelody" { \PartVoiceMelody }
      \new Lyrics \lyricsto "PartVoiceMelody" { \PartVoiceMelodyLyrics }
    >>
  }  
}

\book {
  \bookOutputSuffix "F"
  \header {
      key = "F"
  }
  \score {
    <<
      \context ChordNames = "PartVoiceMelodyChords" { \transpose e f { \PartVoiceMelodyChords} }
      \context Voice = "PartVoiceMelody" { \transpose e f {  \PartVoiceMelody } }
      \new Lyrics \lyricsto "PartVoiceMelody" { \PartVoiceMelodyLyrics }
    >>
  }  
}