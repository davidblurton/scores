\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title = "I'm Old Fashioned"
  subtitle = "As played by Barry Harris on \"Solo\""
  tagline = "Transcribed by David Blurton"
  composer = "Mercer / Kern"
}

\layout {
  
\context {
    \Voice
    \consists "Horizontal_bracket_engraver"
    %\override HorizontalBracket.direction = #UP
  }
}

\paper {
  system-system-spacing.basic-distance = #15
}

<<
  \chords {
    f1 | g2:m7 c:7 | f1:maj7 | g2:m7 c:7 |
    f1 | f1 | e:m7 | a:7 |
    d1:m7 | g:7 | d:m7 | g:7 |
    g1:m7 | des:7.11+ | g:m7 | c:7 |
    f1 | g2:m7 c:7 | f1:maj7 | b2:m7 e:7 |
    a2:maj7 b:m7 | cis:m7 d:7 | e:7 fis:dim | g:m7 c:7
    f1 | g2:m7 c:7 | f1:maj7 | g2:m7 c:7 |
    c2:m7 f:7 | bes:maj7 bes:m6 | f1 | b2:m7.5- bes:m6 |
    a2:m7 d:m7 | g:m7 c:7 | f
  }
  
  \new Staff \relative c' { 
    \time 4/4 \key f \major
    f2. c4 | 
    c4 c2 c4 |
    a'2. c,4 | 
    c4 c2 c4 | \break
    bes'2. a4 | 
    c,4 c2 a'4 |
    g1~ | 
    g2. e4 | \break
    g2. f4 |
    e2. d4 |
    g4 a g f |
    e2. d4 | \break
    bes'4 c bes a |
    g2 f2 |
    c'1~ |
    c2. r4 | \break
    d2. f,4 | 
    f4 f2 e4 |
    a2. e4 | 
    e4 e2 d4 | \break
    cis4 a d2 |
    e4 cis fis2 |
    gis4 e a2 |
    bes4 g c2 | \break
    f,2. c4 | 
    c4 c2 c4 |
    a'2. c,4 | 
    c4 c2 c4 | \break
    c'4 d c f, | 
    a2. g4 |
    c4 d c f, | 
    a2. g4 | \break
    c2. c,4 |
    c4 c2 c4 |
    f1~ |
    f2 r2 | \fine
    
  }
>>

