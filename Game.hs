import Player
import Utils

getOpponent :: Player -> Player
getOpponent player
    | (getSign player) == X = Player O
    | (getSign player) == O = Player X


main = do
    let player1 = Player X
    let player2 = getOpponent player1
    print $ toString (getOpponent a)    