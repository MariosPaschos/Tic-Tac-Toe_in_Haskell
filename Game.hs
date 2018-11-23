import Player
import Utils


--Player signs: X and O
data Sign = N | X | O 
    deriving (Eq, Ord, Show, Read, Bounded, Enum)


getOpponent :: Player -> Player
getOpponent player
    | (getSign player) == X = Player O
    | (getSign player) == O = Player X



selectPlayer = do
    putStrLn "Choose a sign to play (X | O)"
    let sign <- getLine
    if sign  == X || sign == O then (Player sign)
    else selectPlayer


isBoardFull board@x:xs
    if (- `elem` board == True) then False
    else True 

isMoveLegal move
    | 0 <= square && square <= 8  = True
    | otherwise = False


{- Returns the new board configuration after the played move -}   
--applyMoveOnBoard :: Int a -> [a] -> [a]
applyMoveOnBoard move board@x:xs player = 
    (fst temp) ++ [getSign player] ++ (snd temp)
        where
            temp = splitAt move board
    

makeMoveOn square board@x:xs player
    if isMoveLegal square then applyMoveOnBoard square board player
    else board



play = do
    -- Create a list/board with 9 empty (N) elements representing the initial game board
    let initBoard = [x| x <- replicate 9 N]
    
    let human = selectPlayer
    let machine = getOpponent human






main = do
    let player1 = Player X
    let player2 = getOpponent player1
    print $ toString (player2)    