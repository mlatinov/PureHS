module Statistics.Descriptive.Central (mean, weighted, geometric, harmonic) where

--Mean
mean :: [Double] -> Double
mean x = sum x / fromIntegral(length x)  
    
--Weighted Mean
weighted :: [Double] -> [Double] -> Double
weighted x w = 
    let
        sum_wx = sum (zipWith (*) x w)
        sum_w  = sum w
        mean_weight = sum_wx / sum_w
    in mean_weight
        
-- Geometric Mean
geometric :: [Double] -> Double
geometric x = 
    let
        product_x = product x
        one_over_n = 1 / fromIntegral (length x)
        gmean = product_x ** one_over_n
    in gmean

-- Harmonic Mean
harmonic :: [Double] -> Double
harmonic x = 
    let
        ss = sum([1 / xo | xo <- x])
        har_mean = fromIntegral (length x) / ss
    in har_mean