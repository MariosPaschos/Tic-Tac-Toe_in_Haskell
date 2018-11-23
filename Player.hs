module Player where
    import Utils

    data Player = Player {
        sign :: Sign
    } deriving Show


    class PlayerInfo player where
        getSign :: player -> Sign
        toString :: player -> String

    instance PlayerInfo Player where
        getSign player = sign player
        toString player = 
            "Player " ++ show (getSign player) 
 