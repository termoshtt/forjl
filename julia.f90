module julia
  implicit none

  interface
    subroutine jl_init__threading() bind(c)
    end subroutine

    subroutine jl_eval_string(string) bind(c)
      use iso_c_binding, only: c_char
      character(kind=c_char) :: string(*)
    end subroutine

    subroutine jl_atexit_hook(st) bind(c)
      use iso_c_binding, only: c_int
      integer(kind=c_int) st
    end subroutine
  end interface

contains
  subroutine jl_init()
    call jl_init__threading()
  end subroutine
end module
