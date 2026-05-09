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
- Z-score (single value)
- Z-score (whole list)
- Cumulative sum

---

## Installation

You need GHC and Cabal. The recommended way to install both is via [GHCup](https://www.haskell.org/ghcup/):

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

Then clone the repo and build:

```bash
git clone https://github.com/mlatinov/PureHS.git
cd PureHS
cabal build
```

To explore interactively:

```bash
cabal repl
```

Then inside GHCi:

```haskell
import Statistics.Descriptive.Central
import Statistics.Descriptive.Spread
import Statistics.Descriptive.Association

let xs = [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]

mean xs
-- 5.0

sd xs
-- 2.0

summarize xs
-- Summary {min_val = 2.0, max_val = 9.0, mean_val = 5.0, ...}
```

---

## Roadmap

- [ ] Linear regression (OLS)
- [ ] Hypothesis testing (t-test, chi-square)
- [ ] Bootstrap resampling
- [ ] Bayesian inference with conjugate priors
- [ ] MCMC — Metropolis-Hastings sampler

---

## Requirements

- GHC >= 9.6
- Cabal >= 3.0
- No external Haskell dependencies — only `base`