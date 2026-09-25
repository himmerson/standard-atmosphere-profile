# standard-atmosphere-profile
This project models the International Standard Atmosphere (ISA) from sea level to 10 km. 

It uses a compiled **Fortran** program to calculate the hydrostatic balance and environmental lapse rate, exporting the vertical temperature, pressure, and density data to a CSV. A **Python** script then reads the output and plots the vertical profile.

## Files
* `atmosphere_profile.f90`: The core physics engine calculating temperature, pressure, and density.
* `plot_profile.py`: Uses Pandas and Matplotlib to visualize the generated data.
* `standard_profile.csv`: The numeric output.

## How to Run
1. Compile the Fortran code: `gfortran -o atmosphere atmosphere_profile.f90`
2. Run the executable: `./atmosphere`
3. Generate the plot: `python3 plot_profile.py`
