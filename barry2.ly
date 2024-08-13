\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

bracketText = \once \override HorizontalBracketText.text = \etc 

\layout {
  \context {
    \Staff
    \consists "Horizontal_bracket_engraver"
    \override HorizontalBracket.direction = #DOWN
    \override HorizontalBracket.Y-offset = #-6
    \override HorizontalBracket.bracket-flare = #'(0 . 0)
  }
}

<<
  \chords { b1:m7 | e:7 | a:m7}
  \new Staff \relative c' {
    \key g \major
    r2 r8 
    
    \bracketText \markup \score { \chords { g:7 } } 
    f8 \startGroup a d | 
    
    \tuplet 3/2 { c d c } gis f 
    \stopGroup
    
    \bracketText \markup \score { \chords { e:7 } } 
    
    e \startGroup ees d des \stopGroup | 
        
    c4
  }
>>


<<
  \chords { c1:m7 | f:7 | a:m7}
  \new Staff \relative c' {
    \key g \major
    \bracketText \markup \score { \chords { f:7 } } 
    g'8 \startGroup ees r4 r4 r8 <c ees> |
    r8 d \tuplet 3/2 { ees g bes }
    \stopGroup
    \bracketText \markup \score { \chords { d:7 } } 
    
    d \startGroup des c b |
    a
  }
>>