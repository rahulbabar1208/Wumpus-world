-- Rahul Babar

module Project2 (initialGuess, nextGuess, GameState) where
import Data.List
import qualified Data.Set as Set

-- Initializing GameState which has all the pieces
type GameState = [[[Char]]]
pieces=["BK","WK","BQ","WQ","BB","BB","WB","WB","BN","BN","WN","WN","BR","BR","WR","WR","WP","WP","WP","WP","WP","WP","WP","WP","BP","BP","BP","BP","BP","BP","BP","BP"]

-- Initializing all the possible combinations of size while size decreases by 1 since for example, game of size 5 can have 3 pieces
initGS 0 _= []
initGS n ls= (combinations n ls) ++ (initGS (n-1) ls)

-- Removing all duplicates in lists since same pieces can be found in different lists
combinations :: Int -> [a] -> [[a]]
combinations 0 _  = return []
combinations n xs = do y:xs' <- tails xs
                       ys <- combinations (n-1) xs'
                       return (y:ys)

-- We make the initial guess which contains the first n pieces from the GameState where n is the size
initialGuess :: Int -> ([String],GameState)
initialGuess n=(head ls,ls)
  where ls=initGS n pieces		  
	
-- After making initial guess, we get a feedback and based on that feedback we take next pieces from the GameState and put it in a new variable 
nextGuess :: ([String],GameState) -> (Int,Int,Int) -> ([String],GameState)
nextGuess (target, gameState) feedback = (newGuess, newGameState)
  where newGuess  =  head newGameState
        newGameState = filter'  gameState target feedback
   
-- Filter the GameState by eliminating all the extra pieces
filter'::(GameState)->[String]->(Int,Int,Int)->(GameState)   
filter' (x:xs) target feedback= 
 if feedback==response x target 
  then x: filter' xs target feedback 
  else filter' xs target feedback

-- Compute the correct answer to a guess. First argument is the 
-- target, second is the guess.
response :: [String] -> [String] -> (Int,Int,Int)
response target guess = (right, rightKind, rightColor)
  where 
        common      = mintersect guess target
        right       = length common
        rguess      = foldr (delete) guess common
        rtarget     = foldr (delete) target common
        rightColor  = length $ mintersect (map (!!0) rguess) (map (!!0) rtarget)
        rightKind   = length $ mintersect (map (!!1) rguess) (map (!!1) rtarget)

-- Minimum intersection between target and guess
mintersect :: Eq t => [t] -> [t] -> [t]
mintersect [] _ = []
mintersect (x:xs) r = if elem x r 
                       then x : mintersect xs (delete x r)
                       else mintersect xs r