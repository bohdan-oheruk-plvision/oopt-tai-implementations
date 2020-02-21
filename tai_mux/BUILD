# Copyright 2019-present Open Networking Foundation
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

# Copyright 2019-present Open Networking Foundation
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

LIBCLANG_PATH="/usr/lib/llvm-10/lib/libclang.so.1"
exports_files(["pip-requirements.txt"])

load("@tai_meta_deps//:requirements.bzl", meta_all_requirements = "all_requirements")

py_binary(
    name = "main",
    srcs = ["oopt-tai/meta/main.py"],
    deps = depset(meta_all_requirements).to_list(),
)

cc_library (
    name = "tai_hdrs",
    hdrs = [
        "oopt-tai/inc/tai.h",
        "oopt-tai/inc/taihostif.h",
        "oopt-tai/inc/taimodule.h",
        "oopt-tai/inc/tainetworkif.h",
        "oopt-tai/inc/taistatus.h",
        "oopt-tai/inc/taitypes.h",
    ],
    includes = [
        "oopt-tai/inc/",
    ],
    visibility = [ '//visibility:public' ],
)

genrule(
    name = "taimetadata_c",
    cmd = "$(location :main) --clang-lib " + LIBCLANG_PATH + " $(location oopt-tai/inc/tai.h) && mv taimetadata.c $(@D)",
    outs = [
        "oopt-tai/meta/taimetadata.c",
    ],
    tools = [
        ":main", 
        "oopt-tai/inc/tai.h",
        "oopt-tai/inc/taihostif.h",
        "oopt-tai/inc/taimodule.h",
        "oopt-tai/inc/tainetworkif.h",
        "oopt-tai/inc/taistatus.h",
        "oopt-tai/inc/taitypes.h",
    ]
)

genrule(
    name = "taimetadata_h",
    cmd = "$(location :main) --clang-lib " + LIBCLANG_PATH + " $(location oopt-tai/inc/tai.h) && mv taimetadata.h $(@D)",
    outs = [
        "oopt-tai/meta/taimetadata.h",
    ],
    tools = [
        ":main", 
        "oopt-tai/inc/tai.h",
        "oopt-tai/inc/taihostif.h",
        "oopt-tai/inc/taimodule.h",
        "oopt-tai/inc/tainetworkif.h",
        "oopt-tai/inc/taistatus.h",
        "oopt-tai/inc/taitypes.h",
    ]
)

#--------------------------------------------------------
cc_binary(
    name = "libtai-stub.so",
    srcs = [
        "stub/stub_tai.c",
    ],
    deps = [
        ":libmetatai",
    ],
    includes = [
        "oopt-tai/inc/",
        "oopt-tai/meta/",
    ],
    linkshared = True,
    visibility = [ '//visibility:public' ],
)

cc_import(
    name = "libtai-stub",
    shared_library = "libtai-stub.so",
    visibility = [ '//visibility:public' ],
)
#--------------------------------------------------------

cc_library(
    name = "meta_hdrs",
    hdrs = [
        ":taimetadata_h",
        "oopt-tai/meta/taimetadatatypes.h",
        "oopt-tai/meta/taimetadatautils.h",
        "oopt-tai/meta/cJSON.h",
        "oopt-tai/meta/taimetadatalogger.h",
        "oopt-tai/meta/taiserialize.h",
    ],
    includes = [
        "oopt-tai/meta/",
    ],
    copts = ["-Ioopt-tai/meta"],
    visibility = [ '//visibility:public' ],
)

cc_binary(
    name = "libmetatai.so",
    srcs = [
        ":taimetadata_c",
        "oopt-tai/meta/taiserialize.c",
        "oopt-tai/meta/cJSON.c",
        "oopt-tai/meta/taimetadatautils.c",
    ],
    deps = [
        ":tai_hdrs",
        ":meta_hdrs",
    ],
    # copts = ["-Ioopt-tai/meta"],
    linkshared = True,
    includes = [
        "oopt-tai/inc/",
        "oopt-tai/meta/",
    ],
    
    visibility = [ '//visibility:public' ],
)

