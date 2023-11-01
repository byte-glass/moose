# Weierstrass's nowhere differentiable function

## see https://en.wikipedia.org/wiki/Weierstrass_function

f(x; N = 5, a = 0.8, b = 8) = sum(a^n * cos(b^n * pi * x) for n in 0:N)


x = range(0, 1.0, length = 500)
plot(x, f.(x, N = 2), lw = 0.5, legend = false, tick_orientation = :out, grid = false)

plot!(x, f.(x, N = 5), lw = 0.25)


### end
