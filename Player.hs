module Player where
    
    --Player signs: X and O
    data Sign = Empty | X | O 
        deriving (Eq, Show, Read, Bounded, Enum)

    --Function to extract Sign from a character (e.g. 'X' -> X)
    charToSign :: Char -> Sign
    charToSign ch
        | ch == 'X' = X
        | ch == 'O' = O
        | otherwise = Empty

    data Player = Player {
        sign :: Sign
    } deriving (Eq, Show)


    class PlayerInfo player where
        getSign :: player -> Sign
        toString :: player -> String

    instance PlayerInfo Player where
        getSign player = sign player
        toString player = 
            "Player " ++ show (getSign player)
