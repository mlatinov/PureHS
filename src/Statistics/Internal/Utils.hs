{- HLINT ignore "Use camelCase" -}
{- HLINT ignore "Use foldr" -}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-unused-matches #-}
module Statistics.Internal.Utils(deviation_mean, mean, re_factorial) where

--Mean
mean :: [Double] -> Double
mean x = sum x / fromIntegral(length x)  

-- Deviation from mean
deviation_mean :: [Double] -> [Double]
deviation_mean x = result
    where
        mean_x = mean x 
        result = [a - mean_x | a <- x] 

-- Recursive Factorial
re_factorial :: Int -> Int
re_factorial n = product [1..n]