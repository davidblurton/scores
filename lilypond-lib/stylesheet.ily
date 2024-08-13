#(define-markup-command (draw-key layout props symbol) (symbol?)
   "Draw key in a circle."
   (let ((key (chain-assoc-get symbol props)))
     (if (not (string? key))
         (interpret-markup layout props
                           #{ \markup \null #})
         (interpret-markup layout props
                           #{ \markup { \circle \pad-around #3 #key } #}))))

\paper {
  bottom-margin = 10\mm
  indent        = 0\cm
  line-width    = 175\mm
  ragged-right  = ##f
  tagline       = ##f
  last-bottom-spacing.basic-distance   = #15
  top-system-spacing.basic-distance    = #20
  system-system-spacing.basic-distance = #20
  markup-system-spacing.basic-distance = #20
  top-markup-spacing.basic-distance    = #10
  score-system-spacing.basic-distance  = #30
  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)

    \roman \column {
      \fill-line { \fromproperty #'header:dedication }
      \override #'(baseline-skip . 3.5)
      \override #'(font-name . "C059")

      \column {
        \overlay {
          \fill-line {
            \fontsize #9
            \fromproperty #'header:title
          }
        }

        \fill-line { \lower #.5 \large \fromproperty #'header:subtitle }
        \fill-line {
          \raise #1 \smaller
          \fromproperty #'header:subsubtitle
        }

        \overlay {
          \left-align { \draw-key #'header:key }
          \fill-line {
            \fromproperty #'header:poet
            { \large \bold \fromproperty #'header:instrument }
            \fromproperty #'header:composer
          }
        }

        \fill-line {
          \fromproperty #'header:meter
          \fromproperty #'header:arranger
        }
      }
    }
  }
}