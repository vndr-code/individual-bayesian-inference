using Turing

# Define the Bayesian model
@model function degradation_model(y, t)
    """
    Define the Bayesian model for degradation.

    Parameters:
    - y: Observed outputs (Array).
    - t: Time points (Array).

    Returns:
    - Posterior distributions of d, y0, and sigma.
    """
    d ~ Normal(0.05, 0.01)  # Prior for degradation rate
    y0 ~ Normal(1.0, 0.2)   # Prior for initial output
    sigma ~ truncated(Normal(0.0, 0.1), 0, Inf)  # Prior for noise

    # For each time point, model the observed output (y[i]) as noisy data 
    # around the predicted output (y0 * exp(-d * t[i])).
    for i in 1:length(t)
        y[i] ~ Normal(y0 * exp(-d * t[i]), sigma)
    end
end