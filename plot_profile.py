import pandas as pd
import matplotlib.pyplot as plt

# Load the Fortran output
df = pd.read_csv("standard_profile.csv", skipinitialspace=True)

# Create a 1x2 plot layout
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 6), sharey=True)

# Plot Temperature vs Altitude
ax1.plot(df["temp_C"], df["altitude_m"] / 1000, color="crimson", linewidth=2)
ax1.set_xlabel("Temperature (°C)", fontsize=12, fontweight="bold", color="crimson")
ax1.set_ylabel("Altitude (km)", fontsize=12, fontweight="bold")
ax1.grid(True, linestyle="--", alpha=0.7)

# Plot Pressure vs Altitude
ax2.plot(df["pressure_hPa"], df["altitude_m"] / 1000, color="navy", linewidth=2)
ax2.set_xlabel("Pressure (hPa)", fontsize=12, fontweight="bold", color="navy")
ax2.grid(True, linestyle="--", alpha=0.7)

plt.suptitle("Standard Atmosphere Profile", fontsize=14, fontweight="bold")
plt.tight_layout()
plt.show()


