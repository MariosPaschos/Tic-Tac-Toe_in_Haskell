import Player
import Game

import Control.Monad
import Control.Monad.Loops
import Data.Either
import Data.List



main = do
    
    let initBoard = replicate 9 Empty
    displayBoard initBoard