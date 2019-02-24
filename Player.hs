module Player where

    import Control.Monad.State(liftIO)

    --Player signs: X and O
    data Sign = Empty | X | O  
        deriving (Ord, Eq, Show, Read, Bounded, Enum)

    --Function to extract Sign from a character (e.g. 'X' -> X)
    charToSign :: Char -> Sign
    charToSign ch
        | ch == 'x' || ch == 'X' = X
        | ch == 'o' || ch == 'O' = O
        | otherwise = Empty

    data Player = Player {
        sign :: Sign
    } deriving (Eq, Show, Read)


    class PlayerInfo player where
        getSign :: player -> Sign
        toString :: player -> String

    instance PlayerInfo Player where
        getSign player = sign player
        toString player = 
            "Player " ++  (show turn) ++ " plays with " ++ show (getSign player)
            where
                turn = case (getSign player) of X -> 1
                                                O -> 2
   
                                                
    selectSign :: IO Player
    selectSign = do
        --Human player selects sign
        putStrLn "Choose a sign to play (X | O)"
        choice <- liftIO getChar
        if choice /= 'X' && choice /= 'O'
            then do
                putStrLn "Invalid sign!"
                putStrLn "Try again"
                selectSign     
        else do      
            let sign = charToSign choice

            --Assigning symbol to human player
            let human = Player sign

            return human               