import Player
import Game

main = do
    
    let board = [0..8]
    let initBoard = replicate 9 Empty
    putStrLn "Choose a sign to play (X | O)"
    choice <- getChar
    let s = charToSign choice
    let human = Player s
    let machine = getOpponent human

    putStrLn "Human: "
    print $ human
    putStrLn "Machine: "
    print $ machine
    print $ initBoard