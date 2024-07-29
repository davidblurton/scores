hiFl   = \markup { \hspace #.1 \raise #.4 \fontsize #-1.2 \flat }
hiSh   = \markup { \hspace #.1 \raise #.6 \fontsize #-1.2 \sharp }
slash  = \markup { \hspace #.1 "/" \hspace #.1 }
majSeven = \markup { "maj7" }
minorChord = \markup { "m" \hspace #-.2 }

chExceptionMusic = {
  <c es ges>       -\markup { \whiteCircleMarkup }
  <c es ges beses> -\markup \concat { \whiteCircleMarkup \super  "7" }
}

chExceptions = 
  #(sequential-music-to-chord-exceptions chExceptionMusic #t)

#(define (chordNamer pitch majmin)
  (let* ((alt (ly:pitch-alteration pitch)))
    (make-line-markup
    (list
      (make-simple-markup 
        (vector-ref #("C" "D" "E" "F" "G" "A" "B")
          (ly:pitch-notename pitch)))
      (if (= alt 0)
        (markup "")
      (if (= alt FLAT)
        (make-line-markup
          (list
            (make-fontsize-markup -1
              (make-text-markup "♭"))))
      (if (= alt DOUBLE-SHARP)
        (make-line-markup
          (list
            (make-fontsize-markup -3
              (make-raise-markup 0.40
                (make-doublesharp-markup)))))
      (if (= alt DOUBLE-FLAT)
        (make-line-markup
          (list
            (make-fontsize-markup -3
              (make-raise-markup 0.50
                (make-doubleflat-markup)))))
      (make-line-markup
        (list
          (make-fontsize-markup -1
            (make-text-markup "♯"))))))))))))

\layout {
  \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'(
    (basic-distance . 1)
    (padding . 1))
  
  \set slashChordSeparator = #slash
  \set majorSevenSymbol    = #majSeven
  \set chordNameExceptions = #chExceptions
  \set chordRootNamer      = #chordNamer
  \set chordNoteNamer      = #chordNamer
  \set chordNameSeparator  = #(make-hspace-markup 0)
  \set minorChordModifier  = #minorChord
}
