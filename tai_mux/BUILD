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
        "@com_github_oopt_tai//:help_lib",
        "@com_github_oopt_tai//:tai_framework",
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