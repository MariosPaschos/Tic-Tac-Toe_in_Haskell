import Player
import Game

import Control.Monad.State

import Control.Monad
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

    if sign == X then
        print 1
        -- putStrLn "Human: "
        -- print $ human
        -- putStrLn "Machine: "
        -- print $ machine
    else
        print $ 0




main = do
    
    let initBoard = replicate 9 Empty
    displayBoard initBoard

    forever selectPlayer