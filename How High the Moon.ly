\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\layout {
  \context {
    \Staff
    \consists "Horizontal_bracket_engraver"
    \override HorizontalBracket.direction = #DOWN
    \override HorizontalBracket.Y-offset = #-6
    \override HorizontalBracket.bracket-flare = #'(0 . 0)
  }
}

\paper {
  markup-system-spacing.basic-distance = #25
  system-system-spacing.basic-distance = #18
}

\header {
  title = "How High the Moon"
  subtitle = "Solo by Chris Parks"
  tagline = "https://www.youtube.com/watch?v=0stw0U6ujBA"
  composer = "Transcribed by David Blurton"
}

<<
  \chords {
    s1 | g:maj7 | s1 | g:m7 | c:7 |
    f:maj7 | s1 | f:m7 | bes:7 |
    ees:maj7 | a2:m7.5- d:7 | g1:m | a2:m7.5- d:7 |
    g1:maj7 | a2:m7 d:7 | b:m7 bes:7 | a:m7 d:7
    g1:maj7 | s1
  }
  \new Staff \relative c'' {
    #(set-accidental-style 'voice)
    \key g \major

    % Starts 6:22 https://www.youtube.com/watch?v=0stw0U6ujBA
    r4-"6:22" d4 g a |
    a4. b8~ b2 |
    r8 d,8 cis d g4 a8 bes~ |
    bes8 c a aes g f d dis |
    e cis bes b c bes g gis |
    a f \tuplet 3/2 { d des c } g' e f c |
    c8 c8~ c4 r2 |
    r8 f \tuplet 3/2 { aes c ees } c8 d ees c |
    d f aes c aes4 bes8 aes | \break
    \acciaccatura fis g4 bes r8 c, ees bes' |
    a g fis ees d c a c |
    bes g r4 d8 e g bes |
    d,8 e g bes fis a c ees |
    d c a ais b r8 r4 |
    r8 f' e d \tuplet 3/2 {c16 d c} b8 gis e |
    a8 b c d e b' ais b |
    \tuplet 3/2 { a16 b a } g8 e f fis e c cis |
    d c a ais b g e d |
    a' fis g d r2 | r1-"anyway..."
    \fine |
  }
>>