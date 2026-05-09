{- HLINT ignore "Use camelCase" -}
{- HLINT ignore "Redundant bracket" -}
module Statistics.Probability.Distributions(binomial_coef, bernoulli_pmf, binomial_pmf) where
import Statistics.Internal.Utils(re_factorial)

-- Binomial Coefficient
binomial_coef :: Int -> Int -> Double
binomial_coef n k =
    let
        n_fact  = fromIntegral (re_factorial n)
        k_fact  = fromIntegral (re_factorial k)
        nk_fact = fromIntegral (re_factorial (n - k))
        coefs = n_fact / (k_fact * nk_fact)
    in coefs

-- Bernoulli PMF
bernoulli_pmf :: Int -> Double -> Double 
bernoulli_pmf k p = p^k * ((1 - p) ^ (1 - k))

-- Binomial PMF
binomial_pmf :: Int -> Int -> Double -> Double
binomial_pmf n k p = (binomial_coef n k) *  p^k * ((1 - p) ^ (n - k))

