# Analyze and visualize results
function analyze_results(chain)
    """
    Analyze and visualize the posterior results.

    Parameters:
    - chain: MCMC chain with posterior samples.
    """
    println("Posterior summaries:")
    display(chain)
    plot(chain)
end

# Posterior Predictive Checks with Noise
function posterior_predictive_checks(chain, t; num_samples=100)
    """
    Perform posterior predictive checks.

    Parameters:
    - chain: MCMC chain with posterior samples.
    - t: Time points (Array).

    Outputs:
    - Plot comparing observed vs. predicted outputs with uncertainty.
    """
    d_samples = chain[:d]
    y0_samples = chain[:y0]
    sigma_samples = chain[:sigma]

    # Generate predictive samples
    predicted = [
        mean(y0_samples) * exp(-mean(d_samples) * t[i]) +
        randn() * mean(sigma_samples)  # Add noise based on sigma
        for i in 1:length(t)
    ]
    scatter(t, predicted, label="Predicted", xlabel="Time", ylabel="Output", legend=:top)
end