# Gibbs phenomonen

## see https://en.wikipedia.org/wiki/Gibbs_phenomenon

## square wave

function w(x; c = 2, L = 2, k = 3)
    omega = 2 * pi / L
    2 * c * sum(sin(j * omega * x) / j for j in 2 .* (1:k) .- 1) / pi
end

x = range(0, 0.5, length = 500)

plot(x, w.(x), legend = false, tick_direction = :out)

plot!(x, w.(x, k = 5))
plot!(x, w.(x, k = 9))

plot!(x, w.(x, k = 19))

### end
