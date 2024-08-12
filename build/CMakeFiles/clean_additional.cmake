# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Release")
  file(REMOVE_RECURSE
  "_deps/colmap-build/colmap_sources_autogen"
  "_deps/colmap-build/src/colmap/controllers/colmap_controllers_autogen"
  "_deps/colmap-build/src/colmap/estimators/colmap_estimators_autogen"
  "_deps/colmap-build/src/colmap/exe/colmap_exe_autogen"
  "_deps/colmap-build/src/colmap/exe/colmap_main_autogen"
  "_deps/colmap-build/src/colmap/feature/colmap_feature_autogen"
  "_deps/colmap-build/src/colmap/feature/colmap_feature_types_autogen"
  "_deps/colmap-build/src/colmap/geometry/colmap_geometry_autogen"
  "_deps/colmap-build/src/colmap/image/colmap_image_autogen"
  "_deps/colmap-build/src/colmap/math/colmap_math_autogen"
  "_deps/colmap-build/src/colmap/mvs/colmap_mvs_autogen"
  "_deps/colmap-build/src/colmap/mvs/colmap_mvs_cuda_autogen"
  "_deps/colmap-build/src/colmap/optim/colmap_optim_autogen"
  "_deps/colmap-build/src/colmap/retrieval/colmap_retrieval_autogen"
  "_deps/colmap-build/src/colmap/scene/colmap_scene_autogen"
  "_deps/colmap-build/src/colmap/sensor/colmap_sensor_autogen"
  "_deps/colmap-build/src/colmap/sfm/colmap_sfm_autogen"
  "_deps/colmap-build/src/colmap/ui/colmap_ui_autogen"
  "_deps/colmap-build/src/colmap/util/colmap_util_autogen"
  "_deps/colmap-build/src/colmap/util/colmap_util_cuda_autogen"
  "_deps/colmap-build/src/thirdparty/LSD/colmap_lsd_autogen"
  "_deps/colmap-build/src/thirdparty/PoissonRecon/colmap_poisson_recon_autogen"
  "_deps/colmap-build/src/thirdparty/SiftGPU/colmap_sift_gpu_autogen"
  "_deps/colmap-build/src/thirdparty/VLFeat/colmap_vlfeat_autogen"
  )
endif()
