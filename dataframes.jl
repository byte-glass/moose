# (support for) DataFrames

using StatsPlots, RDatasets

iris = dataset("datasets", "iris")

@df iris scatter(:SepalLength, :SepalWidth,
            group = :Species,
            m = ([:red :green :blue], 0.5, [:+ :h :star7], 10))




### end
