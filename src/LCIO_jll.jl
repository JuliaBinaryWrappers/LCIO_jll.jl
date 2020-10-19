# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule LCIO_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("LCIO")
JLLWrappers.@generate_main_file("LCIO", UUID("35fd387a-780d-5580-bc3c-2dd06d6487c2"))
end  # module LCIO_jll
