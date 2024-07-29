#(ly:font-config-add-directory "./fonts/")

#(define my-staff-height #f)

\paper {
  #(set! my-staff-height staff-height)
}

$(if (ly:version? >= '(2 25 4))
     #{
       \paper {
         property-defaults.fonts.sans = "C059"
       }
     #}
     #{
       \paper {
         fonts = #(set-global-fonts
                   #:sans "C059"
                   #:factor (/ my-staff-height (ly:pt 1) 20))
       }
     #})

\layout {
  \override HorizontalBracketText.font-family = #'sans
  \override TupletNumber.font-family          = #'sans
  \override Parentheses.font-size             = #0
  \override TextSpanner.font-name             = #'"C059 Italic"
  \override TextSpanner.font-size             = #-1
  \override DynamicTextSpanner.font-name      = #'"C059 Italic"
  \override DynamicTextSpanner.font-size      = #-1
  \override TextScript.font-family            = #'sans
  \override LyricText.font-family             = #'sans
  \override Score.BarNumber.font-family       = #'sans
  \override Score.JumpScript.font-name        = #'"C059 Italic"
  \override Score.VoltaBracket.font-name      = #'"C059 Bold"
  \override Score.MetronomeMark.font-name     = #'"C059 Bold"
  \override Score.RehearsalMark.font-name     = #'"C059 Bold"
  \override Score.TextMark.font-family        = #'sans
  \override Score.CodaMark.font-size          = #4
  \override Score.SegnoMark.font-size         = #4
  \override Score.SectionLabel.font-family    = #'sans
  \override Score.VoltaBracket.font-size      = #-1
  \override Staff.StringNumber.font-name      = #'"C059 Bold"
  \override Staff.Fingering.font-name         = #'"C059 Bold"
  \override Staff.OttavaBracket.font-name     = #'"C059 Italic"
  \override Staff.OttavaBracket.font-size     = #-2
  \override Staff.InstrumentName.font-family  = #'sans
}

\markup bold   = \markup \override #'(font-name . "C059 Bold") \etc
\markup italic = \markup \override #'(font-name . "C059 Italic") \etc
