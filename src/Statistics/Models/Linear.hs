module Statistics.Models.Linear(linear_model) where

import Statistics.Vector.Operations(vs_mult, vs_add)

-- Linear Model y = xw + b
linear_model :: Double -> Double -> [Double] -> [Double]
linear_model w b x = 
    let
        wx = vs_mult x w 
        wbx = vs_add wx b
    in wbx 