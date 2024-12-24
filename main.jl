using Pkg

# Activate environment
Pkg.activate(".")
Pkg.instantiate()
Pkg.add("Turing")
Pkg.add("Random")
Pkg.add("Plots")
Pkg.add("StatsPlots")

include("mock_data.jl")
include("model_definition.jl")
include("mcmc.jl")
include("analysis.jl")

using Turing
using Random
using Plots
using StatsPlots

Random.seed!(42)

# Step 1
# Generate synthetic data
true_d = 0.05
true_y0 = 1.0
sigma = 0.01
time_steps = 0:10
y, t = generate_synthetic_data(true_d, true_y0, sigma, time_steps)

# Step 2
# Run MCMC
chain = run_mcmc(y, t, num_samples=1000, num_chains=4)

# Step 3
# Analyze results
analyze_results(chain)

# Step 4
# Posterior Predictive Checks
posterior_predictive_checks(chain, t)