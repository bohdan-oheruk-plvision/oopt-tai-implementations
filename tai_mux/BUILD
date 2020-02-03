# Copyright 2019-present Open Networking Foundation
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

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
        "@com_github_oopt_tai//:libmetatai",
        "@com_github_oopt_tai//:tai_hdrs",
        "@com_github_oopt_tai//:meta_hdrs",
    ],
    linkopts = [
        "-lpthread",
        "-ldl",
    ],
    visibility = [ "//visibility:public" ],
)

cc_library(
    name = "custom_attrs",
    hdrs = [
        "custom_attrs/mux_hostif.h",
        "custom_attrs/mux_module.h",
        "custom_attrs/mux_netif.h",
    ],
    deps = [
        # "@com_github_oopt_tai//:libmetatai",
        "@com_github_oopt_tai//:tai_hdrs",
        "@com_github_oopt_tai//:meta_hdrs",
    ],
    includes = [
        "custom_attrs/",
    ]
)

cc_library(
    name = "help_lib",
    hdrs = [
        "oopt-tai/tools/lib/attribute.hpp",
        "oopt-tai/tools/lib/exception.hpp",
        "oopt-tai/tools/lib/logger.hpp",
    ],
    srcs = [
        "oopt-tai/tools/lib/attribute.cpp",
    ],
    includes = [
        "oopt-tai/tools/lib/",
    ],
    deps = [
        # "@com_github_oopt_tai//:libmetatai",
        "@com_github_oopt_tai//:tai_hdrs",
        "@com_github_oopt_tai//:meta_hdrs",
    ],
    visibility = [ "//visibility:public" ],
)

cc_library(
    name = "tai_framework",
    hdrs = [
        "oopt-tai/tools/framework/config.hpp",
        "oopt-tai/tools/framework/fsm.hpp",
        "oopt-tai/tools/framework/object.hpp",
        "oopt-tai/tools/framework/platform.hpp",
        # "oopt-tai/tools/framework/examples/basic/basic.hpp",
    ],
    srcs = [
        # "oopt-tai/tools/framework/tai.cpp",
        # "oopt-tai/tools/framework/examples/basic/basic.cpp",
    ],
    includes = [
        "oopt-tai/tools/framework/",
        # "oopt-tai/tools/framework/examples/basic",
    ],
    deps = [
        "@com_github_oopt_tai//:tai_hdrs",
        "@com_github_oopt_tai//:meta_hdrs",
        ":help_lib",
    ],
    linkopts = [
        "-fno-gnu-unique",
    ],
    visibility = [ "//visibility:public" ],
)

cc_binary(
    name = "libtai-mux.so",
    srcs = [
        "module_adapter.cpp",
        "mux.cpp",
        "static_platform_adapter.cpp",
        # "oopt-tai/tools/framework/tai.cpp",

        
        "json.hpp",
        "module_adapter.hpp",
        "mux.hpp",
        "platform_adapter.hpp",
        "static_platform_adapter.hpp",
    ],
    deps = [
        "@com_github_oopt_tai//:libmetatai",
        "@com_github_oopt_tai//:tai_hdrs",
        "@com_github_oopt_tai//:meta_hdrs",
        ":help_lib",
        ":tai_framework",
        ":custom_attrs",
    ],
    linkshared = True,
    linkopts = [
        "-lpthread",
        "-ldl",
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