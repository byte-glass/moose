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

### LaTeX strings
using LaTeXStrings

title!(L"$\frac{1}{1+x}$")
xlabel!(L"x")
ylabel!(L"y")

## Attributes  

### see https://docs.juliaplots.org/latest/attributes/#attributes
### there is *loads* of this!
### start with e.g.

plotattr(:Plot) 

### there is also

plotattr(:Series)
plotattr(:Subplot)
plotattr(:Axis)

## combine plots

### e.g. `layout = (2, 2)` in the call to plot in the following

x = range(0, 10, length=100)
y1 = @. exp(-0.1x) * cos(4x)
y2 = @. exp(-0.3x) * cos(4x)
y3 = @. exp(-0.1x)
y4 = @. exp(-0.3x)
y = [y1 y2 y3 y4]

p1 = plot(x, y)
p2 = plot(x, y, title="Title 2", lw=3)
p3 = scatter(x, y, ms=2, ma=0.5, xlabel="xlabel 3")
p4 = scatter(x, y, title="Title 4", ms=2, ma=0.2)

plot(p1, p2, p3, p4, layout = (2, 2), legend=false) # layout = (2, 2) !!

## themes

using PlotThemes

theme(:mute)
theme(:solarized_light)
theme(:sand)
theme(:vibrant)

## scatter plots

using RDatasets, StatsPlots

iris = dataset("datasets", "iris")

@df iris scatter(:SepalLength, :SepalWidth, group = :Species)
@df iris scatter(:SepalLength, :SepalWidth, mc = :pink, ms = 12, ma = 0.5)

### how to specify colour and/or marker by :Species ??


## contour plot

f(x, y) = (3x + y^2) * abs(sin(x) + cos(y))

x = range(0, 5, length=100)
y = range(0, 3, length=50)
z = @. f(x', y)

contour(x, y, z, levels = 20, lw = 1)
contour(x, y, z, levels = 50, lw = 0, fill = true)


## histograms

histogram(randn(10^3), legend = false, color = :beige)

histogram(randn(10^3), legend = false, bins = :sqrt)
histogram(randn(10^3), legend = false, bins = :scott)
histogram(randn(10^3), legend = false, bins = 15)
histogram(randn(10^3), legend = false, bins = range(-5, 5, length = 21))

### normalise; `normalize = [:true|:pdf|:probability|:density]
histogram(randn(10^3), legend = false, bins = range(-5, 5, length = 21), normalize = :true)

## 2d histogram

histogram2d(randn(10^4), randn(10^4))

histogram2d(randn(10^4), randn(10^4), normalize = :pdf, show_empty_bins = true)

### what is a marginalhist?
@df iris marginalhist(:PetalLength, :PetalWidth)


## "Inputs are arguments, not keywords" and "Columns are series"

### The following supposedly serves as an example of just this!?

xs = range(0, 2π, length = 10)
data = [sin.(xs) cos.(xs) 2sin.(xs) 2cos.(xs)]

# We put labels in a row vector: applies to each series
labels = ["Apples" "Oranges" "Hats" "Shoes"]

# Marker shapes in a column vector: applies to data points
markershapes = [:circle, :star5]

# Marker colors in a matrix: applies to series and data points
markercolors = [
    :green :orange :black :purple
    :red   :yellow :brown :white
]

plot(
    xs,
    data,
    label = labels,
    shape = markershapes,
    color = markercolors,
    markersize = 10
)

### the above generates a lot of warnings!?


