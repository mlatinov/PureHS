{- HLINT ignore "Use camelCase" -}
module Statistics.Transforms.Scaling(z_score, scale_min_max) where
import Statistics.Internal.Utils(mean)
import Statistics.Descriptive.Spread(sd)

--Z- Score Function 
z_score_f :: Double -> [Double] -> Double
z_score_f x y = 
    let
        mean_y = mean y
        sd_y   = sd y
        z = (x - mean_y) / sd_y
    in z

--Z-Score of a whole list
z_score :: [Double] -> [Double]
z_score x = [z_score_f a x | a <- x ]

--Normalize list Min-Max Scaling
scale_min_max :: [Double] -> [Double]
scale_min_max x = 
    let
        x_min = minimum x
        x_max  = maximum x
        const_min_max = x_max - x_min
        delta_min     = [d - x_min | d <- x]
        transform = [a / const_min_max | a <- delta_min] 
    in transform