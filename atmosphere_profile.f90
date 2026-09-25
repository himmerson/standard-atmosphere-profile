program standard_atmosphere
        implicit none

       ! konstanta
        real(8), parameter :: g0 = 9.8d0   ! Gravity
        real(8), parameter :: rd = 287.05d0   ! Dry air gas constant
        real(8), parameter :: gamma = 0.0065d0  ! standard lapse rate

       ! surface initial values
        real(8), parameter :: t0 = 288.15d0  ! surface temp (K)
        real(8), parameter :: p0 = 101325.0d0 ! surface pressure (Pa)

       ! grid parameters
        integer, parameter :: n_levels = 101 ! 0 to 10 km in 100m increments
        real(8), parameter :: dz = 100.0d0 ! step size in meters

       ! variables
        real(8) :: z, t_k, t_c, p_hpa, rho
        real(8) :: exponent
        integer :: i, out_unit


       exponent = g0 / (rd * gamma)

       ! csv file
       open(newunit=out_unit, file="standard_profile.csv", status="replace", action="write")

       write(out_unit, '(A)') "altitude_m, temp_C, pressure_hPa, density_kg_m3"
       print '(A)', "Computing vertical atmospheric profile..."

       ! loop upward from surface to 10 km
       do i = 1, n_levels
       z = real(i - 1, 8) * dz
       t_k = t0 - gamma * z ! temp in kelvin
       t_c = t_k - 273.15d0 ! temp in celsius
       p_hpa = (p0 * (t_k / t0)**exponent) / 100.0d0 ! Pa to hPa
       rho = (p_hpa * 100.0d0) / (rd * t_k) ! density in kg/m^3

       ! Write row: z, T, P, rho
        write(out_unit, '(F8.1, A, F7.2, A, F8.2, A, F7.4)') &
            z, ",", t_c, ",", p_hpa, ",", rho
    end do

        close(out_unit)
         print '(A)', "Done! Profile saved to standard_profile.csv"

end program standard_atmosphere


