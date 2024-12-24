# Bayesian Inference for Degradation

This project demonstrates how to use Bayesian inference with Turing.jl to estimate the degradation rate and initial output over time.

## Features
- Generate mock data for outputs.
- Define a Bayesian model for degradation using Turing.jl.
- Perform MCMC sampling to estimate parameters.
- Visualize posterior distributions and perform posterior predictive checks.

## How to Run
1. Install Julia (tested with Julia 1.17.9).
2. Install dependencies:
   ```julia
   using Pkg
   Pkg.add(["Turing", "Plots", "StatsPlots", "Random"])

