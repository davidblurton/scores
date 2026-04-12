\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title = "I'm Old Fashioned"
  subtitle = "As played by Barry Harris on \"Solo\""
  tagline = ""
  composer = "Transcribed by David Blurton"
}

\layout {
\context {
    \Voice
    \consists "Horizontal_bracket_engraver"
    %\override HorizontalBracket.direction = #UP
  }
}

\paper {
  %markup-system-spacing.basic-distance = #25
}

<<
  \chords {
    g2:m7 c:7 | f1
  }
  
  \new Staff \relative c'' { 
    \time 4/4 \key f \major
    r2 
    
    <<
      {
        \voiceOne
        a4 gis
      }
      \new Voice {
        \voiceTwo
        <c, f>4 <cis e>
      }
    >>
    
    \oneVoice
    | g'1
  }
>>

<<
  \chords {
    a1:7 | d:m7
  }
  
  \new Staff \relative c'' { 
    \time 4/4 \key f \major
    r2 
    
    \once\override HorizontalBracketText.text = "Bb diminished"
    \once\override HorizontalBracket.Y-offset = -7
    
    <<
      {
        \voiceOne
        \once\override NoteHead.color = red
        dis4\startGroup e\stopGroup
      }
      \new Voice {
        \voiceTwo
        <cis, g' bes >2
      }
    >>
    
    \oneVoice
    | f'1
  }
>>

<<
  \chords {
    b2:m7 e:7 | a:maj7
  }
  
  \new Staff \relative c'' { 
    \time 4/4 \key f \major
    a2 
    
    \once\override HorizontalBracketText.text = "F diminished"
    \once\override HorizontalBracket.Y-offset = -6
    
    <<
      {
        \voiceOne
        \once\override NoteHead.color = red
        bes!8\startGroup b 
        \once\override NoteHead.color = red
        des d\stopGroup
      }
      \new Voice {
        \voiceTwo
        <f, aes>4 <f aes>
      }
    >>
    
    \oneVoice
    | cis'1
  }
>>

<<
  \chords {
    f1 | b2:m7.5- bes:m6 | a2:m7 d:m7
  }
  
  \new Staff \relative c'' { 
    \time 4/4 \key f \major

    c4 d c f, | 
    
    \once\override HorizontalBracketText.text = "Movement to 3"
    a2.\startGroup    
    g4 | c2.\stopGroup c,4
  }
>>

<<
  \chords {
    g2:7 c:7 | f1
  }
  
  \new Staff \relative c'' { 
    \time 4/4 \key f \major

    r4 e,8 ees d4 des | c1
  }
>>