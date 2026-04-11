\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\pointAndClickOff

\header {
  title = "Gott er að vera"
  subtitle = "Blessed Assurance"
  composer = "texti. Sigurbjörn Sveinsson"
  poet = "Fanny Crosby"
  arranger = "úts. David Blurton"
}

#(set-global-staff-size 21)

\paper {
  markup-system-spacing.basic-distance = #25
}

keyTime = { \time 12/8 \key bes \major }

PartVoiceMelody = \relative c' {
  \clef "treble" \keyTime
  \tempo 4. = 48

  \partial 4.
  d8 [ c bes ] |
  f'4. f4.  r4 f8 es8 [ f g ] | % 2
  f4.~ f4. r4. f8 [ d f ] | % 3
  bes4. a4. r4.
  g8 [ f e ] | % 4
  f4.~ f4. r4. d8 [ c bes ] | % 5
  f'4. f4. r4. es8 [ f g ] | % 6
  f4.~ f4.
  r4. bes,8 [ c d ] | % 7
  es4. c4. r4. bes8 [ c a ] | % 8
  bes4.~ bes4. r4.

  % Chorus
  f'8 [ f f ] | % 9
  \section \sectionLabel Chorus
  bes4. f4. r4. g8 [ g g ] | % 10
  f4.~ f4. r4. f8 [ f f ] | % 11
  g4. bes4. r4. a8 [ a g ] | % 12
  a4.~ a4. r4. a8 [ bes c ] | % 13
  bes4. f4.
  r4. g8 [ f g ] | % 14
  f4.~ f4. r4. bes,8 [ c d ] | % 15
  es4. c4. r4. bes8 [ c a ] | % 16
  
  <<
    { bes1. }
    \new CueVoice {
       s2. \tweak staff-position #0 r8 \voiceOne f'' es d des c  
    }
    \new CueVoice {
       s2. \tweak staff-position #0 r8 \voiceTwo d, es f g a 
    }
  >> | \fine
}

PartVoiceMelodyLyrics = \lyricmode {
  Gott er að ver -- a í Guðs -- barn -- a -- hjörð.
  Guð send -- i Jes -- úm hing -- að á jörð,
  til þess að frels -- a tap -- að -- an sauð,
  til þess að miðl -- a him -- nesk -- um auð.

  Hann er mín gleð -- i, hann er mitt skjól,
  hann er mitt líf og un -- að -- ar -- sól,
  náð sína' og bless -- un býð -- ur hann mér,
  brúð -- gum -- i sál -- ar minn -- ar hann er.
}

PartVoiceMelodyChords = \chords {
  \partial 4. s4. |
  bes2. bes2.:sus4 |
  bes4. bes4.:sus4 bes4. d:7.9+ |
  g2.:m c2.:7 |
  f4. f4.:sus4 f4. f4.:7 |
  bes2. bes2.:sus4 |
  bes4. d:7.9+ g4.:m g:7.9+ |
  c2.:m7 f2.:7 |
  bes4. bes4.:sus4 bes4. f4.:7

  bes2. es2.:7+ |
  bes4. bes4.:sus4 bes4. d:7.9+ |
  g2.:m c2.:7.11+ |
  f4. f4.:sus4 f4. f4.:7 |
  bes2. es2.:7+ |
  bes4. d4.:7.9+ g4.:m g:7.9+ |
  c2.:m7 f2.:7 |
  bes4. bes:sus4 bes4. f4.:7
}

Score = <<
  \context ChordNames = "PartVoiceMelodyChords" { \PartVoiceMelodyChords}
  \context Voice = "PartVoiceMelody" { \PartVoiceMelody }
  \new Lyrics \lyricsto "PartVoiceMelody" { \PartVoiceMelodyLyrics }
>>

\score {
  \Score
}
