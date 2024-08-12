# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/home/valteu/study/mml/glomap/build/_deps/poselib-src")
  file(MAKE_DIRECTORY "/home/valteu/study/mml/glomap/build/_deps/poselib-src")
endif()
file(MAKE_DIRECTORY
  "/home/valteu/study/mml/glomap/build/_deps/poselib-build"
  "/home/valteu/study/mml/glomap/build/_deps/poselib-subbuild/poselib-populate-prefix"
  "/home/valteu/study/mml/glomap/build/_deps/poselib-subbuild/poselib-populate-prefix/tmp"
  "/home/valteu/study/mml/glomap/build/_deps/poselib-subbuild/poselib-populate-prefix/src/poselib-populate-stamp"
  "/home/valteu/study/mml/glomap/build/_deps/poselib-subbuild/poselib-populate-prefix/src"
  "/home/valteu/study/mml/glomap/build/_deps/poselib-subbuild/poselib-populate-prefix/src/poselib-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/valteu/study/mml/glomap/build/_deps/poselib-subbuild/poselib-populate-prefix/src/poselib-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/valteu/study/mml/glomap/build/_deps/poselib-subbuild/poselib-populate-prefix/src/poselib-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
