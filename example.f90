program main
  use julia
  call jl_init()
  call jl_eval_string("print(sqrt(2.0))")
  call jl_atexit_hook(0)
end program
