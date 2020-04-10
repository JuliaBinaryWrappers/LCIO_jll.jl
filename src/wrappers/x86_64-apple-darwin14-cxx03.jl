# Autogenerated wrapper script for LCIO_jll for x86_64-apple-darwin14-cxx03
export libsio, liblcio

using Zlib_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"

# Relative path to `libsio`
const libsio_splitpath = ["lib", "libsio.2.13.3.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libsio_path = ""

# libsio-specific global declaration
# This will be filled out by __init__()
libsio_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libsio = "@rpath/libsio.2.13.dylib"


# Relative path to `liblcio`
const liblcio_splitpath = ["lib", "liblcio.2.13.3.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
liblcio_path = ""

# liblcio-specific global declaration
# This will be filled out by __init__()
liblcio_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const liblcio = "@rpath/liblcio.2.13.dylib"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"LCIO")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Zlib_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Zlib_jll.LIBPATH_list,))

    global libsio_path = normpath(joinpath(artifact_dir, libsio_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libsio_handle = dlopen(libsio_path)
    push!(LIBPATH_list, dirname(libsio_path))

    global liblcio_path = normpath(joinpath(artifact_dir, liblcio_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global liblcio_handle = dlopen(liblcio_path)
    push!(LIBPATH_list, dirname(liblcio_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

