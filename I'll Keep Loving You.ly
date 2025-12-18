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

title = #"I'll Keep Loving You"
composer = #"- Earl \"Bud\" Powell"
meter = #" (Ballad)"

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

majorScale =
#(define-music-function (parser location root-pitch) (ly:pitch?)
   #{
     \transpose c $root-pitch {
       c'8 d' e' f' g' a' b'4 |
     }
   #})

domSevenScale =
#(define-music-function (parser location root-pitch) (ly:pitch?)
   #{
     \transpose c $root-pitch {
       c'8 d' e' f' g' a' bes'4 |
     }
   #})

domSevenDownScale =
#(define-music-function (parser location root-pitch) (ly:pitch?)
   #{
     \transpose c $root-pitch {
       \once \override HorizontalBracketText.text = "a"
       
       bes'8 \startGroup a' g' f' e' d' cis'4 \stopGroup |
     }
   #})

theNotes = \relative c' {
  \key bes \major
  \numericTimeSignature
  \time 4/4
  \accidentalStyle modern-cautionary
  \override AccidentalCautionary.parenthesized = ##f
  
  \newSpacingSection
  bes'4. dis,8 e4 f8 g
  \newSpacingSection
  
  a8 e d4 cis8 d bes' aes
  g4. ees8 b4 c8 ges'
  f2. r4 \break
  
  ees4. gis,8 a4 bes8 c |
  d2. bes8 d |
  g2. a4 |
  f4 f4 \tuplet 3/2 { f8 f f } \tuplet 3/2 { f8 aes f } | \break
  
  bes4. dis,8 e4 f8 g
  a8 e d4 cis8 d bes' aes
  g4. ees8 b4 c8 ges'
  f2. r4 \break
  
  ees4. gis,8 a4 bes8 c |
  d4. a'8 fis4 g |
  f4 bes ees, aes |
  f2. r8 f8 | \section \break
}

scaleOutline = \relative c' {
  \key bes \major
  \numericTimeSignature
  \time 4/4
  \accidentalStyle modern-cautionary
  \override AccidentalCautionary.parenthesized = ##f
    
  \domSevenDownScale c
  \domSevenScale g
  \domSevenScale f
  \majorScale bes \break
}

theChords = \chordmode {
  \set chordChanges = ##t
  e2:m7.5- a:7.9- |
  d:m7 g:7.9- |
  c:m7 f:7.9- | 
  bes1:maj9 |
  
  a2:m7.5- d:7 |
  g2:m g4:m/fis g:m/f |
  e2:m7.5- bes4:7 a:7 | 
  d4:m7 des:9 ges:maj7 b:9.11+ |
  
  e2:m7.5- a:7.9- |
  d:m7 g:7.9- |
  c:m7 f:7.9- | 
  bes1:maj9 |
  
  a2:m7.5- d:7 |
  g2:m7 c4:7.9- cis:dim7 |
  d4:m7 g:m7 c:m7 f:7.9+ | 
  bes1:maj9 |
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
      \override SpacingSpanner.strict-note-spacing = ##f
      \override SpacingSpanner.uniform-stretching = ##t
      proportionalNotationDuration = #(ly:make-moment 1/16)
      \override NonMusicalPaperColumn.line-break-permission = ##f
      \override RehearsalMark.extra-offset = #'(0 . 2)
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
      \override BarLine.space-alist.next-note = #'(semi-fixed-space . 4)
    }
  }
}
