{- HLINT ignore "Use camelCase" -}
module Statistics.Probability.Information(distibution_entropy) where
import Statistics.Vector.Operations(v_mult)

-- Entropy of a distribution
distibution_entropy :: [Double] -> Double
distibution_entropy p = 
    let
        log_p = [log a | a <- p]
        sslog = v_mult p log_p
        total = sum sslog
    in -total