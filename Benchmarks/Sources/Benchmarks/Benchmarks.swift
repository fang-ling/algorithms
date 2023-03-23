import CollectionsBenchmark

@main
public struct Benchmarks {
    public static func main() {
        var benchmark = Benchmark(title: "Algorithms Benchmarks")
        benchmark.add_sorting_benchmark()
        benchmark.main()
    }
}
