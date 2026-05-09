{- HLINT ignore "Use camelCase" -}
module Statistics.Vector.Operations(vs_add, vs_sub, v_add, v_sub, v_mult) where

--Vector x Scalar addition 
vs_add :: [Double] -> Double -> [Double]
vs_add x y = [a + y | a <- x] 

--Vector x Scalar Substraction
vs_sub :: [Double] -> Double -> [Double]
vs_sub x y = [a - y | a <- x] 

-- Vector addition 
v_add :: [Double] -> [Double] -> [Double]
v_add x y = zipWith (+) x y

-- Vector Substract
v_sub :: [Double] -> [Double] -> [Double]
v_sub x y = zipWith (-) x y

-- Vector Multiplication 
v_mult :: [Double] -> [Double] -> [Double]
v_mult x y = zipWith (*) x y 