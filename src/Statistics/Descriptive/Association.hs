module Statistics.Descriptive.Association(cov, corr) where
import Statistics.Descriptive.Central(mean)
import Statistics.Descriptive.Spread(sd)
-- Population Covariance
cov :: [Double] -> [Double] -> Double
cov x y =
    let
        mean_x = mean x 
        mean_y = mean y
        ss_x = [xi - mean_x | xi <- x]
        ss_y = [yi - mean_y | yi <- y]
        covariance = (1 / fromIntegral (length x)) * (sum (zipWith (*) ss_x ss_y))
    in covariance


-- Pearson Correlation Coefficient
corr :: [Double] -> [Double] -> Double
corr x y = 
    let
        covariance = cov x y
        correlation = covariance / ( (sd x) * (sd y))
    in correlation