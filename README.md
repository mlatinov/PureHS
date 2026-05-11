# PureHS

A from-scratch statistics library in Haskell. No external dependencies — every formula implemented by hand from first principles.

Built as a learning project to understand statistical concepts at the implementation level, rather than relying on abstractions provided by modern stat libraries.

---

## Why

Most statistics libraries abstract away the math. This project does the opposite — every function corresponds directly to a formula, written out explicitly. The goal is deep understanding, not convenience.

---

## What's Implemented

### Descriptive — Central Tendency (`Statistics.Descriptive.Central`)
- Arithmetic mean
- Weighted mean
- Geometric mean
- Harmonic mean

### Descriptive — Spread (`Statistics.Descriptive.Spread`)
- Population variance
- Sample variance (Bessel corrected)
- Standard deviation
- Range
- Summary (min, max, mean, variance, sd as a named record)

### Descriptive — Association (`Statistics.Descriptive.Association`)
- Population covariance
- Pearson correlation coefficient

### Transforms (`Statistics.Transforms.Scaling`)
- Min-max normalization
- Z-score (single value and over a list)
- Cumulative sum

### Vector Operations (`Statistics.Vector.Operations`)
- Scalar multiplication
- Vector addition and subtraction
- Element-wise multiplication
- L2 norm (Euclidean length)
- Dot product

### Probability — Distributions (`Statistics.Probability.Distributions`)
- Bernoulli PMF
- Binomial PMF
- Poisson PMF
- Normal PDF (single value and over a list)
- Standard normal PDF
- Log normal PDF (numerically stable)
- Normal likelihood and log likelihood

### Probability — Information (`Statistics.Probability.Information`)
- Shannon entropy
- Probability normalization

### Models — Linear Regression (`Statistics.Models.Linear`)
- Gradient descent optimizer with convergence detection
- Divergence protection (NaN, infinity, and loss increase detection)
- `LinearModel` record type with named slope and intercept
- `fit` — trains a model given learning rate, epsilon, iterations, and data
- `predict_linear` — generates predictions from a fitted model

### Loss Functions (`Statistics.Models.Loss`)
- Mean squared error (MSE)
- Mean absolute error (MAE)

---

## Quick Start

```bash
# Install GHC and Cabal via GHCup
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Clone and build
git clone https://github.com/mlatinov/PureHS.git
cd PureHS
cabal build

# Explore interactively
cabal repl
```

### Descriptive Statistics

```haskell
import Statistics.Descriptive.Central
import Statistics.Descriptive.Spread
import Statistics.Descriptive.Association

let xs = [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]

mean xs        -- 5.0
sd xs          -- 2.0
summarize xs   -- Summary {min_val = 2.0, max_val = 9.0, mean_val = 5.0, ...}
```

### Linear Regression via Gradient Descent

```haskell
import Statistics.Models.Linear

let xs = [1.0, 2.0, 3.0, 4.0, 5.0]
let ys = [2.0, 4.0, 6.0, 8.0, 10.0]

let model = fit 0.01 0.0001 10000 xs ys
-- LinearModel {slope = 1.991, intercept = 0.029}

predict_linear model [6.0, 7.0, 8.0]
-- [11.98, 13.97, 15.96]
```

### Probability Distributions

```haskell
import Statistics.Probability.Distributions

normal_pdf_f 0.0 0.0 1.0       -- 0.3989 (standard normal at x=0)
binomial_pmf 10 3 0.5          -- P(X=3) for Binomial(10, 0.5)
log_normal_likelihood [1..100] 50 10  -- numerically stable log likelihood
```

---

## Roadmap

- [x] Descriptive statistics
- [x] Vector operations  
- [x] Probability distributions
- [x] Gradient descent linear regression
- [ ] OLS linear regression (closed form)
- [ ] Hypothesis testing (t-test, ANOVA, Kruskal-Wallis)
- [ ] Bootstrap resampling
- [ ] Bayesian inference with conjugate priors
- [ ] MCMC — Metropolis-Hastings sampler

---

## Requirements

- GHC >= 9.6
- Cabal >= 3.0
- No external Haskell dependencies — only `base`