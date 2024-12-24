# Generate synthetic data
function generate_synthetic_data(true_d, true_y0, sigma, time_steps)
    """
    Generate synthetic data for degradation.

    Parameters:
    - true_d: True degradation rate (scalar).
    - true_y0: True initial output (scalar).
    - sigma: Noise standard deviation (scalar).
    - time_steps: Array of time points (e.g., 0:10).

    Returns:
    - y: Simulated output data (Array).
    - t: Time points (Array).
    """
    y = [true_y0 * exp(-true_d * t) + randn() * sigma for t in time_steps]
    return y, time_steps
end