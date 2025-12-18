\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  \pointAndClickOff
  title =  "Í Betlehem"
  subtitle = ""
  tagline =  ""
  composer = "úts. Óskar Einarsson"
  copyright = "tölvus. David Blurton"
}

\paper {
  %markup-system-spacing.basic-distance = #25
}

keyTime = { \time 4/4 \key e \major }

PartVoiceMelody =  \relative c' {
  \clef "treble" \keyTime
  \tempo 4 = 88

r2 r4 b4 |
\repeat volta 4 {
<gis b e>4 <gis b> <a b e> <a cis fis> |
<b e gis>8 <cis e a> <b e gis> <a dis fis> <gis b e>2 |
<<
  {
    \voiceOne
    <gis' b>2 a2
  }
  \new Voice {
    \voiceTwo
    e2 <cis e>4 <dis fis>
  }
>>
\oneVoice
<b e gis>2 r4 <cis e a> | 
<bis dis gis>4 <gis dis' fis> <gis cis e> <gis b dis> | \break
<a cis fis> <a cis e> <g ais cis>2 |
\time 6/4 <gis b>4 <gis b e> <a cis fis> <b e gis>2. |
\time 5/4 <b e gis>4 <gis cis e>2 
<<
  {
    \voiceOne
    <fis dis'>2
  }
  \new Voice {
    \voiceTwo
    cis'4 b
  }
>> |
\oneVoice \time 4/4

    \alternative {
      \volta 1,2,3 { <gis b e>2. b4 | }
      \volta 4 { <gis b e>2. c4 | } 
    }
}
\section
\unset Staff.explicitKeySignatureVisibility
\key f \major
\repeat volta 2 {
<a c f>4 <a c> <bes c f> <bes d g> |
<c f a>8 <d f bes> <c f a> <bes e g> <a c f>2 |
<<
  {
    \voiceOne
    <a' c>2 bes2
  }
  \new Voice {
    \voiceTwo
    f2 <d f>4 <e g>
  }
>>
\oneVoice
<c f a>2 r4 <d f bes> | 
<cis e a>4 <a e' g> <a d f> <a c e> | \break
<bes d g> <bes d f> <as b d>2 |
\time 6/4 <a c>4 <a c f> <bes d g> <c f a>2. |
\time 5/4 <c f a>4 <a d f>2 
<<
  {
    \voiceOne
    <g e'>2
  }
  \new Voice {
    \voiceTwo
    d'4 c
  }
>> |
\oneVoice \time 4/4
<a c f>2. c4 |
}
}

PartVoiceMelodyLyrics = \lyricmode {
  
}

PartVoiceMelodyIsLyrics = \lyricmode {
  
}

PartVoiceMelodyChords = \chords {
  s1 | e2 fis:m7 | e/gis a | e/b a4/cis b/dis | e1 | dis2:m7.5- gis4:7sus4 gis:7 |
  a2:6 ais:dim | e/b b4 e2. | e4/gis cis2:m b2 | e1
  
}

Score = <<
  \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}
  \context Voice = "PartVoiceMelody" { \PartVoiceMelody }
  \new Lyrics \lyricsto "PartVoiceMelody" { \PartVoiceMelodyLyrics }
>>

\header {
  
}

\bookOutputSuffix "E"

\score {
  \Score
}