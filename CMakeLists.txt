cmake_minimum_required(VERSION 3.5)

project(julia Fortran)

add_executable(julia_example
  julia.f90
  )

set_property(
  TARGET julia_example
  PROPERTY LINKER_LANGUAGE Fortran
  )
