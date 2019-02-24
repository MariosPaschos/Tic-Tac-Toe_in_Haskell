import Player
import Game

import Control.Monad.State
import Control.Monad
import Control.Monad.Loops
import Data.Either
import Data.List


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
        

    




main = do
    
    let initBoard = replicate 9 Empty
    displayBoard initBoard

    selectSign