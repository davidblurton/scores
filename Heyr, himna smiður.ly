\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title = "Heyr, himna smiður"
  tagline = ""
  composer = "Kolbeinn Tumason"
}

\layout {
  
}

\paper {
  %markup-system-spacing.basic-distance = #25
}

Timeline = {
  \cadenzaOn
}

SopranoMusic = \relative c' {
  c4( b) a d c b( c) \breathe b a b e e2 \caesura \break
  a8( a) g4 g8( a) b( a) g4 fis a fis2 \caesura \break
  g8( fis!) g4 fis fis e2 \breathe e8( d) c c e4 d e2 \caesura \break
  e8(e) g4 g g fis!8( fis) e4 g e2 \fine
}

IM = \set ignoreMelismata = ##t
UM = \unset ignoreMelismata

VerseOne = \lyricmode { 
  \set stanza = "1. "
  Heyr, himn -- a smið -- ur, \IM hver \UM skáld -- ið bið -- ur
  \IM kom -- i \UM mjúk til mín misk -- unn -- in þín.
  Því heit eg á þig, þú hef -- ur skapt -- an mig,
  \IM ég er \UM þræll -- inn þinn, \IM þú ert \UM Drott -- inn minn.
}

VerseTwo = \lyricmode { 
  \set stanza = "2. "
  Guð, heit eg á þig, að græð -- ir mig __ _,
  \IM minnst, \UM mild -- ing -- ur, mín, mest þurf -- um þín.
  \IM Ryð þú, \UM röð -- la gram -- ur, rík -- lynd -- ur og fram -- ur,
  hölds hverr -- i sorg úr hjart -- a -- borg.
}

VerseThree = \lyricmode { 
  \set stanza = "3. "
  Gæt, mild -- ing -- ur, mín, mest þurf -- um þín __ _,
  helzt hver -- ja stund á höld -- a grund.
  Set, meyj -- ar mög -- ur, máls efn ---  i fög -- ur,
  \IM öll er \UM hjálp af þér, í hjart -- a mér.
}

\score {  % Start score
  <<
    \new PianoStaff <<  % Start pianostaff
      \new Staff <<  % Start Staff = RHz
        \clef "treble"
        \new Voice = "Soprano" <<  % Start Voice = "Soprano"
          \Timeline
          \SopranoMusic
        >>
        \addlyrics \VerseOne
        \addlyrics \VerseTwo
        \addlyrics \VerseThree
      >> 
    >> 
  >>
}

\layout {
  \context {
    \Score
    caesuraType = #'((bar-line . "|"))
    fineBarType = "||"
  }
}