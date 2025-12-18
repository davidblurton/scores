\version "2.18.2"
% #(set-global-staff-size 24)
\include "./stylesheet/jazzchords.ily"
\include "./stylesheet/lilyjazz.ily"
\include "./stylesheet/jazzextras.ily"

\paper {
  #(set-paper-size "letter")
  indent = 0\mm
  left-margin = 1.5\cm
  right-margin = 1\cm
  bottom-margin = 2\cm
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##t
  ragged-right = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Autumn Leaves (Solo)"
composer = #"- Kenny Barron"
meter = #" (Swing)"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
            \override #'(offset . 7)
            \override #'(thickness . 6)
            \underline \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  title = \realBookTitle
  tagline = ##f
}

theNotes = \relative c' {
  \key bes \major
  \numericTimeSignature
  \time 4/4
  \accidentalStyle modern-cautionary
  \override AccidentalCautionary.parenthesized = ##f
  
  r2 \tuplet 3/2 { g'4 a bes } |
  ees8 r8 r4 r2 |
  
  \acciaccatura { c32 bes } aes8 r8 r4 f4 f'8 ees | 
  \acciaccatura cis16 d4 \acciaccatura cis16 d4 \acciaccatura cis16 d4 r4 | 
  r4 d8 bes g4 bes8 d | \break
  c4 c8 b8 c4 g8 fis | 
  r2 r8 c'8 bes4 | 
  g4 g4 r2 | 
  r8 <g g'> r8 <bes bes'> r8 <g g'> r8 <d~ d'~> | \break
  <d d'>2 bes'8 g r4 |
  r2 f4 f'8 ees |
  cis d bes aes ges d des b |
  bes g' d g, f' ees g, bes | \break
  b4 d8 des c bes a4 | 
  aes8 bes c e aes c ees des |
  d4 a8 c \tuplet 3/2 { bes16 c bes } g8 fis8 a |
  g4 r8 g8 fis4 g | \break
  
  a4 d, a' r4 | 
  r4 r8 d,8 a' b g a | 
  bes4 d, bes' r4 | 
  r2 r8 bes8 a bes | \break
  c4 f, \acciaccatura fis16 <g c>4 r4 | 
  r2 \tuplet 3/2 { f4 f' ees } | 
  d4 r4 r8 cis16 d cis b bes aes | 
  g2 r8 d' cis d | \break
  ees8 gis, b d c bes a g  | 
  fis8 ees c cis d d' c bes | 
  b4 g8 f e c' \tuplet 3/2  { bes16 c bes} aes8 | 
  a4 \tuplet 3/2{ f16 g f } ees8 d bes' \tuplet 3/2 { aes16 bes aes } fis8 | \break
  g8 ees r4 r4 r8 bes'8 | 
  r4 \tuplet 3/2 { a16 bes a } g8  fis8 ees c cis | 
  d8 g a4 bes \acciaccatura cis,16 <d g>4 | 
  g,4 bes8 g cis d ees e | \break
  
  
}

theChords = \chordmode {
  \set chordChanges = ##t
  s1 |
  c1:m7 | f:7 | bes:maj7 | ees:maj7
  a:m7.5- | d:7 | g:m | g:m
  
  c1:m7 | f:7 | bes:maj7 | ees:maj7
  a:m7.5- | d:7 | g:m | g:m
  
  a:m7.5- | d:7 | g:m | g:m
  c1:m7 | f:7 | bes:maj7 | ees:maj7
  
  a:m7.5- | d:7 | g2:7 c:7 | f:7 bes:7
  ees1:maj7 | d:7 | g:m | g:m
}

\score {
  <<
    \new ChordNames \theChords
    \new Voice = soloist \theNotes
  >>
  \layout {
    \override Score.Clef.break-visibility = #'#(#f #f #f)  % make only the first clef visible
    \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
    \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    \context {
      \Score
      \remove "Bar_number_engraver"
      % \override SpacingSpanner.strict-note-spacing = ##f
      % \override SpacingSpanner.uniform-stretching = ##t
      % proportionalNotationDuration = #(ly:make-moment 1/16)
      % \override NonMusicalPaperColumn.line-break-permission = ##f
      % \override RehearsalMark.extra-offset = #'(0 . 2)
      % \consists "Horizontal_bracket_engraver"
    }
    \context {
      \ChordNames
      \override ChordName.Y-offset = #2.5
      \override ChordName.font-size = #1
      % \override ChordName.rotation = #'(6 0 0)
    }
    \context {
      \Staff
      \override BarLine.hair-thickness = #4
      \override BarLine.thick-thickness = #8
      \override SystemStartBar.thickness = #8
      % \override BarLine.space-alist.next-note = #'(semi-fixed-space . 4)
    }
  }
}
