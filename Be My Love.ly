\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title = "Be My Love"
  %subtitle = "Solo by Chris Parks"
  %tagline = "Things I've Learned from Barry Harris Episode 14"
  %composer = "Transcribed by David Blurton"
}

\layout {
  %ragged-last = ##t
}

\paper {
  markup-system-spacing.basic-distance = #25
}

keytime = \key ees \major \time 4/4

upper = \relative c'' {
  \clef treble
  \keytime

  r4 r8 bes8 <d, fis a>4 <d f g bes> | 
  aes' g 
}

lower = \relative c {
  \clef bass
\keytime

  r2 r8 bes
}

\score {
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
  \midi { }
}