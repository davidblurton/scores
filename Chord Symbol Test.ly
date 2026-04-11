\version "2.24.3"
\include "./lilypond-lib/lilypond-lib.ily"

\header {
  title = "Chord Symbol Test"
  tagline = ##f
}

\paper {
  markup-system-spacing.basic-distance = #20
}

\layout {
  ragged-last = ##t
}

<<
  \new ChordNames {
    % minor third chords - 3 notes
    <c es ges>1             % dim
    <c es g>1               % m

    % minor third chords - 4 notes
    <c es ges beses>1       % dim7
    <c es gis>1             % m aug
    <c es g a>1             % m6
    <c es ges bes>1         % m7b5
    <c es g bes>1           % m7
    <c es gis bes>1         % m7#5
    <c es g b>1             % mM7
    <c es g d'>1            % m add9

    % minor third chords - 5+ notes
    <c es g a d'>1          % m6/9
    <c es g bes des'>1      % m7b9
    <c es g bes d'>1        % m9
    <c es ges bes d'>1      % m9b5
    <c es g b d'>1          % m9(M7)
    <c es g bes dis'>1      % m7#9
    <c es g bes f'>1        % m7(add 11)
    <c es g bes a'>1        % m7(add 13)
    <c es g bes d' f'>1     % m11
    <c es ges bes d' f'>1   % m11b5
    <c es g bes d' f' a'>1  % m13

    % major third chords - 3 notes
    <c e ges>1              % b5
    <c e gis>1              % aug

    % major third chords - 4 notes
    <c e g a d'>1           % 6/9
    <c e g a>1              % 6
    <c e g bes>1            % 7
    <c f g bes>1            % 7(4) / 7sus

    % special chords
    <c e g bes c'>1         % 7(Alt)
    <c e g b>1              % maj7
    <c e ges b>1            % maj7b5
    <c e gis b>1            % maj7#5
    <c e ges bes>1          % 7b5
    <c e gis bes>1          % 7#5
    <c e g d'>1             % add9

    % major third chords - 5+ notes
    <c e g b d'>1           % maj9
    <c e g bes des'>1       % 7b9
    <c e ges bes des'>1     % 7b9b5
    <c e gis bes des'>1     % 7b9#5
    <c e g bes d' fis'>1    % 9#11
    <c e g bes dis'>1       % 7#9
    <c e ges bes dis'>1     % 7#9b5
    <c e gis bes dis'>1     % 7#9#5
    <c e g bes fis'>1       % 7#11
    <c e g bes aes'>1       % 7b13
    <c e g b d' f'>1        % maj11
    <c e g b d' a'>1        % maj13
    <c e g bes d' a'>1      % 13
    <c e g bes des' a'>1    % 13b9

    % sustained chords
    <c d g>1                % sus2
    <c f g>1                % sus4
    <c f g bes>1            % 7sus (same pitch set as 7(4))
    <c f g bes d'>1         % 9sus
    <c f g dis'>1           % #9sus
  }
  \new Staff {
    \override Staff.TimeSignature.stencil = ##f
    \repeat unfold 53 { s1 \bar "||" }
  }
>>
