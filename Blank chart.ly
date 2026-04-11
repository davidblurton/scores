\version "2.18.2"
#(set-global-staff-size 24)
\include "./stylesheet/jazzchords.ily"
\include "./stylesheet/lilyjazz.ily"
\include "./stylesheet/jazzextras.ily"

\paper {
  #(set-paper-size "letter")
  indent = 0\mm
  left-margin = 1.5\cm
  right-margin = 1\cm
  bottom-margin = 2\cm
  top-margin = 3\cm
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  ragged-right = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #" "
composer = #" "
meter = #" "

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
            \larger #title
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
  
  tagline = ##f
}

theNotes = \relative c' {
  \key c \major
  %\override Staff.Clef.stencil = ##f
  \override Staff.TimeSignature.transparent = ##t
  \time 4/4

  \section
  s1 | s1 | s1 | s1 | \break
  s1 | s1 | s1 | s1 | \break
  s1 | s1 | s1 | s1 | \break
  s1 | s1 | s1 | s1 | \break

  \section
  s1 | s1 | s1 | s1 | \break
  s1 | s1 | s1 | s1 | \break
  s1 | s1 | s1 | s1 | \break
  s1 | s1 | s1 | s1 | \break
  
  \fine
  
}

theChords = \chordmode {

}

\score {
  <<
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
      \consists "Horizontal_bracket_engraver"
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
