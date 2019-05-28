module julia
  use iso_c_binding
  implicit none

  type, bind(C) :: jl_array_t
    type(c_ptr) :: data_
    integer(c_size_t)  :: length
    integer(c_int16_t) :: flags   ! FIXME Define binding to jl_array_flags_t bitfield
    integer(c_int16_t) :: elsize
    integer(c_int32_t) :: offset
    integer(c_size_t)  :: nrows
    integer(c_size_t)  :: maxsize ! FIXME This cannot represents 2d or higher dim cases
  endtype

  type(c_ptr), bind(C) :: jl_bool_type
  type(c_ptr), bind(C) :: jl_char_type
  type(c_ptr), bind(C) :: jl_int8_type
  type(c_ptr), bind(C) :: jl_uint8_type
  type(c_ptr), bind(C) :: jl_int16_type
  type(c_ptr), bind(C) :: jl_uint16_type
  type(c_ptr), bind(C) :: jl_int32_type
  type(c_ptr), bind(C) :: jl_uint32_type
  type(c_ptr), bind(C) :: jl_int64_type
  type(c_ptr), bind(C) :: jl_uint64_type
  type(c_ptr), bind(C) :: jl_float16_type
  type(c_ptr), bind(C) :: jl_float32_type
  type(c_ptr), bind(C) :: jl_float64_type

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

    function jl_alloc_array_1d(atype, size) result(array) bind(c)
      use iso_c_binding
      import jl_array_t
      type(c_ptr)               :: atype
      integer(kind=c_size_t)    :: size
      type(jl_array_t), pointer :: array
    end
  end interface

contains
  subroutine jl_init()
    call jl_init__threading()
  end subroutine
end module
