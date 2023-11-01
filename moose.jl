# moose.jl

## see https://docs.juliaplots.org/latest/tutorial/#tutorial

using Plots

x = range(0, 4π, length = 500)
p = plot(x, [sin.(x), cos.(x)], legend = false)

### add some bling
p = plot(x, [sin.(x), cos.(x)], title = "Trigonometric functions", label = ["sin cos"], linewidth = 3)

title!("")
legend!(nothing) # this does *not* work
xlabel!("x")
ylabel!("you must be joking")

## note: all of the above can take a plot e.g. `p` as their first argument

### add another value to be plotted
y3 = @. sin(x)^2 - 1/2   # equivalent to y3 = sin.(x).^2 .- 1/2
plot!(p, x, y3)

### save plot to a file, might also try svg, ps, eps, html and tex
savefig(p, "p.png")
savefig(p, "p.svg")

## line width and style

plot(x, y3, lw = 3, ls = :dot, legend = false)

## placing and labelling of legend

plot(x, y3, legend = :outerbottom, label = "sin(x)^2 - 1/2")

## log scale 

x = 10 .^ range(0, 4, length = 100)
y = @. 1 / (1 + x)

plot(x, y, legend = false)

### log scale can be set after the plot has been rendered (!?)
plot!(xscale = :log10, yscale = :log10, minorgrid = true, tick_direction = :out)

### so too can xlims and ylims
ylims!(1e-5, 1e+0)

## Attributes  

### see https://docs.juliaplots.org/latest/attributes/#attributes
### there is *loads* of this!
### start with e.g.

plotattr(:Plot) 

### there is also

plotattr(:Series)
plotattr(:Subplot)
plotattr(:Axis)





### end
