\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title =  "Blessunarorðin"
  subtitle = "The Lord bless you and keep you"
  tagline =  ""
  arranger = "úts. Óskar Einarsson"
}

keyTime = { \time 4/4 \key bes \major }

\layout {
  \context {
    \Score \RemoveAllEmptyStaves
    \override BarNumber.padding = 2 % Stop bar numbers colliding with braces
  }
}

\paper {
  system-system-spacing.basic-distance = #18
}

PartVoiceMelody =  \relative d' {
  \clef "treble" \keyTime | % 1
  \override Score.MetronomeMark.X-offset = #2
  \tempo "Largo"
  r2 r8 d8 d8 d8~ | % 2
  d4  es8  es8~ es2 | % 3
  r2  r4  f4 | % 4
  f4  g8  es8~ es2 \break | % 5
  r4 f8  f8  f8 f8~
  f8 f16 f16 | % 6
  f4 f8 f8 bes4  d,4 | % 7
  d2.  c4 | % 8
  c1 \break | % 9
  <<
    {
      \voiceOne
      r4 r8  d8  d8  d8 ~  d8  d8
      ~ | \barNumberCheck #10
      d4  es8  es8 ~  es2 | % 11
      r4  f8  f8  f8  f8  f8
      bes8 ~ \break | % 12
      bes4  bes8  bes8  a4  g4 | % 13
      f4.  f8  bes8  bes8
    }
    \new Voice \relative bes
    {
      \voiceTwo
      r4 r8 bes8 bes8 bes8 ~
      bes8 bes8 ~ | \barNumberCheck #10
      bes4 c8 c8 ~ c2 r4
      d8 d8 c8 c8
      d8 g8 ~ \break | % 12
      g4 g8 g8 f4
      es4 | % 13
      d4. d8 g8[ g8]

    }
  >>

  \oneVoice es,8 d8 ~ | d2 g4( c,8  bes8) \break | % 15
  bes1 ~ | % 16
  bes1 \bar ":|."

  <g bes f'>1
  <f bes f'>1
  \bar "||"

  <bes ees f>1
  <bes d f>1 \bar "|."
}

PartVoiceMelodyLyrics = \lyricmode {
  Drott -- inn bless -- i "þig!" og "varð" -- veit --
  i Drott -- inn "lát" -- i "sín" -- a "á" -- "sjó" -- nu
  "lý" -- sa yf -- ir "þig"
  og "sé" "þér" "náð" -- ug --
  "ur!"  "Sín" -- u aug -- lit -- i upp -- ly -- fti yf --
  ir "þig" og ge -- fi "þér" "fríð!"
  A -- men A -- men A -- men
}

PartVoiceTenor =  \relative f {
  \clef "bass" \keyTime | % 1
  R1*4 \break | % 5
  R1*4 \break | % 9
  r4 r8  f8  f8 f8 ~  f8
  f8 ~ ] | \barNumberCheck #10
  f4  g8  g8 ~  g2 | % 11
  r4  bes8  bes8  bes8
  bes8  bes8  d8 ~ \break | % 12
  d4  d8  d8  c4
  bes4 | % 13
  bes4.  bes8  es8  es8
  es8  d8 ~  | % 14
  d2  bes4(  a8  bes8)
  \break | % 15
  bes1 ~ | % 16
  bes1 |
  <bes, ees>1
  <bes d>1 |
  <bes g'>1
  <bes f'>1 |
}

PartVoiceMelodyChords = \chords {
  bes | % 2
  c:m/+bes | % 3
  bes/+d | % 4
  es | % 5
  bes2/+d es2 | % 6
  bes2/+f g2:m7 | % 7
  bes2/+c c2:9 | % 8
  es4/+f s4 d4:m/+f es4/+f | % 9
  bes1 | \barNumberCheck #10
  c:m/+bes | % 11
  bes2/+d d4:7.9+ bes4/+d | % 12
  es2:maj7 f4/+es es4 | % 13
  bes2/+d es4 fis8:dim g8:m7 | % 14
  s2 es2/+f | % 15
  es1/+bes | % 16
  bes2. es4/+f |
  es1:2/+bes | % 17
  bes1
  es1:2/+bes | % 19
  bes1
}

\score {
  <<
    \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}
    \new ChoirStaff
    <<
      \context Staff = "1" \with { \consists Merge_rests_engraver }
      <<
        \context Voice = "PartVoiceMelody" { \PartVoiceMelody }
        \new Lyrics \lyricsto "PartVoiceMelody" { \PartVoiceMelodyLyrics }
      >> \context Staff = "2"
      \context Voice = "PartVoiceTenor" { \PartVoiceTenor }
    >>
  >>
}

