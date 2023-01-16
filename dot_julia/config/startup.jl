using OhMyREPL
setargs!(ARGS, args...) = (empty!(ARGS); append!(ARGS, args))
function include_with_args(script::String, args::Vector{String}...)
    setargs!(ARGS, script, args...)
    include(script)
end