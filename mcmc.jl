# Run MCMC Sampling
function run_mcmc(y, t; num_samples=1000, num_chains=4)
    """
    Perform MCMC sampling using Turing.jl.

    Parameters:
    - y: Observed outputs (Array).
    - t: Time points (Array).
    - num_samples: Number of MCMC samples (default: 1000).
    - num_chains: Number of MCMC chains (default: 4).

    Returns:
    - chain: MCMC chain with posterior samples.
    """
    model = degradation_model(y, t)
    sampler = NUTS(0.65)
    chain = sample(model, sampler, MCMCThreads(), num_samples, num_chains)
    return chain
end