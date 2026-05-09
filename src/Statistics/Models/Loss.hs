module Statistics.Models.Loss(l2_norm, mse, mae) where
import Statistics.Vector.Operations(v_sub)

-- L2 Norm (Euclidean length of a vector)
l2_norm :: [Double] -> Double
l2_norm x = sqrt (sum [xi ** 2 | xi <- x])

-- Mean Squared Error
mse :: [Double] -> [Double] -> Double
mse y y_hat = 
    let
        ss = v_sub y y_hat 
        mean_se = 1 / fromIntegral(length ss) * sum [ss_sq ** 2 | ss_sq <- ss]
    in mean_se

--  Mean Absolute Error
mae :: [Double] -> [Double] -> Double
mae y y_hat =
    let
        v = v_sub y y_hat
        mean_abs_e = 1 /  fromIntegral(length v) * sum [abs ss | ss <- v ]
    in mean_abs_e