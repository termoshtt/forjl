cmake_minimum_required(VERSION 3.5)

project(julia Fortran)
enable_testing()

link_directories(
  /usr/local/julia/lib
  /usr/local/julia/lib/julia/
  )

add_executable(julia_example
  julia.f90
  example.f90
  )
target_link_libraries(julia_example julia)

add_test(
  NAME example
  COMMAND ./julia_example
  )

set_property(
  TARGET julia_example
  PROPERTY LINKER_LANGUAGE Fortran
  )
