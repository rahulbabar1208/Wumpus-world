For a ChessGuess game, one player will be the hider and the other is the guesser. The hider begins by selecting the size of the game which can be from 0 to 32. The hider then selects up to size chess pieces out of a chess set and hides them. Each piece has a colour one of ’B’ black or ’W’ white and a kind: ’K’ king, ’Q’ queen, ’R’ rook, ’B’ bishop, ’N’ knight or ’P’ pawn. We will represent pieces by length 2 strings, e.g. "BK" is a black king, and "WP" is a white pawn. Note that they are selected from a standard chess set so there is e.g. at most two black rooks that can be selected, or at most 8 white pawns.

Once the hider has selected the target set of pieces, the guesser repeatedly chooses a subset of chess pieces up to size size and tells it to the hider, who responds by giving the guesser the following feedback:

how many pieces in the guess are included in the target (correct pieces)
how many pieces have the right kind but the wrong colour (correct kinds)
how many pieces have the right colour but the wrong kind (correct colours)
In counting correct pieces, kinds and colours, multiple occurrences in the guess are only counted as correct if they also appear repeatedly in the target. Correct pieces are not also counted as correct kinds and colours. For example, with a target of BK, WQ, BR, BR, a guess of WK, BN, BQ, WQ, BR would be counted as 2 correct pieces (WQ, BR), one correct kind (WK) and two correct colours (BQ,BN). BQ would not be counted as a correct kind, even though it has the same kind as the target WQ, because the target WQ was already used to count the guess WQ as a correct piece. A few more examples:

Target	Guess	Answer
BK,WQ,BR,BR	BK,BR,WQ	3,0,0
BK,WQ,BR,BR	WK	0,1,1
BP,BP,BP,BK	WP,BP,BR	1,1,1
BK,WP	WP,WP,BR,WK	1,1,1
BK,WQ,BR,BR	WR,WR,WR	0,2,1
BP,BP,BP,BR	WR,WR,WR	0,1,0
Note that the last two guesses are impossible, since they contains three white rooks, but you are allowed to make these as guesses, even though they will never be correct.

The game finishes once the guesser guesses the correct set of pieces (the target and the guess are the same set). The object of the game for the guesser is to find the target with the fewest possible guesses.
