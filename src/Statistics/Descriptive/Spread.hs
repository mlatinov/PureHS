{- HLINT ignore "Use camelCase" -}
{-# OPTIONS_GHC -Wno-type-defaults #-}
module Statistics.Descriptive.Spread(range, var, sd, sample_variance) where
import Statistics.Internal.Utils (deviation_mean)
import Statistics.Descriptive.Central(mean)
--Range
range :: [Double] -> Double
range x = maximum x - minimum x  

-- Variance
var :: [Double] -> Double
var x = variance
    where
        sum_devi = sum (deviation_mean x)
        one_n = 1 / fromIntegral (length x) 
        variance = one_n * sum_devi

-- Standard Deviation
sd :: [Double] -> Double
sd x = sqrt (var x)

-- Sample Variance 
sample_variance :: [Double] -> Double
sample_variance x =
    let
        mean_sv = mean x -- Scalar 
        ss = sum [(xi - mean_sv)^2 | xi <- x] -- Scalar 
        bassel_correction = 1 / (fromIntegral( length x - 1)) -- Scalar
        samp_var = ss * bassel_correction -- Scalar
    in samp_var