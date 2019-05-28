cmake_minimum_required(VERSION 3.5)

project(julia Fortran)

link_directories(
  /usr/local/julia/lib
  )

add_executable(julia_example
  julia.f90
  example.f90
  )
target_link_libraries(julia_example julia)

set_property(
  TARGET julia_example
  PROPERTY LINKER_LANGUAGE Fortran
  )
