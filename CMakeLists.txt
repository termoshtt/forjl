cmake_minimum_required(VERSION 3.5)

project(julia Fortran)

# XXX Why there is no way to install julia into ubuntu system ???
link_directories($ENV{HOME}/Downloads/julia-1.1.1/lib)

add_executable(julia_example
  julia.f90
  example.f90
  )
target_link_libraries(julia_example julia)

set_property(
  TARGET julia_example
  PROPERTY LINKER_LANGUAGE Fortran
  )
