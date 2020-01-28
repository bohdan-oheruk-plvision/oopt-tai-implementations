# Copyright 2019-present Open Networking Foundation
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

cc_binary(
    name = "test",
    srcs = [
        "test.cpp",
    ],
    deps = [
        "//tai_mux:libtai-mux",
        "@com_github_oopt_tai//:libmetatai",
        "@com_github_oopt_tai//:tai_hdrs",
        "@com_github_oopt_tai//:meta_hdrs",
    ],
    visibility = [ "//visibility:public" ],
)

genrule(
    name = "link_stub",
    outs = [
        "libtai-stub.so",
    ],
    srcs = [
        "@com_github_oopt_tai//:libtai-stub.so",
    ],
    output_to_bindir = True,
    cmd = "ln $(location @com_github_oopt_tai//:libtai-stub.so) $@",
)

genrule(
    name = "link_static",
    outs = [
        "link_static.json",
    ],
    srcs = [
        "static.json",
    ],
    output_to_bindir = True,
    cmd = "ln $(location static.json) $@",
)

sh_binary(
    name = "run",
    srcs = ["run.sh",],
    data = [
        ":test",
        ":link_stub",
        ":link_static"
    ],
    args = [
        "$(location :link_static)",
        "$(location :test)",
    ],
)
