module Utils where

    data Sign = X | O
        deriving (Eq, Ord, Show, Read, Bounded, Enum)