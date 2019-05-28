program main
  use julia
  use iso_fortran_env

  type(jl_array_t), pointer :: a
  integer(c_size_t) :: length

  call jl_init()

  a = float64_array_1d(10_int64)
  write(*, *) a%length

  call jl_atexit_hook(0)
end program
