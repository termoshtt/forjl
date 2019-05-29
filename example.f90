program main
  use julia
  use iso_fortran_env

  integer(c_size_t)         :: length
  integer(c_size_t)         :: size
  type(jl_array_t), pointer :: a
  type(c_ptr)               :: atype

  call jl_init()

  ! Create f64 x 100 1d-array
  atype = jl_apply_array_type(jl_float64_type, 1_int64)
  a => jl_alloc_array_1d(atype, 100_int64)

  write(*, *) a % data_
  write(*, *) a % length
  write(*, *) a % elsize

  call jl_atexit_hook(0)
end program
