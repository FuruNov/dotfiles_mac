using OhMyREPL
setargs!(ARGS, args...) = (empty!(ARGS); append!(ARGS, args))
function run(script, args...)
    setargs!(ARGS, args...)
    include(script)
end