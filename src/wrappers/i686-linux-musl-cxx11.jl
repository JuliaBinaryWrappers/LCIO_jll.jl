# Autogenerated wrapper script for LCIO_jll for i686-linux-musl-cxx11
export liblcio, libsio

using Zlib_jll
JLLWrappers.@generate_wrapper_header("LCIO")
JLLWrappers.@declare_library_product(liblcio, "liblcio.so.2.17")
JLLWrappers.@declare_library_product(libsio, "libsio.so.0.0")
function __init__()
    JLLWrappers.@generate_init_header(Zlib_jll)
    JLLWrappers.@init_library_product(
        liblcio,
        "lib/liblcio.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libsio,
        "lib/libsio.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
