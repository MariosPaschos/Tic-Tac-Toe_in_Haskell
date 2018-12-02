module Game where
    import Player

    getOpponent :: Player -> Player
    getOpponent player
        | getSign player == X = Player O
        | getSign player == O = Player X
        | otherwise = Player Empty


    selectSign :: IO Sign  
    selectSign = do
        putStrLn "Choose a sign to play (X | O)"
        choice <- getChar
        let s = charToSign choice
        if s == X then return X
        else if s == O then return O
        else selectSign
        

    isBoardFull :: [Sign] -> Bool
    isBoardFull board@(x:xs)
        | (Empty `elem` board) == True = False
        | otherwise = True

    isMoveLegal :: Int -> Bool    
    isMoveLegal move
        | 0 <= move && move <= 8  = True
        | otherwise = False


    displayBoard :: Show a => [a] -> IO () 
    displayBoard board@(x:xs) = do
        print $ take 3 board
        print $ take 3 board
        print $ take 3 board

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



    -- play = do
    --     -- Create a list/board with 9 empty (N) elements representing the initial game board
    --     let initBoard = [x| x <- replicate 9 Empty]
    --     print $ initBoard
    --     let s >>= selectSign
    --     let human = Player s
    --     let machine = getOpponent human

    --     putStrLn "Current board configuration: "