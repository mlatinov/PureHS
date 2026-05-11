{- HLINT ignore "Use camelCase" -}
{- HLINT ignore "Redundant bracket" -}
module Statistics.Probability.Distributions(
    binomial_coef,
    bernoulli_pmf,
    binomial_pmf,
    normal_pdf_f,
    normal_pdf,
    st_normal_pdf_f,
    log_normal_pdf_f,
    log_normal_pdf,
    normal_likelihood,
    log_normal_likelihood,
    poisson_pmf ) where

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

-- Normal PDF
normal_pdf_f :: Double -> Double -> Double -> Double
normal_pdf_f x mu sigma = 
    let
        term_1 = 1 / (sigma * sqrt( 2 * pi)) 
        term_2 = exp (-(1 / 2) *  (((x - mu) / sigma) ** 2)) 
        npdf = term_1 * term_2
    in npdf

-- Normal PDF over a list
normal_pdf :: [Double] -> Double -> Double -> [Double]
normal_pdf x mu sigma = [normal_pdf_f xp mu sigma | xp <- x]

-- Standard Normal PDF
st_normal_pdf_f :: Double -> Double
st_normal_pdf_f x = normal_pdf_f x 0 1

-- Log Normal PDF
log_normal_pdf_f :: Double -> Double -> Double -> Double
log_normal_pdf_f x mu sigma = 
    let
        term_1 = -(1 / 2) * (((x - mu) / sigma) ** 2)
        term_2 = (- log sigma) - ((1 / 2) * log (2 * pi))
        log_n = term_1 + term_2
    in log_n

-- Log Normal PDF over a list 
log_normal_pdf :: [Double] -> Double -> Double -> [Double]
log_normal_pdf x mu sigma = [log_normal_pdf_f lx mu sigma | lx <- x ]

-- Likelihood of a dataset under a Normal model
normal_likelihood :: [Double] -> Double -> Double -> Double
normal_likelihood x mu sigma = product  (normal_pdf x mu sigma)

-- Log Normal Likelihood
log_normal_likelihood :: [Double] -> Double -> Double -> Double
log_normal_likelihood x mu sigma = sum (log_normal_pdf x mu sigma)

-- Poisson PMF
poisson_pmf :: Double -> Int -> Double
poisson_pmf lambda k = (lambda ^ k) * (exp (-lambda)) /  fromIntegral (re_factorial k)