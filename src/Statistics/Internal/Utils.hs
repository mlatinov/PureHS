{- HLINT ignore "Use camelCase" -}
module Statistics.Internal.Utils(deviation_mean, mean) where

--Mean
mean :: [Double] -> Double
mean x = sum x / fromIntegral(length x)  

-- Deviation from mean
deviation_mean :: [Double] -> [Double]
deviation_mean x = result
    where
        mean_x = mean x 
        result = [a - mean_x | a <- x] 


