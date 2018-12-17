import Player
import Game
import Control.Monad
import Control.Monad.State
import Data.Either
import Data.List


selectPlayer = do

    --Human player selects sign
    putStrLn "Choose a sign to play (X | O)"
    choice <- liftIO getChar
    let sign = charToSign choice

    --Assigning symbols to players
    let human = Player sign
    let machine = getOpponent human

    putStrLn "Human: "
    print $ human
    putStrLn "Machine: "
    print $ machine




main = do
    
    let initBoard = replicate 9 Empty
    displayBoard initBoard

    selectPlayer