cc_import(
    name = "libmetatai",
    hdrs = [
        ":taimetadata_h",
        "oopt-tai/meta/taimetadatatypes.h",
        "oopt-tai/meta/taimetadatautils.h",
        "oopt-tai/meta/cJSON.h",
        "oopt-tai/meta/taimetadatalogger.h",
        "oopt-tai/meta/taiserialize.h",
        "oopt-tai/inc/tai.h",
        "oopt-tai/inc/taihostif.h",
        "oopt-tai/inc/taimodule.h",
        "oopt-tai/inc/tainetworkif.h",
        "oopt-tai/inc/taistatus.h",
        "oopt-tai/inc/taitypes.h",
    ],
    shared_library = "libmetatai.so",
    visibility = [ '//visibility:public' ],
)

cc_binary(
    name = "test",
    srcs = [
        "oopt-tai/test/test.c",
    ],
    deps = [
        ":libmetatai",
        ":libtai-stub",
    ],
    includes = [
        "oopt-tai/inc/",
        "oopt-tai/meta/",
    ],
)

cc_library(
    name = "tools_lib",
    hdrs = [
        "oopt-tai/tools/lib/attribute.hpp",
        "oopt-tai/tools/lib/exception.hpp",
        "oopt-tai/tools/lib/logger.hpp",
    ],
    srcs = [
        "oopt-tai/tools/lib/attribute.cpp"
    ],
    includes = [
        "oopt-tai/tools/lib"
    ],
    deps = [
        ":tai_hdrs",
        ":meta_hdrs"
    ],
    visibility = [ '//visibility:public' ],
)

cc_library(
    name = "tools_framework",
    hdrs = [
        "oopt-tai/tools/framework/config.hpp",
        "oopt-tai/tools/framework/fsm.hpp",
        "oopt-tai/tools/framework/object.hpp",
        "oopt-tai/tools/framework/platform.hpp",
    ],
    srcs = [
        "oopt-tai/tools/framework/tai.cpp"
    ],
    includes = [
        "oopt-tai/tools/lib",
        "oopt-tai/tools/framework",
        "oopt-tai/meta",
        "oopt-tai/inc",
    ],
    deps = [
        ":libmetatai",
        ":tai_hdrs",
        ":meta_hdrs",
        ":tools_lib"
    ],
    visibility = [ '//visibility:public' ],
)

cc_library(
    name = "tai-mux",
    hdrs = [
        "json.hpp",
        "module_adapter.hpp",
        "mux.hpp",
        "platform_adapter.hpp",
        "static_platform_adapter.hpp",
    ],
    srcs = [
        "module_adapter.cpp",
        "mux.cpp",
        "static_platform_adapter.cpp",
        "tai.cpp",
    ],
    deps = [
        ":libmetatai",
        ":tai_hdrs",
        ":meta_hdrs",
    ],
    linkopts = [
        "-lpthread",
        "-ldl",
    ],
    visibility = [ "//visibility:public" ],
)

cc_binary(
    name = "libtai-mux.so",
    srcs = [
        "module_adapter.cpp",
        "mux.cpp",
        "static_platform_adapter.cpp",
        "platform_adapter.cpp",
        
        "json.hpp",
        "module_adapter.hpp",
        "mux.hpp",
        "platform_adapter.hpp",
        "static_platform_adapter.hpp",

        "oopt-tai/tools/framework/config.hpp",
        "oopt-tai/tools/framework/fsm.hpp",
        "oopt-tai/tools/framework/object.hpp",
        "oopt-tai/tools/framework/platform.hpp",
        "oopt-tai/tools/framework/tai.cpp",

        "custom_attrs/mux_hostif.h",
        "custom_attrs/mux_module.h",
        "custom_attrs/mux_netif.h",
    ],
    deps = [
        ":libmetatai",
        ":tools_lib",
    ],
    linkshared = True,
    linkopts = [
        "-lpthread",
        "-ldl",
    ],
    copts = [
        "-include$(location mux.hpp)",
    ],
    includes = [
        "oopt-tai/tools/lib",
        "oopt-tai/tools/framework",
        "meta",
        "oopt-tai/inc",
    ],
    
    visibility = [ '//visibility:public' ],
)

cc_import(
    name = "libtai-mux",
    hdrs = [
        "json.hpp",
        "module_adapter.hpp",
        "mux.hpp",
        "platform_adapter.hpp",
        "static_platform_adapter.hpp",
    ],
    shared_library = "libtai-mux.so",
    visibility = [ '//visibility:public' ],
)