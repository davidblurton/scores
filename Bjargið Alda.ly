\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title =  "Bjargið alda"
  tagline =  ""
  poet = "Augustus M. Toplady"
  composer = "texti. Matthías Jochumsson"
  arranger = "úts. David Blurton"
}

\paper {
  markup-system-spacing.basic-distance = #25
}

keyTime = { \time 3/4 \key g \major }

PartVoiceMelody =  \relative d' {
  \clef "treble" \keyTime | % 1
  \tempo 4 = 60
  \partial 4 d8. e16 \bar "||" || 
  
  d4 b g'8. e16 | d2 g8. a16 | b4. a8 g8[ fis] | g2 fis8. g16 | 
  a4. a8 fis8[ d] | g2 fis8. g16 | a4. a8 fis8[ d] | g2 d8. e16 | 
  d4 b g'8. e16 | d2 g8. a16 | b4. a8 g8[ fis] | g2 
  
  \new CueVoice {
    d8. e16
  }
  
  \bar "|." |
  
}

PartVoiceMelodyLyrics = \lyricmode {
  \set stanza = "1. "
  Bjarg -- ið ald -- a, borg -- in mín, byrg þú mig í skjól -- i þín. 
  Heils -- u -- brunn -- ur öld og ár
  er þitt dýr -- a hjart -- a -- sár.
  Þvo mig hrein -- an, líkn -- ar -- lind, laug -- a mig af hverr -- i synd.
}

PartVoiceMelodyChords = \chords {
  s4 | g2 c4/g | g2 g8./b a16:m/c | g2./d | g2.
  a2.:m/d | g | a:m/d | g2. |
  g2 c4/g | g2 g8./b a16:m/c | g2./d | g2.
}

\score {
  <<
    \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}    
    \context Voice = "PartVoiceMelody" { \PartVoiceMelody }
    \new Lyrics \lyricsto "PartVoiceMelody" { \PartVoiceMelodyLyrics }
  >>
}

\markup {
  \roman
  \vspace #5
  \fill-line {
    % moves the column off the left margin;
    % can be removed if space on the page is tight
    \hspace #0.1
    \column {
      \line { \bold "2."
              \column \string-lines 
              "Heilög boðin, Herra, þín 
          hefur brotið syndin mín. 
          Engin bót og engin tár 
          orka mín að græða sár. 
          Ónýt verk og ónýt trú, 
          enginn hjálpar nema þú."
      }
    }
    % adds horizontal spacing between columns
    \hspace #0.1
    \column {
      \line { \bold "3."
              \column \string-lines 
              "Titrandi með tóma hönd
          til þín, Guð, ég varpa önd, 
          nakinn kem ég, klæddu mig, 
          krankur er ég, græddu mig, 
          óhreinn kem ég, vei, ó, vei, 
          væg mér, Herra, deyð mig ei."
      }
    }
    
    \hspace #0.1
    \column {
      \line { \bold "4."
              \column \string-lines 
              "Þegar æviþrautin dvín, 
          þegar lokast augun mín, 
          þegar ég við sælli sól
          sé þinn dóms- og veldisstól: 
          Bjargið alda, borgin mín, 
          byrg mig þá í skjóli þín."        
      }
    }
    % gives some extra space on the right margin;
    % can be removed if page space is tight
    \hspace #0.1
  }
}
