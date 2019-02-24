module Player where
    
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
                                      
