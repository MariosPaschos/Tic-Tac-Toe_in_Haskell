module Game where

    import Player

    getOpponent :: Player -> Player
    getOpponent player
        | getSign player == X = Player O
        | getSign player == O = Player X
        | otherwise = Player Empty

    selectPlayer :: IO Sign
    selectPlayer = do
        putStrLn "Choose a sign to play: X | O"
        choice <- getChar
        let s = charToSign choice
        if s == X then return X
        else if s == O then return O
        else selectPlayer
        
    isBoardFull :: [Sign] -> Bool
    isBoardFull board@(x:xs)
        | (Empty `elem` board) == True = False
        | otherwise = True

    isMoveValid :: Int -> Bool    
    isMoveValid move
        | 0 <= move && move <= 8  = True
        | otherwise = False

    isMoveLegal :: [Sign] -> Int -> Bool    
    isMoveLegal board move
        | (board !! move) == Empty = True
        | otherwise = False

    --Updating the board after move in position m
    updateBoard :: [Int] -> Int -> [Int]
    updateBoard curBoard m = newBoard
        where
            newBoard = (take m curBoard) ++ [m] ++ snd (splitAt (m+1) curBoard)
 

    displayBoard :: Show a => [a] -> IO () 
    displayBoard board@(x:xs) = do
        print $ [(board !! n)| n <- [0..2]]
        print $ [(board !! n)| n <- [3..5]]
        print $ [(board !! n)| n <- [6..8]]


    isRowWin board@(x:xs)
        | ([board !! n| n <- [0..2]] == (replicate 3 X)) == True = X
        | ([board !! n| n <- [0..2]] == (replicate 3 O)) == True = O
        | ([board !! n| n <- [3..5]] == (replicate 3 X)) == True = X
        | ([board !! n| n <- [3..5]] == (replicate 3 O)) == True = O
        | ([board !! n| n <- [6..8]] == (replicate 3 X)) == True = X
        | ([board !! n| n <- [6..8]] == (replicate 3 O)) == True = O
        | otherwise = Empty

    isColWin board@(x:xs)    
        | ([board !! n| n <- [0,3,6]] == (replicate 3 X)) == True = X
        | ([board !! n| n <- [0,3,6]] == (replicate 3 O)) == True = O
        | ([board !! n| n <- [1,4,7]] == (replicate 3 X)) == True = X
        | ([board !! n| n <- [1,4,7]] == (replicate 3 O)) == True = O
        | ([board !! n| n <- [2,5,8]] == (replicate 3 X)) == True = X
        | ([board !! n| n <- [2,5,8]] == (replicate 3 O)) == True = O
        | otherwise = Empty

    isDiagWin board@(x:xs)    
        | ([board !! n| n <- [0,4,8]] == (replicate 3 X)) == True = X
        | ([board !! n| n <- [0,4,8]] == (replicate 3 O)) == True = O
        | ([board !! n| n <- [2,4,6]] == (replicate 3 X)) == True = X
        | ([board !! n| n <- [2,4,6]] == (replicate 3 O)) == True = O
        | otherwise = Empty

    isWinner board@(x:xs)
        | isRowWin board == X = X
        | isRowWin board == O = O
        | isColWin board == X = X
        | isColWin board == O = O
        | isDiagWin board == X = X
        | isDiagWin board == O = O
        | otherwise = Empty



    -- {- Returns the new board configuration after the played move -}   
    -- --applyMoveOnBoard :: Int a => a -> [Sign s1] -> [Sign s2]
    -- applyMoveOnBoard move board@(x:xs) player = 
    --     (fst temp) ++ [sign] ++ (snd temp)
    --         where
    --             temp = splitAt move board
    --             sign = getSign player
        
    --makeMoveOn :: Int -> [Sign s] -> Player p -> [Sign s2]
    -- makeMoveOn square board@(x:xs) player =
    --     if isMoveLegal square then applyMoveOnBoard square board player
    --     else board