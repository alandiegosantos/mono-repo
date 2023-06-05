load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def debian_archives(**kwargs):  # buildifier: disable=function-docstring

    http_file(
        name = "amd64_debian11_binutils",
        downloaded_file_path = "binutils_2.35.2-2_amd64.deb",
        sha256 = "0b5c5b871029601a85131285d58e2f872e699d164ab157d9de8d2e081c234321",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/binutils_2.35.2-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_binutils-aarch64-linux-gnu",
        downloaded_file_path = "binutils-aarch64-linux-gnu_2.35.2-2_amd64.deb",
        sha256 = "b5d852fa469ac600304a7737e4f05a1f32465eb79d362faedeb36856a5b69c45",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/binutils-aarch64-linux-gnu_2.35.2-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_binutils-common",
        downloaded_file_path = "binutils-common_2.35.2-2_amd64.deb",
        sha256 = "47cd7cb9bf37f657993a6ef2f24d4943ded5ef616d866f2d43bdf5e5b3abb6ea",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/binutils-common_2.35.2-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_build-essential",
        downloaded_file_path = "build-essential_12.9_amd64.deb",
        sha256 = "bbfd38de41898a06326f2a6ce4cc43e8e399f5566381231065b01d70499d5ba5",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/build-essential/build-essential_12.9_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_bzip2",
        downloaded_file_path = "bzip2_1.0.8-4_amd64.deb",
        sha256 = "038b337a9f2b9bb39c6b03b3bdd79b85dec6dd360e0b93711659b91433b4d754",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/bzip2/bzip2_1.0.8-4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "amd64_debian11_cpp",
        downloaded_file_path = "cpp_10.2.1-1_amd64.deb",
        sha256 = "43bf075f7da8d2a30ab0799452ec49c2ae4fb47260f406f5470e2b63593f795b",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-defaults/cpp_10.2.1-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_cpp-10",
        downloaded_file_path = "cpp-10_10.2.1-6_amd64.deb",
        sha256 = "ed2018b8c7ab7006826ccfcc6d306c3a5e1c6dc12595022e4e02913302fdc10e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/cpp-10_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_dash",
        downloaded_file_path = "dash_0.5.11+git20200708+dd9ef66-5_amd64.deb",
        sha256 = "0a4cc532fbf2c78cb4090a659fb73560981e626849532e6186f3a3ac6a45b3bc",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/d/dash/dash_0.5.11+git20200708+dd9ef66-5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_dirmngr",
        downloaded_file_path = "dirmngr_2.2.27-2+deb11u2_amd64.deb",
        sha256 = "2093f798ca7b1d0b7f2da83914bbc6ea9ab3f1f5fccda9aa43b7c6abff3c53cb",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/dirmngr_2.2.27-2+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_dpkg-dev",
        downloaded_file_path = "dpkg-dev_1.20.12_all.deb",
        sha256 = "1503f654ac1be961541cff5b6c4dcfbbd13c6da448ed2e9d91c6723cae779485",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/d/dpkg/dpkg-dev_1.20.12_all.deb"],
    )
    http_file(
        name = "amd64_debian11_fakeroot",
        downloaded_file_path = "fakeroot_1.25.3-1.1_amd64.deb",
        sha256 = "b67966ee7bad5e87f4ae7eecb6f4fe76ba7c12af7b9876c09f1e758eb742232c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/fakeroot/fakeroot_1.25.3-1.1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_fontconfig-config",
        downloaded_file_path = "fontconfig-config_2.13.1-4.2_all.deb",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    http_file(
        name = "amd64_debian11_fonts-dejavu-core",
        downloaded_file_path = "fonts-dejavu-core_2.37-2_all.deb",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    http_file(
        name = "amd64_debian11_gpp",
        downloaded_file_path = "g++_10.2.1-1_amd64.deb",
        sha256 = "40d45cf1d877a306f71d0eff6c0b79469364b52215a1d23cf9a6d8698a1890b4",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-defaults/g++_10.2.1-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_gpp-10",
        downloaded_file_path = "g++-10_10.2.1-6_amd64.deb",
        sha256 = "d25a7566c15c63c56eb34fa98e0663805ceb7cfd8054c2b6ae3f09be6982671c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/g++-10_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_gcc",
        downloaded_file_path = "gcc_10.2.1-1_amd64.deb",
        sha256 = "ad255447cc1b46f378c6dd483148f59c73ca8d7201df4a0681323f71e910d823",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-defaults/gcc_10.2.1-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_gcc-10",
        downloaded_file_path = "gcc-10_10.2.1-6_amd64.deb",
        sha256 = "07af57b8d276f330830cf67ef144e461817e0ad99ac12c1e9e7e6b6882a4b42a",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/gcc-10_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_git",
        downloaded_file_path = "git_2.30.2-1+deb11u2_amd64.deb",
        sha256 = "ddc8eb5da311dbf0ecfe4bd4da5f539aeecec22865828538b5c86039af2eca8c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/git/git_2.30.2-1+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_git-man",
        downloaded_file_path = "git-man_2.30.2-1+deb11u2_all.deb",
        sha256 = "d77d7d288ad70c87cf52128036c0ab1ead4bee1793c24ab1bc626d9385baffea",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/git/git-man_2.30.2-1+deb11u2_all.deb"],
    )
    http_file(
        name = "amd64_debian11_gnupg",
        downloaded_file_path = "gnupg_2.2.27-2+deb11u2_all.deb",
        sha256 = "a89ecdc6fc8e39f74a27b9b9823fc2fb22103b5965212d54eea86f9f16769042",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gnupg_2.2.27-2+deb11u2_all.deb"],
    )
    http_file(
        name = "amd64_debian11_gnupg-l10n",
        downloaded_file_path = "gnupg-l10n_2.2.27-2+deb11u2_all.deb",
        sha256 = "8000012a7532112a4167200b968170a1bb354591b98ff237e5185804372565df",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gnupg-l10n_2.2.27-2+deb11u2_all.deb"],
    )
    http_file(
        name = "amd64_debian11_gnupg-utils",
        downloaded_file_path = "gnupg-utils_2.2.27-2+deb11u2_amd64.deb",
        sha256 = "bf55eaab2e1b818151fb5b8f2ca84e6680cc8d91a7b9a66c5c2f381aeaa43190",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gnupg-utils_2.2.27-2+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_gpg",
        downloaded_file_path = "gpg_2.2.27-2+deb11u2_amd64.deb",
        sha256 = "7f3c723450a8bc3b1b51b68145bb381d62a7d2f173e629e725312b599ed9fbf3",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpg_2.2.27-2+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_gpg-agent",
        downloaded_file_path = "gpg-agent_2.2.27-2+deb11u2_amd64.deb",
        sha256 = "1a5610a488ec05f3f4435150255449a56772346ad114353dfba1e4400a7d923c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpg-agent_2.2.27-2+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_gpg-wks-client",
        downloaded_file_path = "gpg-wks-client_2.2.27-2+deb11u2_amd64.deb",
        sha256 = "c15d038851d0d55a95f072d6697c97f5fbb5a1201173fabdddf22736245f20eb",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpg-wks-client_2.2.27-2+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_gpg-wks-server",
        downloaded_file_path = "gpg-wks-server_2.2.27-2+deb11u2_amd64.deb",
        sha256 = "acefe42e4307c6e9eb4618c8c038f3c10f1ef6100ff23afd5832b6f20cd39919",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpg-wks-server_2.2.27-2+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_gpgconf",
        downloaded_file_path = "gpgconf_2.2.27-2+deb11u2_amd64.deb",
        sha256 = "6e0e48425c10054fd8ecd163c751afc8bf5cd0442a9b7558bfeb48c6b930c266",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpgconf_2.2.27-2+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_gpgsm",
        downloaded_file_path = "gpgsm_2.2.27-2+deb11u2_amd64.deb",
        sha256 = "d50dd7c49277542edd4291f41e080fe7dfe09cf3676227c386f0cb9666dd2cbf",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpgsm_2.2.27-2+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_javascript-common",
        downloaded_file_path = "javascript-common_11+nmu1_all.deb",
        sha256 = "e144ab36fedb6f9ae02b1030b49258f99126f5ebbecd49957f84a42436bbcbfd",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/j/javascript-common/javascript-common_11+nmu1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_less",
        downloaded_file_path = "less_551-2_amd64.deb",
        sha256 = "068fa7a7b9f663bbd6d7ae5775942fc363fac86f2d966de0008646e2274d91ca",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/l/less/less_551-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libalgorithm-diff-perl",
        downloaded_file_path = "libalgorithm-diff-perl_1.201-1_all.deb",
        sha256 = "3a8b61891f0ce9bd310088ce2d269d63b5afd88b9196fa4f046fd890faea4a17",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/liba/libalgorithm-diff-perl/libalgorithm-diff-perl_1.201-1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_libalgorithm-diff-xs-perl",
        downloaded_file_path = "libalgorithm-diff-xs-perl_0.04-6+b1_amd64.deb",
        sha256 = "c6c623e1f294ee333400d3cb9f8f498e66f27060ff198f984c22b990b630fd84",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/liba/libalgorithm-diff-xs-perl/libalgorithm-diff-xs-perl_0.04-6+b1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libalgorithm-merge-perl",
        downloaded_file_path = "libalgorithm-merge-perl_0.08-3_all.deb",
        sha256 = "8743b526038e61a684b8327435c462288395d5b4f6b5b102d6ad11cbfccb52c7",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/liba/libalgorithm-merge-perl/libalgorithm-merge-perl_0.08-3_all.deb"],
    )
    http_file(
        name = "amd64_debian11_libasan6",
        downloaded_file_path = "libasan6_10.2.1-6_amd64.deb",
        sha256 = "572bf4571970c35bbebb6d3fdb7f2a5fbb02f3f07e86d791c7a211d84df999e5",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libasan6_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libassuan0",
        downloaded_file_path = "libassuan0_2.5.3-7.1_amd64.deb",
        sha256 = "26df8b458372fdea20ff89a19dec1d1aaf7bb1e27c3b4af5be84be1937692ba7",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/liba/libassuan/libassuan0_2.5.3-7.1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libatomic1",
        downloaded_file_path = "libatomic1_10.2.1-6_amd64.deb",
        sha256 = "e8f1d04653698ab185c1144f35f905a1de87571c12ea630b65be669a2823d8c7",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libatomic1_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libbinutils",
        downloaded_file_path = "libbinutils_2.35.2-2_amd64.deb",
        sha256 = "3f7c5bdaeab9446c8e3e282a61e160a78c426b69c5203f2d8a19037c5bf3b4eb",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/libbinutils_2.35.2-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libbrotli1",
        downloaded_file_path = "libbrotli1_1.0.9-2+b2_amd64.deb",
        sha256 = "65ca7d8b03e9dac09c5d544a89dd52d1aeb74f6a19583d32e4ff5f0c77624c24",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libbsd0",
        downloaded_file_path = "libbsd0_0.11.3-1_amd64.deb",
        sha256 = "284a7b8dcfcad74770f57360721365317448b38ab773db542bf630e94e60c13e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libb/libbsd/libbsd0_0.11.3-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libc-dev-bin",
        downloaded_file_path = "libc-dev-bin_2.31-13+deb11u6_amd64.deb",
        sha256 = "1824442ecc4f729f8bbffc0758880557a2316b4296947d2f4e1cf74de72be50f",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/glibc/libc-dev-bin_2.31-13+deb11u6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libc-devtools",
        downloaded_file_path = "libc-devtools_2.31-13+deb11u6_amd64.deb",
        sha256 = "0e6e22b4fdd97ae50638f77a431fd942f23aaf240f73ba39d0428f2387dac0ba",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/glibc/libc-devtools_2.31-13+deb11u6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libc6-dev",
        downloaded_file_path = "libc6-dev_2.31-13+deb11u6_amd64.deb",
        sha256 = "182581b23e7fb4e9f0dd2a88d97fb9f582e39a30f1827225f44404e087d2b945",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/glibc/libc6-dev_2.31-13+deb11u6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libcbor0",
        downloaded_file_path = "libcbor0_0.5.0+dfsg-2_amd64.deb",
        sha256 = "6fa461966cc8b9c91777ca3a450917e2b45ce77d3a13f07cd03cfa42dc8b0ebf",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libc/libcbor/libcbor0_0.5.0+dfsg-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libcc1-0",
        downloaded_file_path = "libcc1-0_10.2.1-6_amd64.deb",
        sha256 = "762808789cccba7d6bc5baa369b0e230ca716c623d51a7ebde4ad06938ce81f6",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libcc1-0_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libcrypt-dev",
        downloaded_file_path = "libcrypt-dev_4.4.18-4_amd64.deb",
        sha256 = "8b04bf00b8c43360d9ba3adec209db290168ba3526d4aef3175fb84372b1bebf",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxcrypt/libcrypt-dev_4.4.18-4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libctf-nobfd0",
        downloaded_file_path = "libctf-nobfd0_2.35.2-2_amd64.deb",
        sha256 = "74bbaddb02d19e6ccb331819087aa02e94ded72e93294c51e3ba3c29dbcd9a2b",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/libctf-nobfd0_2.35.2-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libctf0",
        downloaded_file_path = "libctf0_2.35.2-2_amd64.deb",
        sha256 = "192c1631903259e6770b2f09dcab982f55497b770fe76d6c4febadfbb0be1318",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/libctf0_2.35.2-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libcurl3-gnutls",
        downloaded_file_path = "libcurl3-gnutls_7.74.0-1.3+deb11u7_amd64.deb",
        sha256 = "60bbf5a8a04b3c839f5e241980e0959c5ee4c9f8c6bade0d4c95547fe82fbbd6",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/c/curl/libcurl3-gnutls_7.74.0-1.3+deb11u7_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libdeflate0",
        downloaded_file_path = "libdeflate0_1.7-1_amd64.deb",
        sha256 = "dadaf0d28360f6eb21ad389b2e0f12f8709c9de539b28de9c11d7ec7043dec95",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libd/libdeflate/libdeflate0_1.7-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libdpkg-perl",
        downloaded_file_path = "libdpkg-perl_1.20.12_all.deb",
        sha256 = "62b6da489682a684c8224a2cca0fc83d239846696cca5f67d5699c1df14b56ea",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/d/dpkg/libdpkg-perl_1.20.12_all.deb"],
    )
    http_file(
        name = "amd64_debian11_libedit2",
        downloaded_file_path = "libedit2_3.1-20191231-2+b1_amd64.deb",
        sha256 = "ac545f6ad10ba791aca24b09255ad1d6d943e6bc7c5511d5998e104aee51c943",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libe/libedit/libedit2_3.1-20191231-2+b1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_liberror-perl",
        downloaded_file_path = "liberror-perl_0.17029-1_all.deb",
        sha256 = "594083f3588e82b725f2b0532c0fc85f7c9e306fcac26ba4401572d214d90c72",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libe/liberror-perl/liberror-perl_0.17029-1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_libexpat1",
        downloaded_file_path = "libexpat1_2.2.10-2+deb11u5_amd64.deb",
        sha256 = "5744040c4735bcdd51238aebfa3e402b857244897f1007f61154982ebe5abbd7",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libexpat1-dev",
        downloaded_file_path = "libexpat1-dev_2.2.10-2+deb11u5_amd64.deb",
        sha256 = "ec82eb630c2c357ba99cc4a1480ff382b46bc5f2e867e36d186314d1f2081255",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/e/expat/libexpat1-dev_2.2.10-2+deb11u5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libfakeroot",
        downloaded_file_path = "libfakeroot_1.25.3-1.1_amd64.deb",
        sha256 = "04dace71ea2e14940bd0491e41331df77b5a5da82fe98ead228df756b4fe0bc8",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/fakeroot/libfakeroot_1.25.3-1.1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libfido2-1",
        downloaded_file_path = "libfido2-1_1.6.0-2_amd64.deb",
        sha256 = "e9efa10b4e45e8c941883b4bea29bc68dc5a298b8619bd786a7ca1675ca0c197",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libf/libfido2/libfido2-1_1.6.0-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libfile-fcntllock-perl",
        downloaded_file_path = "libfile-fcntllock-perl_0.22-3+b7_amd64.deb",
        sha256 = "dcc33dd1be11596f475c53ad11b5b62fdf611529e08c9cfe6a57277d9efc4165",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libf/libfile-fcntllock-perl/libfile-fcntllock-perl_0.22-3+b7_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libfontconfig1",
        downloaded_file_path = "libfontconfig1_2.13.1-4.2_amd64.deb",
        sha256 = "b92861827627a76e74d6f447a5577d039ef2f95da18af1f29aa98fb96baea4c1",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libfreetype6",
        downloaded_file_path = "libfreetype6_2.10.4+dfsg-1+deb11u1_amd64.deb",
        sha256 = "b21cfdd12adf6cac4af320c2485fb62a8a5edc6f9768bc2288fd686f4fa6dfdf",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgcc-10-dev",
        downloaded_file_path = "libgcc-10-dev_10.2.1-6_amd64.deb",
        sha256 = "3b711374092b84e732c4e73cf33e02cff02e34a5f105eb6467de8d9038e4cd9d",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libgcc-10-dev_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgd3",
        downloaded_file_path = "libgd3_2.3.0-2_amd64.deb",
        sha256 = "fadaa01272200dcaa476c6b8908e1faa93d6840610beca909099647829f3fdc1",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libg/libgd2/libgd3_2.3.0-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgdbm-compat4",
        downloaded_file_path = "libgdbm-compat4_1.19-2_amd64.deb",
        sha256 = "e62caed68b0ffaa03b5fa539d6fdc08c4151f66236d5878949bead0b71b7bb09",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gdbm/libgdbm-compat4_1.19-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgdbm6",
        downloaded_file_path = "libgdbm6_1.19-2_amd64.deb",
        sha256 = "e54cfe4d8b8f209bb7df31a404ce040f7c2f9b1045114a927a7e1061cdf90727",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gdbm/libgdbm6_1.19-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_amd64.deb",
        sha256 = "4530c95aefa48e33fd8cf4acbe5c4b559dbe7bdf4c56469986c83a203982cef1",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgpm2",
        downloaded_file_path = "libgpm2_1.20.7-8_amd64.deb",
        sha256 = "8c6f58b2f0592fdc9d29abc979d3ff47f2c449e20c4f1b326f84165a86115c7b",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gpm/libgpm2_1.20.7-8_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libisl23",
        downloaded_file_path = "libisl23_0.23-1_amd64.deb",
        sha256 = "41eeaf9557571044f75b31730c05c22df3039d3152afd27b9fd33206f2fd5f7e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/i/isl/libisl23_0.23-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libitm1",
        downloaded_file_path = "libitm1_10.2.1-6_amd64.deb",
        sha256 = "fa1596ec64610463b0f805fe5aa7e2537682c1c77f1e08335456bfc36766c259",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libitm1_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libjbig0",
        downloaded_file_path = "libjbig0_2.1-3.1+b2_amd64.deb",
        sha256 = "9646d69eefce505407bf0437ea12fb7c2d47a3fd4434720ba46b642b6dcfd80f",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/j/jbigkit/libjbig0_2.1-3.1+b2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libjpeg62-turbo",
        downloaded_file_path = "libjpeg62-turbo_2.0.6-4_amd64.deb",
        sha256 = "28de780a1605cf501c3a4ebf3e588f5110e814b208548748ab064100c32202ea",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libjs-jquery",
        downloaded_file_path = "libjs-jquery_3.5.1+dfsg+~3.5.5-7_all.deb",
        sha256 = "b57b83ab5a3b1f055860bdf86f9316124f1da3c75fbba5dabbcb3cd3707c95ed",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/node-jquery/libjs-jquery_3.5.1+dfsg+~3.5.5-7_all.deb"],
    )
    http_file(
        name = "amd64_debian11_libjs-sphinxdoc",
        downloaded_file_path = "libjs-sphinxdoc_3.4.3-2_all.deb",
        sha256 = "f789debe1bc0164064d502d0230c98f9c5857331e43e02e9487fc42c4068bea9",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/s/sphinx/libjs-sphinxdoc_3.4.3-2_all.deb"],
    )
    http_file(
        name = "amd64_debian11_libjs-underscore",
        downloaded_file_path = "libjs-underscore_1.9.1~dfsg-3_all.deb",
        sha256 = "85fb8fd215bc742f1a17285b3bf38a2a0d0aa5b2c2188f8d7dec2323d2ab945d",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/u/underscore/libjs-underscore_1.9.1~dfsg-3_all.deb"],
    )
    http_file(
        name = "amd64_debian11_libksba8",
        downloaded_file_path = "libksba8_1.5.0-3+deb11u2_amd64.deb",
        sha256 = "f72284b77fb6ad5be6d6359d989d9f92fa4eec531ebdbf8c17febecce42fc858",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libk/libksba/libksba8_1.5.0-3+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libldap-2.4-2",
        downloaded_file_path = "libldap-2.4-2_2.4.57+dfsg-3+deb11u1_amd64.deb",
        sha256 = "3d79ee84c42c1d1b58a6e0d7debc7e3c8444147b84412b8248a7789809bc3163",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/o/openldap/libldap-2.4-2_2.4.57+dfsg-3+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libldap-common",
        downloaded_file_path = "libldap-common_2.4.57+dfsg-3+deb11u1_all.deb",
        sha256 = "ffa2e83a690a551c0d3b77c29f606758df177b056abe4514f6e8286dc344ea5c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/o/openldap/libldap-common_2.4.57+dfsg-3+deb11u1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_liblocale-gettext-perl",
        downloaded_file_path = "liblocale-gettext-perl_1.07-4+b1_amd64.deb",
        sha256 = "af50e8191f505b2afc0bdc1b6323a75842bfeed9e5a092565824cf4913f2d340",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libl/liblocale-gettext-perl/liblocale-gettext-perl_1.07-4+b1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_liblsan0",
        downloaded_file_path = "liblsan0_10.2.1-6_amd64.deb",
        sha256 = "6b5853688bb6d6bb9050d79ab732c751aa3ac7a5ed2404f7a6b53e7d4499bddc",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/liblsan0_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libmd0",
        downloaded_file_path = "libmd0_1.0.3-3_amd64.deb",
        sha256 = "9e425b3c128b69126d95e61998e1b5ef74e862dd1fc953d91eebcc315aea62ea",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libm/libmd/libmd0_1.0.3-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libmpc3",
        downloaded_file_path = "libmpc3_1.2.0-1_amd64.deb",
        sha256 = "8ba77ec6878d3f5e9ebec240e9a2a867325ae47c0d728cfcc4c90830f903a3bc",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/mpclib3/libmpc3_1.2.0-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libmpdec3",
        downloaded_file_path = "libmpdec3_2.5.1-1_amd64.deb",
        sha256 = "816404866f754d5662d69db50072018dccb78cf372fc38e0be961fab0f57d741",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/mpdecimal/libmpdec3_2.5.1-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libmpfr6",
        downloaded_file_path = "libmpfr6_4.1.0-3_amd64.deb",
        sha256 = "5d26306d12a45a8a03dca473490d56a765b58d61b53146c1c7784903cf59c45d",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/mpfr4/libmpfr6_4.1.0-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libncursesw6",
        downloaded_file_path = "libncursesw6_6.2+20201114-2+deb11u1_amd64.deb",
        sha256 = "4a53efece402caaa798649f74bfb63fe21ac2fbcacf302554e46fbd17e5b30fc",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/ncurses/libncursesw6_6.2+20201114-2+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libnghttp2-14",
        downloaded_file_path = "libnghttp2-14_1.43.0-1_amd64.deb",
        sha256 = "a1a8aae24ced43025c94a9cb0c0eabfb3fc070785de9ee51c9a3a4fe86f0d11e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/nghttp2/libnghttp2-14_1.43.0-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libnpth0",
        downloaded_file_path = "libnpth0_1.6-3_amd64.deb",
        sha256 = "43c90d45f7cf5584108964b919d6c728680d81af5fa70c8fb367d661cef54e8c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/npth/libnpth0_1.6-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libnsl-dev",
        downloaded_file_path = "libnsl-dev_1.3.0-2_amd64.deb",
        sha256 = "bb81a188c119cd7fdebae723cbc95887b6c549b2fe4fb7e268a9c8846444da99",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libn/libnsl/libnsl-dev_1.3.0-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpcre3",
        downloaded_file_path = "libpcre3_8.39-13_amd64.deb",
        sha256 = "48efcf2348967c211cd9408539edf7ec3fa9d800b33041f6511ccaecc1ffa9d0",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/pcre3/libpcre3_8.39-13_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libperl5.32",
        downloaded_file_path = "libperl5.32_5.32.1-4+deb11u2_amd64.deb",
        sha256 = "224cafe65968deb83168113b74dff2d2f13b115a41d99eb209ed3b8f981df0b3",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/perl/libperl5.32_5.32.1-4+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpng16-16",
        downloaded_file_path = "libpng16-16_1.6.37-3_amd64.deb",
        sha256 = "7d5336af395d1f658d0e66d74d0e1f4c632028750e7e04314d1a650e0317f3d6",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpsl5",
        downloaded_file_path = "libpsl5_0.21.0-1.2_amd64.deb",
        sha256 = "d716f5b4346ec85bb728f4530abeb1da4a79f696c72d7f774c59ba127c202fa7",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libp/libpsl/libpsl5_0.21.0-1.2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpython3-dev",
        downloaded_file_path = "libpython3-dev_3.9.2-3_amd64.deb",
        sha256 = "8e81c69eb7f17cd2fc7935d76e97882d1532ff8cdf45db731ee2c7f217155a37",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-defaults/libpython3-dev_3.9.2-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpython3-stdlib",
        downloaded_file_path = "libpython3-stdlib_3.9.2-3_amd64.deb",
        sha256 = "f903a5e24fd155cf09f25823a75c95a7de03a408ab699fe05c2c2930cbe018e3",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-defaults/libpython3-stdlib_3.9.2-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpython3.9",
        downloaded_file_path = "libpython3.9_3.9.2-1_amd64.deb",
        sha256 = "97647869e7e9db643a7eeab949b7d140f9a175814fcc94289be70d426aa5fd1a",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/libpython3.9_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpython3.9-dev",
        downloaded_file_path = "libpython3.9-dev_3.9.2-1_amd64.deb",
        sha256 = "3a2172f6d926cf2e98a1a2e24f5aecdc3bcd56fa7c6d9f7a3fc4892f67377d5f",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/libpython3.9-dev_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpython3.9-minimal",
        downloaded_file_path = "libpython3.9-minimal_3.9.2-1_amd64.deb",
        sha256 = "594283526d67e03e3c4e96534f6bfe5da1bf41da5d49360553c9b79fbf08c4ab",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/libpython3.9-minimal_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpython3.9-stdlib",
        downloaded_file_path = "libpython3.9-stdlib_3.9.2-1_amd64.deb",
        sha256 = "32ac64d959ac2dbc5bb289532fc9834dab8f671b5455695a3a9315aad973c65b",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/libpython3.9-stdlib_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libreadline8",
        downloaded_file_path = "libreadline8_8.1-1_amd64.deb",
        sha256 = "162ba9fdcde81b5502953ed4d84b24e8ad4e380bbd02990ab1a0e3edffca3c22",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/r/readline/libreadline8_8.1-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_librtmp1",
        downloaded_file_path = "librtmp1_2.4+20151223.gitfa8646d.1-2+b2_amd64.deb",
        sha256 = "e1f69020dc2c466e421ec6a58406b643be8b5c382abf0f8989011c1d3df91c87",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/r/rtmpdump/librtmp1_2.4+20151223.gitfa8646d.1-2+b2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libsasl2-2",
        downloaded_file_path = "libsasl2-2_2.1.27+dfsg-2.1+deb11u1_amd64.deb",
        sha256 = "2e86ab7a3329aad4b7350a9b067fe8f80b680302f2f82d94f73f9bf075404460",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/c/cyrus-sasl2/libsasl2-2_2.1.27+dfsg-2.1+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libsasl2-modules",
        downloaded_file_path = "libsasl2-modules_2.1.27+dfsg-2.1+deb11u1_amd64.deb",
        sha256 = "a4759df79c9e7e7cd9555112e3396b5c5d9198e6b8b6622bfd70672291370f46",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/c/cyrus-sasl2/libsasl2-modules_2.1.27+dfsg-2.1+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libsasl2-modules-db",
        downloaded_file_path = "libsasl2-modules-db_2.1.27+dfsg-2.1+deb11u1_amd64.deb",
        sha256 = "122bf3de4ca0ec873bc35bdde1f21ec9d91ace4f5245c3b1240e077f866e1ae9",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/c/cyrus-sasl2/libsasl2-modules-db_2.1.27+dfsg-2.1+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libsqlite3-0",
        downloaded_file_path = "libsqlite3-0_3.34.1-3_amd64.deb",
        sha256 = "a0b8d3acf4a0483048637637d269be93af48d5c16f6f139f53edd13384ad4686",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/s/sqlite3/libsqlite3-0_3.34.1-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libssh2-1",
        downloaded_file_path = "libssh2-1_1.9.0-2_amd64.deb",
        sha256 = "f730fe45716a206003597819ececeeffe0fff754bdbbd0105425a177aa20a2de",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libs/libssh2/libssh2-1_1.9.0-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libstdcpp-10-dev",
        downloaded_file_path = "libstdc++-10-dev_10.2.1-6_amd64.deb",
        sha256 = "20b1f56863dcc5f187d6cb53b2aa6149bd013be4ec67e10c2c31a22fda619a01",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libstdc++-10-dev_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libtiff5",
        downloaded_file_path = "libtiff5_4.2.0-1+deb11u4_amd64.deb",
        sha256 = "950941f36bc2ae10f7a84a67e09dd852fba1815a1190442a30b7e185e31303a8",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/t/tiff/libtiff5_4.2.0-1+deb11u4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libtirpc-dev",
        downloaded_file_path = "libtirpc-dev_1.3.1-1+deb11u1_amd64.deb",
        sha256 = "6983131dbb8568e55d80ba68fe2dbf60ed60c5e7cf99421374d7055932eba411",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libt/libtirpc/libtirpc-dev_1.3.1-1+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libtsan0",
        downloaded_file_path = "libtsan0_10.2.1-6_amd64.deb",
        sha256 = "4ea9ce5df578309538e684fcbca0c4403c6d7ca01b3f44868829e98a55548e2a",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libtsan0_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libubsan1",
        downloaded_file_path = "libubsan1_10.2.1-6_amd64.deb",
        sha256 = "9435da9b51aba0f9b128ccf3e80cc1e8233aa6b816d7bddd5688ca6c4afb6e4d",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libubsan1_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libwebp6",
        downloaded_file_path = "libwebp6_0.6.1-2.1+deb11u1_amd64.deb",
        sha256 = "37e6d4ae1401f99cbc94082e341f8d4ac481e9c0c6bf02205f279782fe57bfd0",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230602T162438Z/pool/updates/main/libw/libwebp/libwebp6_0.6.1-2.1+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libx11-6",
        downloaded_file_path = "libx11-6_1.7.2-1_amd64.deb",
        sha256 = "086bd667fc07369472a923da015d182bb0c15a72228a5c0e6ddbcbeaab70acd2",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libx11/libx11-6_1.7.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libx11-data",
        downloaded_file_path = "libx11-data_1.7.2-1_all.deb",
        sha256 = "049b7eabced516acfdf44a5e81c26d108b16e4987e5d7604ea53eaade74027fb",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libx11/libx11-data_1.7.2-1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_libxau6",
        downloaded_file_path = "libxau6_1.0.9-1_amd64.deb",
        sha256 = "679db1c4579ec7c61079adeaae8528adeb2e4bf5465baa6c56233b995d714750",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxau/libxau6_1.0.9-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libxcb1",
        downloaded_file_path = "libxcb1_1.14-3_amd64.deb",
        sha256 = "d5e0f047ed766f45eb7473947b70f9e8fddbe45ef22ecfd92ab712c0671a93ac",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxcb/libxcb1_1.14-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libxdmcp6",
        downloaded_file_path = "libxdmcp6_1.1.2-3_amd64.deb",
        sha256 = "ecb8536f5fb34543b55bb9dc5f5b14c9dbb4150a7bddb3f2287b7cab6e9d25ef",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxdmcp/libxdmcp6_1.1.2-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libxext6",
        downloaded_file_path = "libxext6_1.3.3-1.1_amd64.deb",
        sha256 = "dc1ff8a2b60c7dd3c8917ffb9aa65ee6cda52648d9150608683c47319d1c0c8c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxext/libxext6_1.3.3-1.1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libxmuu1",
        downloaded_file_path = "libxmuu1_1.1.2-2+b3_amd64.deb",
        sha256 = "329d2974829d0dd61ea5d59676ae6db10e49f97588ddff74042edd0a60b3bcd2",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxmu/libxmuu1_1.1.2-2+b3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libxpm4",
        downloaded_file_path = "libxpm4_3.5.12-1.1~deb11u1_amd64.deb",
        sha256 = "3575516b9ac7b523b5eb22a36820464df5c71dda97be2cab9eb723fa5abbaacc",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxpm/libxpm4_3.5.12-1.1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_linux-libc-dev",
        downloaded_file_path = "linux-libc-dev_5.10.179-1_amd64.deb",
        sha256 = "a8815b155f5c07e1ec8dfcfce4eacf31df00d188a33cd349ac72624bf3d2ffd8",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230602T162438Z/pool/updates/main/l/linux/linux-libc-dev_5.10.179-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_make",
        downloaded_file_path = "make_4.3-4.1_amd64.deb",
        sha256 = "a1a83af8cbd854af887b72ad196b1f4af58387815e21ced1000253a116a46e2a",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/make-dfsg/make_4.3-4.1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_manpages",
        downloaded_file_path = "manpages_5.10-1_all.deb",
        sha256 = "546631cad44a4e3b02b3416db43d8c52cbbecc673f1f69bf37b9c3865d56ab5a",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/manpages/manpages_5.10-1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_manpages-dev",
        downloaded_file_path = "manpages-dev_5.10-1_all.deb",
        sha256 = "84a62717c2300ce6856bcc7404a6a0719d564ea648c6d4000031e7e9d502ce85",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/manpages/manpages-dev_5.10-1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_media-types",
        downloaded_file_path = "media-types_4.0.0_all.deb",
        sha256 = "f9835dcf3cdbaf163104d4e511c9c4e0f41a56822e147e57f28f749fcbf7d44c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/media-types/media-types_4.0.0_all.deb"],
    )
    http_file(
        name = "amd64_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "amd64_debian11_openssh-client",
        downloaded_file_path = "openssh-client_8.4p1-5+deb11u1_amd64.deb",
        sha256 = "5b908fa946a425c6f2b4e4b234f4e42ae61c35c6655dc06b9746145e09b6cb2f",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/o/openssh/openssh-client_8.4p1-5+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u5_amd64.deb",
        sha256 = "9756f315ef74ccaa1b741b5359c886b10fdb531ea6bfba0f9b4ae9e635c8af86",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230602T162438Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb11u5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_patch",
        downloaded_file_path = "patch_2.7.6-7_amd64.deb",
        sha256 = "8c6d49b771530dbe26d7bd060582dc7d2b4eeb603a20789debc1ef4bbbc4ef67",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/patch/patch_2.7.6-7_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_perl",
        downloaded_file_path = "perl_5.32.1-4+deb11u2_amd64.deb",
        sha256 = "1cebc4516ed7c240b812c7bdd7e6ea0810f513152717ca17ce139ee0dfbc7b0d",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/perl/perl_5.32.1-4+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_perl-modules-5.32",
        downloaded_file_path = "perl-modules-5.32_5.32.1-4+deb11u2_all.deb",
        sha256 = "6fa15be322c3c89ec4a07d704ad58d4a2d1aabf866135a859f6d8d58c59e9df4",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/perl/perl-modules-5.32_5.32.1-4+deb11u2_all.deb"],
    )
    http_file(
        name = "amd64_debian11_pinentry-curses",
        downloaded_file_path = "pinentry-curses_1.1.0-4_amd64.deb",
        sha256 = "8915e5f5675c36b2d858cca0db8feea677a576cb8bcae58208ce3162942f587e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/pinentry/pinentry-curses_1.1.0-4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_publicsuffix",
        downloaded_file_path = "publicsuffix_20220811.1734-0+deb11u1_all.deb",
        sha256 = "bcd944b23ddfa74a11075848e13ba74453056456f58e9a125a1ecfbe22649410",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/publicsuffix/publicsuffix_20220811.1734-0+deb11u1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_python3",
        downloaded_file_path = "python3_3.9.2-3_amd64.deb",
        sha256 = "6d9375916c5c0d670df708bed3e8c033ce4b197a580d536ce39d1170c67a4c95",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-defaults/python3_3.9.2-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_python3-dev",
        downloaded_file_path = "python3-dev_3.9.2-3_amd64.deb",
        sha256 = "d378f376dd8443b35198326cc875fa93d541b61ef4ae29354c65ac6fe05da485",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-defaults/python3-dev_3.9.2-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_python3-distutils",
        downloaded_file_path = "python3-distutils_3.9.2-1_all.deb",
        sha256 = "05ec4080e0f05ba6b1c339d89c97f6343919be450b66cf4cfb215f54dcb85e58",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.9.2-1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_python3-lib2to3",
        downloaded_file_path = "python3-lib2to3_3.9.2-1_all.deb",
        sha256 = "802c198e5dd0b5af85a6937e426a85d616680785e8d18148fac451281a83a9a9",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-stdlib-extensions/python3-lib2to3_3.9.2-1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_python3-minimal",
        downloaded_file_path = "python3-minimal_3.9.2-3_amd64.deb",
        sha256 = "159320ef8a2d740dcc2245c7f0ac0e678b2796354044c90760fe2a4c6ef117b4",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-defaults/python3-minimal_3.9.2-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_python3.9",
        downloaded_file_path = "python3.9_3.9.2-1_amd64.deb",
        sha256 = "12f8b47632cc26b986bfc4c882fc98e7036d406143ae8bb1dbfff6b61d7c8993",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/python3.9_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_python3.9-dev",
        downloaded_file_path = "python3.9-dev_3.9.2-1_amd64.deb",
        sha256 = "7e93f240abe1c78c10d69ccec41ec5769763d99cebfd4e91407348520b18d908",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/python3.9-dev_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_python3.9-minimal",
        downloaded_file_path = "python3.9-minimal_3.9.2-1_amd64.deb",
        sha256 = "5d6003c5c20223a2547ac4976e09a9ec778dbe351507a6292bef3b60df5f4aa7",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/python3.9-minimal_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_readline-common",
        downloaded_file_path = "readline-common_8.1-1_all.deb",
        sha256 = "3f947176ef949f93e4ad5d76c067d33fa97cf90b62ee0748acb4f5f64790edc8",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/r/readline/readline-common_8.1-1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_sensible-utils",
        downloaded_file_path = "sensible-utils_0.0.14_all.deb",
        sha256 = "b9a447dc4ec8714196b037e20a2209e62cd669f5450222952f259bda4416b71f",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/s/sensible-utils/sensible-utils_0.0.14_all.deb"],
    )
    http_file(
        name = "amd64_debian11_ucf",
        downloaded_file_path = "ucf_3.0043_all.deb",
        sha256 = "ebef6bcd777b5c0cc2699926f2159db08433aed07c50cb321fd828b28c5e8d53",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/u/ucf/ucf_3.0043_all.deb"],
    )
    http_file(
        name = "amd64_debian11_xauth",
        downloaded_file_path = "xauth_1.1-1_amd64.deb",
        sha256 = "c332c14b2c705fef786070613616972ab066dfd5f95164d240439ec702fa1c16",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/x/xauth/xauth_1.1-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_xz-utils",
        downloaded_file_path = "xz-utils_5.2.5-2.1~deb11u1_amd64.deb",
        sha256 = "f303178585349a056ae4d8e8bf46e492e7c83502653548170e9a95b5408de40f",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/x/xz-utils/xz-utils_5.2.5-2.1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_zlib1g-dev",
        downloaded_file_path = "zlib1g-dev_1.2.11.dfsg-2+deb11u2_amd64.deb",
        sha256 = "f49fc849870c4e64fed2794722841ee950c1788f7fe90b3a091e6a098a46cd33",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/z/zlib/zlib1g-dev_1.2.11.dfsg-2+deb11u2_amd64.deb"],
    )
    http_file(
        name = "arm64_debian11_binutils",
        downloaded_file_path = "binutils_2.35.2-2_arm64.deb",
        sha256 = "0ba499b4ca7fbdcce3fcfce7a5c1fdbd1f7b7b691cf70cfed85e584a9af6ade1",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/binutils_2.35.2-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_binutils-aarch64-linux-gnu",
        downloaded_file_path = "binutils-aarch64-linux-gnu_2.35.2-2_arm64.deb",
        sha256 = "53e2714179d1334b66e3e6b046fb035c0f24d9e276e5606493ac26e5a4a84446",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/binutils-aarch64-linux-gnu_2.35.2-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_binutils-common",
        downloaded_file_path = "binutils-common_2.35.2-2_arm64.deb",
        sha256 = "89986c385cd6c0d3adc34d2a03e6c215369222413f556c2dca3a423d8027be8e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/binutils-common_2.35.2-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_build-essential",
        downloaded_file_path = "build-essential_12.9_arm64.deb",
        sha256 = "cb14b62d98e911ae8cb32248f9f46de50cc09d46ec9dcb3b9bfda1ff2e0abf49",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/build-essential/build-essential_12.9_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_bzip2",
        downloaded_file_path = "bzip2_1.0.8-4_arm64.deb",
        sha256 = "672b708d9be7dd8727550e4829d5020d476c18a8328eaa256217e7c20af5e5f0",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/bzip2/bzip2_1.0.8-4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "arm64_debian11_cpp",
        downloaded_file_path = "cpp_10.2.1-1_arm64.deb",
        sha256 = "4cacdf964d30a2724521a410108cafa6d21c28f934a3c4b3969d88db6086bcb9",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-defaults/cpp_10.2.1-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_cpp-10",
        downloaded_file_path = "cpp-10_10.2.1-6_arm64.deb",
        sha256 = "0a169c9df87dfc57b5a794a2a3eabc34234360231c0677157c4da74fba15e3b1",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/cpp-10_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_dash",
        downloaded_file_path = "dash_0.5.11+git20200708+dd9ef66-5_arm64.deb",
        sha256 = "542980a48d96c1124a9664cae06dbb8b813417daa1de1b6ed4cb49e0766da932",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/d/dash/dash_0.5.11+git20200708+dd9ef66-5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_dirmngr",
        downloaded_file_path = "dirmngr_2.2.27-2+deb11u2_arm64.deb",
        sha256 = "56572191255d48b541b13c2a9845755d22e52bfbe356919a91c722c5c1bbd60c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/dirmngr_2.2.27-2+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_dpkg-dev",
        downloaded_file_path = "dpkg-dev_1.20.12_all.deb",
        sha256 = "1503f654ac1be961541cff5b6c4dcfbbd13c6da448ed2e9d91c6723cae779485",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/d/dpkg/dpkg-dev_1.20.12_all.deb"],
    )
    http_file(
        name = "arm64_debian11_fakeroot",
        downloaded_file_path = "fakeroot_1.25.3-1.1_arm64.deb",
        sha256 = "080de675890923093165d78ed62512c5f1dafc52867c9241b3c7e32d20325c21",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/fakeroot/fakeroot_1.25.3-1.1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_fontconfig-config",
        downloaded_file_path = "fontconfig-config_2.13.1-4.2_all.deb",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    http_file(
        name = "arm64_debian11_fonts-dejavu-core",
        downloaded_file_path = "fonts-dejavu-core_2.37-2_all.deb",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    http_file(
        name = "arm64_debian11_gpp",
        downloaded_file_path = "g++_10.2.1-1_arm64.deb",
        sha256 = "747e9de43d2bdf99a9d8e0d757e73d9a9c421b8e8244c322a4b97de37cb32dde",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-defaults/g++_10.2.1-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_gpp-10",
        downloaded_file_path = "g++-10_10.2.1-6_arm64.deb",
        sha256 = "6525b7dac398b9597ddafac919f0cd3879448301336f3be341992b48de640669",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/g++-10_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_gcc",
        downloaded_file_path = "gcc_10.2.1-1_arm64.deb",
        sha256 = "02e5b8d60a8e187615a81f844c59ea2e7ebd44e46ad0756363ad34809175225a",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-defaults/gcc_10.2.1-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_gcc-10",
        downloaded_file_path = "gcc-10_10.2.1-6_arm64.deb",
        sha256 = "fbbb8fa62df2f2b2224e1337c8ba434b71d49f58ad09d479fd044c6ab06ad6e9",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/gcc-10_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_git",
        downloaded_file_path = "git_2.30.2-1+deb11u2_arm64.deb",
        sha256 = "714c12e86a2538ad64e6571555cb11b0f2ba065f4db5a8265149fe39a9520f6e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/git/git_2.30.2-1+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_git-man",
        downloaded_file_path = "git-man_2.30.2-1+deb11u2_all.deb",
        sha256 = "d77d7d288ad70c87cf52128036c0ab1ead4bee1793c24ab1bc626d9385baffea",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/git/git-man_2.30.2-1+deb11u2_all.deb"],
    )
    http_file(
        name = "arm64_debian11_gnupg",
        downloaded_file_path = "gnupg_2.2.27-2+deb11u2_all.deb",
        sha256 = "a89ecdc6fc8e39f74a27b9b9823fc2fb22103b5965212d54eea86f9f16769042",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gnupg_2.2.27-2+deb11u2_all.deb"],
    )
    http_file(
        name = "arm64_debian11_gnupg-l10n",
        downloaded_file_path = "gnupg-l10n_2.2.27-2+deb11u2_all.deb",
        sha256 = "8000012a7532112a4167200b968170a1bb354591b98ff237e5185804372565df",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gnupg-l10n_2.2.27-2+deb11u2_all.deb"],
    )
    http_file(
        name = "arm64_debian11_gnupg-utils",
        downloaded_file_path = "gnupg-utils_2.2.27-2+deb11u2_arm64.deb",
        sha256 = "4af305476715624d0a418948d7c0b59591f2913d440628939537ac70403a6b60",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gnupg-utils_2.2.27-2+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_gpg",
        downloaded_file_path = "gpg_2.2.27-2+deb11u2_arm64.deb",
        sha256 = "7056c4f34d78be6362aa0b5e571ede3ac49ad31e0672a7be189767d03d274b07",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpg_2.2.27-2+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_gpg-agent",
        downloaded_file_path = "gpg-agent_2.2.27-2+deb11u2_arm64.deb",
        sha256 = "0d6d35b246f85738153c4ba1c417235dbde9ec2d1f8e573a8d67d930d4255431",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpg-agent_2.2.27-2+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_gpg-wks-client",
        downloaded_file_path = "gpg-wks-client_2.2.27-2+deb11u2_arm64.deb",
        sha256 = "baf4644c4cbd2f2a7c4b55ecfb7358369f89f35dde43d8cf5273b717f3a26d03",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpg-wks-client_2.2.27-2+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_gpg-wks-server",
        downloaded_file_path = "gpg-wks-server_2.2.27-2+deb11u2_arm64.deb",
        sha256 = "807422927692937de34e914ca11cba2b3c36c7f257d8aac96ab6543d2d8c002a",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpg-wks-server_2.2.27-2+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_gpgconf",
        downloaded_file_path = "gpgconf_2.2.27-2+deb11u2_arm64.deb",
        sha256 = "60baf2a56212493596fd194b7db257559ad75c79301e33c38fe0d5b2526555d4",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpgconf_2.2.27-2+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_gpgsm",
        downloaded_file_path = "gpgsm_2.2.27-2+deb11u2_arm64.deb",
        sha256 = "1a20aedb0539e1d2cc753c941bf8f33630036045bb6ed3e0cde4428670094fab",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnupg2/gpgsm_2.2.27-2+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_javascript-common",
        downloaded_file_path = "javascript-common_11+nmu1_all.deb",
        sha256 = "e144ab36fedb6f9ae02b1030b49258f99126f5ebbecd49957f84a42436bbcbfd",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/j/javascript-common/javascript-common_11+nmu1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_less",
        downloaded_file_path = "less_551-2_arm64.deb",
        sha256 = "7816e3ffd99dc880cab60e3aeae3fd0f7d6f4064937abe4a4ffda282cb5ed7e4",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/l/less/less_551-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libalgorithm-diff-perl",
        downloaded_file_path = "libalgorithm-diff-perl_1.201-1_all.deb",
        sha256 = "3a8b61891f0ce9bd310088ce2d269d63b5afd88b9196fa4f046fd890faea4a17",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/liba/libalgorithm-diff-perl/libalgorithm-diff-perl_1.201-1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_libalgorithm-diff-xs-perl",
        downloaded_file_path = "libalgorithm-diff-xs-perl_0.04-6+b1_arm64.deb",
        sha256 = "0b1c053db26728adeba13964aca3f0bdf532df5ac58f4e7b4d25694c0b80f265",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/liba/libalgorithm-diff-xs-perl/libalgorithm-diff-xs-perl_0.04-6+b1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libalgorithm-merge-perl",
        downloaded_file_path = "libalgorithm-merge-perl_0.08-3_all.deb",
        sha256 = "8743b526038e61a684b8327435c462288395d5b4f6b5b102d6ad11cbfccb52c7",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/liba/libalgorithm-merge-perl/libalgorithm-merge-perl_0.08-3_all.deb"],
    )
    http_file(
        name = "arm64_debian11_libasan6",
        downloaded_file_path = "libasan6_10.2.1-6_arm64.deb",
        sha256 = "a31acf1c1087caf54e3296c5aead6ec0a19141cb14319fa358b35fd305db1d5e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libasan6_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libassuan0",
        downloaded_file_path = "libassuan0_2.5.3-7.1_arm64.deb",
        sha256 = "82ba862a80437eb5297bf2b28952822255f7f3dc9c44e25a2e0e6b4d4c922503",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/liba/libassuan/libassuan0_2.5.3-7.1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libatomic1",
        downloaded_file_path = "libatomic1_10.2.1-6_arm64.deb",
        sha256 = "d0b8a02896479a6eac49019d71142da9561482759f40eb7aeb15cfdc7d3e39ec",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libatomic1_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libbinutils",
        downloaded_file_path = "libbinutils_2.35.2-2_arm64.deb",
        sha256 = "7305a9bb576a975ec0fdc69688dec98a3c102c2026d5ad18bb014e93f1b076aa",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/libbinutils_2.35.2-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libbrotli1",
        downloaded_file_path = "libbrotli1_1.0.9-2+b2_arm64.deb",
        sha256 = "52ca7f90de6cb6576a0a5cf5712fc4ae7344b79c44b8a1548087fd5d92bf1f64",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libbsd0",
        downloaded_file_path = "libbsd0_0.11.3-1_arm64.deb",
        sha256 = "b6e7fa54a05e5a3a5e1ec5dceb57a470e9a0883081594aea643ca58264071e7a",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libb/libbsd/libbsd0_0.11.3-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libc-dev-bin",
        downloaded_file_path = "libc-dev-bin_2.31-13+deb11u6_arm64.deb",
        sha256 = "e88b22047f590f4c36fe1eb9dd1ae0bcf80d2a645cc8eca21d94a9806c979154",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/glibc/libc-dev-bin_2.31-13+deb11u6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libc-devtools",
        downloaded_file_path = "libc-devtools_2.31-13+deb11u6_arm64.deb",
        sha256 = "508c6a5af4a0f037ded94a58d926336ffc8927f896fe4ab96f4bb9eb57c0d056",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/glibc/libc-devtools_2.31-13+deb11u6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libc6-dev",
        downloaded_file_path = "libc6-dev_2.31-13+deb11u6_arm64.deb",
        sha256 = "f3cac9211ca1c6fbdcc4882abb3700b2f0abd3a0b030a3765b17f711f5936c86",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/glibc/libc6-dev_2.31-13+deb11u6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libcbor0",
        downloaded_file_path = "libcbor0_0.5.0+dfsg-2_arm64.deb",
        sha256 = "5fd0e1715af5b0647c80c479608e476b0978ed6b87ca66a61a1fe9e726c64bb5",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libc/libcbor/libcbor0_0.5.0+dfsg-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libcc1-0",
        downloaded_file_path = "libcc1-0_10.2.1-6_arm64.deb",
        sha256 = "2178422a44fac1858293358bdd2cd748c48f4c844049ed043385a8d76de6a58a",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libcc1-0_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libcrypt-dev",
        downloaded_file_path = "libcrypt-dev_4.4.18-4_arm64.deb",
        sha256 = "5309fdf445acc72794b9d134e9625746ffad2b865c6432abcd08ef097587bde1",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxcrypt/libcrypt-dev_4.4.18-4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libctf-nobfd0",
        downloaded_file_path = "libctf-nobfd0_2.35.2-2_arm64.deb",
        sha256 = "c5e96863d481de39e224fa9269e2e5716faf9e583f8fa93723dabd55b028b319",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/libctf-nobfd0_2.35.2-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libctf0",
        downloaded_file_path = "libctf0_2.35.2-2_arm64.deb",
        sha256 = "9f0b5320bde7069030d9dcded5cdc395c77fd2b8478cf8ccfcaf2d1bbe145105",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/b/binutils/libctf0_2.35.2-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libcurl3-gnutls",
        downloaded_file_path = "libcurl3-gnutls_7.74.0-1.3+deb11u7_arm64.deb",
        sha256 = "70f488ceac3d541c6ccedb57f3806221d2cd593a2fbd4ffd8ceb56a8588accbd",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/c/curl/libcurl3-gnutls_7.74.0-1.3+deb11u7_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libdeflate0",
        downloaded_file_path = "libdeflate0_1.7-1_arm64.deb",
        sha256 = "a1adc22600ea5e44e8ea715972ac2af7994cc7ff4d94bba8e8b01abb9ddbdfd0",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libd/libdeflate/libdeflate0_1.7-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libdpkg-perl",
        downloaded_file_path = "libdpkg-perl_1.20.12_all.deb",
        sha256 = "62b6da489682a684c8224a2cca0fc83d239846696cca5f67d5699c1df14b56ea",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/d/dpkg/libdpkg-perl_1.20.12_all.deb"],
    )
    http_file(
        name = "arm64_debian11_libedit2",
        downloaded_file_path = "libedit2_3.1-20191231-2+b1_arm64.deb",
        sha256 = "43cbfd69ef591a66cfd06aedf930e3fc3c370b3a7ad514a33399d0e1a4d7343e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libe/libedit/libedit2_3.1-20191231-2+b1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_liberror-perl",
        downloaded_file_path = "liberror-perl_0.17029-1_all.deb",
        sha256 = "594083f3588e82b725f2b0532c0fc85f7c9e306fcac26ba4401572d214d90c72",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libe/liberror-perl/liberror-perl_0.17029-1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_libexpat1",
        downloaded_file_path = "libexpat1_2.2.10-2+deb11u5_arm64.deb",
        sha256 = "8d20bfd061845bda0321d01accd6f8386ead5b1d7250a585d12b8d5fb1408ffa",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libexpat1-dev",
        downloaded_file_path = "libexpat1-dev_2.2.10-2+deb11u5_arm64.deb",
        sha256 = "627bf8e4813e7cc009ab935dd81372237bb4a98824f0da5d3e9ef6a70ff8d228",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/e/expat/libexpat1-dev_2.2.10-2+deb11u5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libfakeroot",
        downloaded_file_path = "libfakeroot_1.25.3-1.1_arm64.deb",
        sha256 = "fb6c9ebc9b9e33c8c68ac496764a4345859f758dd04c7afb22463b5d31962c68",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/fakeroot/libfakeroot_1.25.3-1.1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libfido2-1",
        downloaded_file_path = "libfido2-1_1.6.0-2_arm64.deb",
        sha256 = "94dfd7a891e26f82dd43d522ead7d00a583b31d88883fbec526caa480b144f40",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libf/libfido2/libfido2-1_1.6.0-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libfile-fcntllock-perl",
        downloaded_file_path = "libfile-fcntllock-perl_0.22-3+b7_arm64.deb",
        sha256 = "77f828474a3f65da4c27b60a8cbf859b7959fad3bcb2a3bd46cc3a614660e3b4",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libf/libfile-fcntllock-perl/libfile-fcntllock-perl_0.22-3+b7_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libfontconfig1",
        downloaded_file_path = "libfontconfig1_2.13.1-4.2_arm64.deb",
        sha256 = "18b13ef8a46e9d79ba6a6ba2db0c86e42583277b5d47f6942f3223e349c22641",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libfreetype6",
        downloaded_file_path = "libfreetype6_2.10.4+dfsg-1+deb11u1_arm64.deb",
        sha256 = "b25f1c148498dd2b49dc30da0a2b2537a7bd0cb34afb8ea681dd145053c9a3f8",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgcc-10-dev",
        downloaded_file_path = "libgcc-10-dev_10.2.1-6_arm64.deb",
        sha256 = "80fc73d339ada2e194175afe83cd89014565242153b6e3c2128849d8817da367",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libgcc-10-dev_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgd3",
        downloaded_file_path = "libgd3_2.3.0-2_arm64.deb",
        sha256 = "1e6d6af0c90fe62193b3e51e45f69d075b86d7bde3fb4fd30b60da763aeca43f",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libg/libgd2/libgd3_2.3.0-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgdbm-compat4",
        downloaded_file_path = "libgdbm-compat4_1.19-2_arm64.deb",
        sha256 = "0853cc0b0f92784b7fbd193d737c63b1d95f932e2b95dc1bb10c273e01a0f754",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gdbm/libgdbm-compat4_1.19-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgdbm6",
        downloaded_file_path = "libgdbm6_1.19-2_arm64.deb",
        sha256 = "97a88c2698bd836d04e51ad70c76826850857869b51e90b5343621ba30bbf525",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gdbm/libgdbm6_1.19-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_arm64.deb",
        sha256 = "813af2e0b8ba0a7cea18c988cd843412ef6d0415700fc860d62816750e741670",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgpm2",
        downloaded_file_path = "libgpm2_1.20.7-8_arm64.deb",
        sha256 = "367a548386f1297c937af6ed548bdcaa4db25f11c1a7495c45978826da61deb8",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gpm/libgpm2_1.20.7-8_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libisl23",
        downloaded_file_path = "libisl23_0.23-1_arm64.deb",
        sha256 = "23a7093e1b950f84faf56d35cba03f981d63e0199f5747df2706ef0401792804",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/i/isl/libisl23_0.23-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libitm1",
        downloaded_file_path = "libitm1_10.2.1-6_arm64.deb",
        sha256 = "e77553b598b09a06b74c7603107cbac2d8dae6ae750cf6728035ead945003c60",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libitm1_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libjbig0",
        downloaded_file_path = "libjbig0_2.1-3.1+b2_arm64.deb",
        sha256 = "b71b3e62e162f64cb24466bf7c6e40b05ce2a67ca7fed26d267d498f2896d549",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/j/jbigkit/libjbig0_2.1-3.1+b2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libjpeg62-turbo",
        downloaded_file_path = "libjpeg62-turbo_2.0.6-4_arm64.deb",
        sha256 = "8903394de23dc6ead5abfc80972c8fd44300c9903ad4589d0df926e71977d881",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libjs-jquery",
        downloaded_file_path = "libjs-jquery_3.5.1+dfsg+~3.5.5-7_all.deb",
        sha256 = "b57b83ab5a3b1f055860bdf86f9316124f1da3c75fbba5dabbcb3cd3707c95ed",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/node-jquery/libjs-jquery_3.5.1+dfsg+~3.5.5-7_all.deb"],
    )
    http_file(
        name = "arm64_debian11_libjs-sphinxdoc",
        downloaded_file_path = "libjs-sphinxdoc_3.4.3-2_all.deb",
        sha256 = "f789debe1bc0164064d502d0230c98f9c5857331e43e02e9487fc42c4068bea9",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/s/sphinx/libjs-sphinxdoc_3.4.3-2_all.deb"],
    )
    http_file(
        name = "arm64_debian11_libjs-underscore",
        downloaded_file_path = "libjs-underscore_1.9.1~dfsg-3_all.deb",
        sha256 = "85fb8fd215bc742f1a17285b3bf38a2a0d0aa5b2c2188f8d7dec2323d2ab945d",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/u/underscore/libjs-underscore_1.9.1~dfsg-3_all.deb"],
    )
    http_file(
        name = "arm64_debian11_libksba8",
        downloaded_file_path = "libksba8_1.5.0-3+deb11u2_arm64.deb",
        sha256 = "8602e8e8e0be88e5ffd5e911dacdfd08e2b0f2dab753da96e6fe6ae0e09cfe33",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libk/libksba/libksba8_1.5.0-3+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libldap-2.4-2",
        downloaded_file_path = "libldap-2.4-2_2.4.57+dfsg-3+deb11u1_arm64.deb",
        sha256 = "4803bddc9ff915cd91d0cc4ec22c6ab5e07b213e6a44118025fdab8bfa6d20ba",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/o/openldap/libldap-2.4-2_2.4.57+dfsg-3+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libldap-common",
        downloaded_file_path = "libldap-common_2.4.57+dfsg-3+deb11u1_all.deb",
        sha256 = "ffa2e83a690a551c0d3b77c29f606758df177b056abe4514f6e8286dc344ea5c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/o/openldap/libldap-common_2.4.57+dfsg-3+deb11u1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_liblocale-gettext-perl",
        downloaded_file_path = "liblocale-gettext-perl_1.07-4+b1_arm64.deb",
        sha256 = "435a5b66fda1c04aa633947848c9bff9616f5c4b8c80b10ebd783be53b8a780b",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libl/liblocale-gettext-perl/liblocale-gettext-perl_1.07-4+b1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_liblsan0",
        downloaded_file_path = "liblsan0_10.2.1-6_arm64.deb",
        sha256 = "ef39e7a56aa2b6cbe47c926bba195f01755fda0bb0733717d7c803609b8c18e1",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/liblsan0_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libmd0",
        downloaded_file_path = "libmd0_1.0.3-3_arm64.deb",
        sha256 = "3c490cdcce9d25e702e6587b6166cd8e7303fce8343642d9d5d99695282a9e5c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libm/libmd/libmd0_1.0.3-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libmpc3",
        downloaded_file_path = "libmpc3_1.2.0-1_arm64.deb",
        sha256 = "a138ffba2e730fc8bf50004791f411f7850159a6d916a704b3f062770f7bc375",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/mpclib3/libmpc3_1.2.0-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libmpdec3",
        downloaded_file_path = "libmpdec3_2.5.1-1_arm64.deb",
        sha256 = "171e2581970f36a39f65d1ca3c761e76b103844daae7903fcc07f7c3822a05bb",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/mpdecimal/libmpdec3_2.5.1-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libmpfr6",
        downloaded_file_path = "libmpfr6_4.1.0-3_arm64.deb",
        sha256 = "bfcc2e0c8863730cb8a98bfebce01c123370e4efa3b0d52cb8cf817ef6a06d88",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/mpfr4/libmpfr6_4.1.0-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libncursesw6",
        downloaded_file_path = "libncursesw6_6.2+20201114-2+deb11u1_arm64.deb",
        sha256 = "0b7192ce69cf53288b90ece6cfb2745780f5bf72536b882ca372a2b0d8916f05",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/ncurses/libncursesw6_6.2+20201114-2+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libnghttp2-14",
        downloaded_file_path = "libnghttp2-14_1.43.0-1_arm64.deb",
        sha256 = "317b58d2654d5875eee1dbf147ea810b8e3eb007f3bf4e2dcbca8ed76e425763",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/nghttp2/libnghttp2-14_1.43.0-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libnpth0",
        downloaded_file_path = "libnpth0_1.6-3_arm64.deb",
        sha256 = "5499a10044afad14685bbfc4026ac62630562da08d5b9a15a546c6b62bd6ea89",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/npth/libnpth0_1.6-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libnsl-dev",
        downloaded_file_path = "libnsl-dev_1.3.0-2_arm64.deb",
        sha256 = "baf8a2ef1e9faec26dd84e62d0e8b653f54d2211a7a89c1b67965aee8a3da790",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libn/libnsl/libnsl-dev_1.3.0-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpcre3",
        downloaded_file_path = "libpcre3_8.39-13_arm64.deb",
        sha256 = "21cac4064a41dbc354295c437f37bf623f9004513a97a6fa030248566aa986e9",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/pcre3/libpcre3_8.39-13_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libperl5.32",
        downloaded_file_path = "libperl5.32_5.32.1-4+deb11u2_arm64.deb",
        sha256 = "6be6a1856f5efb6d1c6e9273fa7beba7ab4c9eef1162658836d215684b302ed6",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/perl/libperl5.32_5.32.1-4+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpng16-16",
        downloaded_file_path = "libpng16-16_1.6.37-3_arm64.deb",
        sha256 = "f5f61274aa5f71b9e44b077bd7b9fa9cd5ff71d8b8295f47dc1b2d45378aa73e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpsl5",
        downloaded_file_path = "libpsl5_0.21.0-1.2_arm64.deb",
        sha256 = "12637647316e770c37a4bfec7aef27ed472f2850b5f59dd508505dda32519584",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libp/libpsl/libpsl5_0.21.0-1.2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpython3-dev",
        downloaded_file_path = "libpython3-dev_3.9.2-3_arm64.deb",
        sha256 = "c4fffcfe7b82b6f8363ecdb6144f1822eaf65e3285e1f335daf66c295eea133c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-defaults/libpython3-dev_3.9.2-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpython3-stdlib",
        downloaded_file_path = "libpython3-stdlib_3.9.2-3_arm64.deb",
        sha256 = "79ec02b6afc81938fd1418170c103cc90aabbc52e0e1738e2744c5a4ec69fde8",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-defaults/libpython3-stdlib_3.9.2-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpython3.9",
        downloaded_file_path = "libpython3.9_3.9.2-1_arm64.deb",
        sha256 = "c186a6d9829a5c0e95f3306e05b26824cbd540ff0aab7f4a591ab722af1da7ec",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/libpython3.9_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpython3.9-dev",
        downloaded_file_path = "libpython3.9-dev_3.9.2-1_arm64.deb",
        sha256 = "cb169cd7b36a3185294dcd4229fa358b39c7338c87ee74f5a3b5927d792bda1b",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/libpython3.9-dev_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpython3.9-minimal",
        downloaded_file_path = "libpython3.9-minimal_3.9.2-1_arm64.deb",
        sha256 = "b49736ab0e8b8577f97a474ca67e20c1c025f9d7394ec8d7820de6314c903cf9",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/libpython3.9-minimal_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpython3.9-stdlib",
        downloaded_file_path = "libpython3.9-stdlib_3.9.2-1_arm64.deb",
        sha256 = "3b3612dcd7550f01ec3517fbe955838223f4cf115b6983e4ed6d7320cd4b05c4",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/libpython3.9-stdlib_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libreadline8",
        downloaded_file_path = "libreadline8_8.1-1_arm64.deb",
        sha256 = "500c3cdc00dcaea2c4ed736e00bfcb6cb43c3415e808566c5dfa266dbfc0c5e5",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/r/readline/libreadline8_8.1-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_librtmp1",
        downloaded_file_path = "librtmp1_2.4+20151223.gitfa8646d.1-2+b2_arm64.deb",
        sha256 = "a3a1a6e4b02bcd3254e932b1972ed744082fd7dd5cc1545eec3dd3d539ce6c93",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/r/rtmpdump/librtmp1_2.4+20151223.gitfa8646d.1-2+b2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libsasl2-2",
        downloaded_file_path = "libsasl2-2_2.1.27+dfsg-2.1+deb11u1_arm64.deb",
        sha256 = "fc4c943224b8fb6aaa86439ff60dcec4ca1aeb4730f121e594c68a37b3e0c88f",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/c/cyrus-sasl2/libsasl2-2_2.1.27+dfsg-2.1+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libsasl2-modules",
        downloaded_file_path = "libsasl2-modules_2.1.27+dfsg-2.1+deb11u1_arm64.deb",
        sha256 = "4944d8251d69ee1e5b6512f2c2dba6c5f5473cdf04014bca1d89ef8ed747fb18",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/c/cyrus-sasl2/libsasl2-modules_2.1.27+dfsg-2.1+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libsasl2-modules-db",
        downloaded_file_path = "libsasl2-modules-db_2.1.27+dfsg-2.1+deb11u1_arm64.deb",
        sha256 = "006239b28681f507db0937125a13810c8cf03e3fffe9b7c8433445af86805d12",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/c/cyrus-sasl2/libsasl2-modules-db_2.1.27+dfsg-2.1+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libsqlite3-0",
        downloaded_file_path = "libsqlite3-0_3.34.1-3_arm64.deb",
        sha256 = "1e33cd39dc4fff2a7edd7bb7e90a71e20fb528f6a581fe0287652e4dae77e0d0",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/s/sqlite3/libsqlite3-0_3.34.1-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libssh2-1",
        downloaded_file_path = "libssh2-1_1.9.0-2_arm64.deb",
        sha256 = "c3847ce093a395c4425f23c0a1601516248e2d241bedaab94ecd9686536214a7",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libs/libssh2/libssh2-1_1.9.0-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libstdcpp-10-dev",
        downloaded_file_path = "libstdc++-10-dev_10.2.1-6_arm64.deb",
        sha256 = "cee7ca63613b50a8a51cc670db385c7e6d1181b72c94148fc8b7992e4570782d",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libstdc++-10-dev_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libtiff5",
        downloaded_file_path = "libtiff5_4.2.0-1+deb11u4_arm64.deb",
        sha256 = "23860eb1320131c2f7ad7e10298c9ebdc556d28ccd66198e84d9952935880835",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/t/tiff/libtiff5_4.2.0-1+deb11u4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libtirpc-dev",
        downloaded_file_path = "libtirpc-dev_1.3.1-1+deb11u1_arm64.deb",
        sha256 = "8b30e69481d15fc1a311db8fc2a32413466d64451ec1317f4753eb70f7cc15d6",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libt/libtirpc/libtirpc-dev_1.3.1-1+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libtsan0",
        downloaded_file_path = "libtsan0_10.2.1-6_arm64.deb",
        sha256 = "bb5ec0dfdcac7b2e93d161f7092a9a098d1001591cd016093e7f41fda6864b3c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libtsan0_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libubsan1",
        downloaded_file_path = "libubsan1_10.2.1-6_arm64.deb",
        sha256 = "14b4d134e2efc2d7afefce5affe89476117dd7a1894bdff158c7b5e0631052bc",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gcc-10/libubsan1_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libwebp6",
        downloaded_file_path = "libwebp6_0.6.1-2.1+deb11u1_arm64.deb",
        sha256 = "6cd7c2183a8547c376e317b584561dbfc55cd4e7d244ab7e41d7507723150f4b",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230602T162438Z/pool/updates/main/libw/libwebp/libwebp6_0.6.1-2.1+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libx11-6",
        downloaded_file_path = "libx11-6_1.7.2-1_arm64.deb",
        sha256 = "8872962f2a0a6b9e16cafc6acd2be56cee4ec7a16c2a0abdb9fcda6d0b31be3b",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libx11/libx11-6_1.7.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libx11-data",
        downloaded_file_path = "libx11-data_1.7.2-1_all.deb",
        sha256 = "049b7eabced516acfdf44a5e81c26d108b16e4987e5d7604ea53eaade74027fb",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libx11/libx11-data_1.7.2-1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_libxau6",
        downloaded_file_path = "libxau6_1.0.9-1_arm64.deb",
        sha256 = "36c2bf400641a80521093771dc2562c903df4065f9eb03add50d90564337ea6c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxau/libxau6_1.0.9-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libxcb1",
        downloaded_file_path = "libxcb1_1.14-3_arm64.deb",
        sha256 = "48f82b65c93adb7af7757961fdd2730928316459f008d767b7104a56bc20a8f1",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxcb/libxcb1_1.14-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libxdmcp6",
        downloaded_file_path = "libxdmcp6_1.1.2-3_arm64.deb",
        sha256 = "e92569ac33247261aa09adfadc34ced3994ac301cf8b58de415a2d5dbf15ccfc",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxdmcp/libxdmcp6_1.1.2-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libxext6",
        downloaded_file_path = "libxext6_1.3.3-1.1_arm64.deb",
        sha256 = "57237ecf54662372e206b154c0ab6096e05955e048552575b45d3ad14a6ff6e5",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxext/libxext6_1.3.3-1.1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libxmuu1",
        downloaded_file_path = "libxmuu1_1.1.2-2+b3_arm64.deb",
        sha256 = "77e33ef23360da6c7920b0cda2da016e71af187826f34e3b002c958d6758b5bf",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxmu/libxmuu1_1.1.2-2+b3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libxpm4",
        downloaded_file_path = "libxpm4_3.5.12-1.1~deb11u1_arm64.deb",
        sha256 = "88278fd09bd70731e95ed59d6522b60535bd7d367821841cc273703e186e62b1",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libx/libxpm/libxpm4_3.5.12-1.1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_linux-libc-dev",
        downloaded_file_path = "linux-libc-dev_5.10.179-1_arm64.deb",
        sha256 = "86816327d6c930ecf214b9a4ee56b15d28b330e250042f3545fa00862ba9f27f",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230602T162438Z/pool/updates/main/l/linux/linux-libc-dev_5.10.179-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_make",
        downloaded_file_path = "make_4.3-4.1_arm64.deb",
        sha256 = "7ef5f5c0e3f909c811f941598107119af0a0554641b5cc590f584cea6a55d204",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/make-dfsg/make_4.3-4.1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_manpages",
        downloaded_file_path = "manpages_5.10-1_all.deb",
        sha256 = "546631cad44a4e3b02b3416db43d8c52cbbecc673f1f69bf37b9c3865d56ab5a",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/manpages/manpages_5.10-1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_manpages-dev",
        downloaded_file_path = "manpages-dev_5.10-1_all.deb",
        sha256 = "84a62717c2300ce6856bcc7404a6a0719d564ea648c6d4000031e7e9d502ce85",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/manpages/manpages-dev_5.10-1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_media-types",
        downloaded_file_path = "media-types_4.0.0_all.deb",
        sha256 = "f9835dcf3cdbaf163104d4e511c9c4e0f41a56822e147e57f28f749fcbf7d44c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/m/media-types/media-types_4.0.0_all.deb"],
    )
    http_file(
        name = "arm64_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "arm64_debian11_openssh-client",
        downloaded_file_path = "openssh-client_8.4p1-5+deb11u1_arm64.deb",
        sha256 = "5a12509b3cb23ade3c7b1b13c73b766ef150918567f9dc417e651d7d8bdf4118",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/o/openssh/openssh-client_8.4p1-5+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u5_arm64.deb",
        sha256 = "d6fb022b1fcb30cb7e385560274d544661a8fef144188bec2d4d9f7513ff6fb2",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230602T162438Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb11u5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_patch",
        downloaded_file_path = "patch_2.7.6-7_arm64.deb",
        sha256 = "11e5e56f3cb4b306c9589bb37f9c701bf23bb37c410bac12e6a50d6461e71bd6",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/patch/patch_2.7.6-7_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_perl",
        downloaded_file_path = "perl_5.32.1-4+deb11u2_arm64.deb",
        sha256 = "625a2d0cafb5089953012d60d3a5ba726b692d9d49955a251b78b8cce884d05b",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/perl/perl_5.32.1-4+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_perl-modules-5.32",
        downloaded_file_path = "perl-modules-5.32_5.32.1-4+deb11u2_all.deb",
        sha256 = "6fa15be322c3c89ec4a07d704ad58d4a2d1aabf866135a859f6d8d58c59e9df4",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/perl/perl-modules-5.32_5.32.1-4+deb11u2_all.deb"],
    )
    http_file(
        name = "arm64_debian11_pinentry-curses",
        downloaded_file_path = "pinentry-curses_1.1.0-4_arm64.deb",
        sha256 = "540ead6b68311b8994a8952d3eb8b816f6eaf47cd99710d0ee1c3a850fe0e2f7",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/pinentry/pinentry-curses_1.1.0-4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_publicsuffix",
        downloaded_file_path = "publicsuffix_20220811.1734-0+deb11u1_all.deb",
        sha256 = "bcd944b23ddfa74a11075848e13ba74453056456f58e9a125a1ecfbe22649410",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/publicsuffix/publicsuffix_20220811.1734-0+deb11u1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_python3",
        downloaded_file_path = "python3_3.9.2-3_arm64.deb",
        sha256 = "79197285d25e73a2a07667efe80af152dd932ac5ef3e13717f1ac824d111ea81",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-defaults/python3_3.9.2-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_python3-dev",
        downloaded_file_path = "python3-dev_3.9.2-3_arm64.deb",
        sha256 = "be51d8754b264939a490902737120c790759e1610b2064c6f09de7ff075ee5a5",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-defaults/python3-dev_3.9.2-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_python3-distutils",
        downloaded_file_path = "python3-distutils_3.9.2-1_all.deb",
        sha256 = "05ec4080e0f05ba6b1c339d89c97f6343919be450b66cf4cfb215f54dcb85e58",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.9.2-1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_python3-lib2to3",
        downloaded_file_path = "python3-lib2to3_3.9.2-1_all.deb",
        sha256 = "802c198e5dd0b5af85a6937e426a85d616680785e8d18148fac451281a83a9a9",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-stdlib-extensions/python3-lib2to3_3.9.2-1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_python3-minimal",
        downloaded_file_path = "python3-minimal_3.9.2-3_arm64.deb",
        sha256 = "7c0e0e24c995d3419e3c80fa47407b8fef0b631c70dbadee75d1783e509c4783",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3-defaults/python3-minimal_3.9.2-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_python3.9",
        downloaded_file_path = "python3.9_3.9.2-1_arm64.deb",
        sha256 = "88cbc8eee37ef1f240fdd458f984bd3770cdd8cb1703e8e1666e026f6ca61327",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/python3.9_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_python3.9-dev",
        downloaded_file_path = "python3.9-dev_3.9.2-1_arm64.deb",
        sha256 = "0b9a702fd27704257848f4c04d114bf4d8d67c642538440ee83a22712704a6fc",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/python3.9-dev_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_python3.9-minimal",
        downloaded_file_path = "python3.9-minimal_3.9.2-1_arm64.deb",
        sha256 = "bc0d0ed39ebc066020c3a16afdab4fd3e0260b41ae799273531d5b2403ae7b27",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/python3.9/python3.9-minimal_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_readline-common",
        downloaded_file_path = "readline-common_8.1-1_all.deb",
        sha256 = "3f947176ef949f93e4ad5d76c067d33fa97cf90b62ee0748acb4f5f64790edc8",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/r/readline/readline-common_8.1-1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_sensible-utils",
        downloaded_file_path = "sensible-utils_0.0.14_all.deb",
        sha256 = "b9a447dc4ec8714196b037e20a2209e62cd669f5450222952f259bda4416b71f",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/s/sensible-utils/sensible-utils_0.0.14_all.deb"],
    )
    http_file(
        name = "arm64_debian11_ucf",
        downloaded_file_path = "ucf_3.0043_all.deb",
        sha256 = "ebef6bcd777b5c0cc2699926f2159db08433aed07c50cb321fd828b28c5e8d53",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/u/ucf/ucf_3.0043_all.deb"],
    )
    http_file(
        name = "arm64_debian11_xauth",
        downloaded_file_path = "xauth_1.1-1_arm64.deb",
        sha256 = "2706acc2b9cc43829201654b67ef698627c81e3a0968d968b5355dd90d525144",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/x/xauth/xauth_1.1-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_xz-utils",
        downloaded_file_path = "xz-utils_5.2.5-2.1~deb11u1_arm64.deb",
        sha256 = "65458ab2602dc8644d412411545560e8d4dd456cd04d8653822002f637c87e8a",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/x/xz-utils/xz-utils_5.2.5-2.1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_zlib1g-dev",
        downloaded_file_path = "zlib1g-dev_1.2.11.dfsg-2+deb11u2_arm64.deb",
        sha256 = "6aa99970b3af7dbc6e34d7b55b493ba65b1a2d7c18cea042e96e271f1bb8ecfe",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/z/zlib/zlib1g-dev_1.2.11.dfsg-2+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u5_arm64.deb",
        sha256 = "8a691cca6e8a841bd9d9a95ccb21222c2feb6c9b996fc3776f8f1a3bffc0f004",
        urls = ["https://snapshot.debian.org/archive/debian/20221217T151645Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libc6",
        downloaded_file_path = "libc-bin_2.36-6_arm64.deb",
        sha256 = "a8dc87b15599129a0b057b9862ad28d4ab9584fa9c37dcabab82518638e13d59",
        urls = ["https://snapshot.debian.org/archive/debian/20221217T151645Z/pool/main/g/glibc/libc6_2.36-6_arm64.deb"],
    )

    http_file(
        name = "arm64_debian11_libstdcpp6",
        downloaded_file_path = "libstdc%2B%2B6_12.2.0-10_arm64.deb",
        sha256 = "552e9f3e397d7b5bd29def30366125f2836e68de8e36bf2060751c1d66f230ec",
        urls = ["https://snapshot.debian.org/archive/debian/20221217T151645Z/pool/main/g/gcc-12/libstdc%2B%2B6_12.2.0-10_arm64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpcre2-8-0",
        downloaded_file_path = "libpcre2-8-0_10.36-2+deb11u1_amd64.deb",
        sha256 = "ee192c8d22624eb9d0a2ae95056bad7fb371e5abc17e23e16b1de3ddb17a1064",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/pcre2/libpcre2-8-0_10.36-2+deb11u1_amd64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpcre2-8-0",
        downloaded_file_path = "libpcre2-8-0_10.36-2+deb11u1_arm64.deb",
        sha256 = "27a4362a4793cb67a8ae571bd8c3f7e8654dc2e56d99088391b87af1793cca9c",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/p/pcre2/libpcre2-8-0_10.36-2+deb11u1_arm64.deb"],
    )
    http_file(
        name = "amd64_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u2_amd64.deb",
        sha256 = "03d2ab2174af76df6f517b854b77460fbdafc3dac0dca979317da67538159a3e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_amd64.deb"],
    )
    http_file(
        name = "arm64_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u2_arm64.deb",
        sha256 = "e3963985d1a020d67ffd4180e6f9c4b5c600b515f0c9d8fda513d7a0e48e63a1",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_arm64.deb"],
    )
    http_file(
        name = "amd64_debian11_libidn2-0",
        downloaded_file_path = "libidn2-0_2.3.0-5_amd64.deb",
        sha256 = "cb80cd769171537bafbb4a16c12ec427065795946b3415781bc9792e92d60b59",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libi/libidn2/libidn2-0_2.3.0-5_amd64.deb"],
    )
    http_file(
        name = "arm64_debian11_libidn2-0",
        downloaded_file_path = "libidn2-0_2.3.0-5_arm64.deb",
        sha256 = "0d2e6d39bf65f16861f284be567c1a6c5d4dc6b54dcfdf9dba631546ff4e6796",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/libi/libidn2/libidn2-0_2.3.0-5_arm64.deb"],
    )
    http_file(
        name = "amd64_debian11_libnettle8",
        downloaded_file_path = "libnettle8_3.7.3-1_amd64.deb",
        sha256 = "e4f8ec31ed14518b241eb7b423ad5ed3f4a4e8ac50aae72c9fd475c569582764",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/nettle/libnettle8_3.7.3-1_amd64.deb"],
    )
    http_file(
        name = "arm64_debian11_libnettle8",
        downloaded_file_path = "libnettle8_3.7.3-1_arm64.deb",
        sha256 = "5061c931f95dc7277d95fc58bce7c17b1a95c6aa9a9aac781784f3b3dc909047",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/nettle/libnettle8_3.7.3-1_arm64.deb"],
    )
    http_file(
        name = "amd64_debian11_gnutls-bin",
        downloaded_file_path = "gnutls-bin_3.7.1-5+deb11u3_amd64.deb",
        sha256 = "0ceb3b1612d68e98d84c343e08f230694ec962e0e4dae1102745831c7a616781",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnutls28/gnutls-bin_3.7.1-5+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgmp10",
        downloaded_file_path = "libgmp10_6.2.1+dfsg-1+deb11u1_amd64.deb",
        sha256 = "fc117ccb084a98d25021f7e01e4dfedd414fa2118fdd1e27d2d801d7248aebbc",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gmp/libgmp10_6.2.1+dfsg-1+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgnutls30",
        downloaded_file_path = "libgnutls30_3.7.1-5+deb11u3_amd64.deb",
        sha256 = "d7d504ff9d45a292a4af549014c9471b526a0dbc898ff9a606fe24e0319a2d8e",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnutls28/libgnutls30_3.7.1-5+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libhogweed6",
        downloaded_file_path = "libhogweed6_3.7.3-1_amd64.deb",
        sha256 = "6aab2e892cdb2dfba45707601bc6c3b19aa228f70ae5841017f14c3b0ca3d22f",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/nettle/libhogweed6_3.7.3-1_amd64.deb"],
    )
    http_file(
        name = "arm64_debian11_gnutls-bin",
        downloaded_file_path = "gnutls-bin_3.7.1-5+deb11u3_arm64.deb",
        sha256 = "257e43ef720cdb4f90a6875b3fefb77225c0d5faa6ab2bcc29eac20100b9b3b4",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnutls28/gnutls-bin_3.7.1-5+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgmp10",
        downloaded_file_path = "libgmp10_6.2.1+dfsg-1+deb11u1_arm64.deb",
        sha256 = "d52619b6ff8829aa5424dfe3189dd05f22118211e69273e9576030584ffcce80",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gmp/libgmp10_6.2.1+dfsg-1+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgnutls30",
        downloaded_file_path = "libgnutls30_3.7.1-5+deb11u3_arm64.deb",
        sha256 = "19a1a0dfc9b6975f155afa2d0e60696a31444b2999f5ff619af247811cb41837",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/g/gnutls28/libgnutls30_3.7.1-5+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libhogweed6",
        downloaded_file_path = "libhogweed6_3.7.3-1_arm64.deb",
        sha256 = "3e9eea5e474dd98a7de9e4c1ecfbfd6f6efb1d40bf51d6473de9713cf41d2191",
        urls = ["https://snapshot.debian.org/archive/debian/20230601T090755Z/pool/main/n/nettle/libhogweed6_3.7.3-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libc-bin-2_36",
        downloaded_file_path = "libc-bin_2.36-6_arm64.deb",
        sha256 = "4cfa3c2e3f498ebe84cb55542cfee42acde08b40fc30f28bbdce27a2f3c3dbe9",
        urls = ["https://snapshot.debian.org/archive/debian/20221217T151645Z/pool/main/g/glibc/libc-bin_2.36-6_arm64.deb"],
    )
