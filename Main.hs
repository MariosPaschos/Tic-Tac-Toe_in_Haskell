import Player
import Game

main = do
    
    let initBoard = replicate 9 Empty
    displayBoard initBoard
    putStrLn "Choose a sign to play (X | O)"
    choice <- getChar
    let s = charToSign choice
    let human = Player s
    let machine = getOpponent human

    putStrLn "Human: "
    print $ human
    putStrLn "Machine: "
    print $ machine