//
//  sorting-benchmarks.swift
//  
//
//  Created by Fang Ling on 2023/3/21.
//

import Foundation
import CollectionsBenchmark
import tyx

extension Benchmark {
    public mutating func add_sorting_benchmark() {
        self.add(
            title: "Array<Int> sort (random input)",
            input: [Int].self
        ) { input in
            return { timer in
                var array = input
                array.reserveCapacity(0) // Force unique storage
                timer.measure {
                    array.sort()
                }
                precondition(array.elementsEqual(0 ..< input.count))
            }
        }
        
        self.add(
            title: "Array<Int> bubble_sort (random input)",
            input: [Int].self
        ) { input in
            return { timer in
                var array = input
                array.reserveCapacity(0) // Force unique storage
                timer.measure {
                    array.bubble_sort()
                }
                precondition(array.elementsEqual(0 ..< input.count))
            }
        }
        
        self.add(
            title: "Array<Int> insertion_sort (random input)",
            input: [Int].self
        ) { input in
            return { timer in
                var array = input
                array.reserveCapacity(0) // Force unique storage
                timer.measure {
                    array.insertion_sort()
                }
                precondition(array.elementsEqual(0 ..< input.count))
            }
        }
        
        self.add(
            title: "Array<Int> selection_sort (random input)",
            input: [Int].self
        ) { input in
            return { timer in
                var array = input
                array.reserveCapacity(0) // Force unique storage
                timer.measure {
                    array.selection_sort()
                }
                precondition(array.elementsEqual(0 ..< input.count))
            }
        }
        
        self.add(
            title: "Array<Int> merge_sort (random input)",
            input: [Int].self
        ) { input in
            return { timer in
                var array = input
                array.reserveCapacity(0) // Force unique storage
                timer.measure {
                    array.merge_sort()
                }
                precondition(array.elementsEqual(0 ..< input.count))
            }
        }
        
        self.add(
            title: "Array<Int> quicksort (random input)",
            input: [Int].self
        ) { input in
            return { timer in
                var array = input
                array.reserveCapacity(0) // Force unique storage
                timer.measure {
                    array.quicksort()
                }
                precondition(array.elementsEqual(0 ..< input.count))
            }
        }
        
        self.add(
            title: "Array<Int> quicksort (sorted input)",
            input: [Int].self
        ) { input in
            return { timer in
                var input = input
                input.sort()
                var array = input
                array.reserveCapacity(0) // Force unique storage
                timer.measure {
                    array.quicksort()
                }
                precondition(array.elementsEqual(0 ..< input.count))
            }
        }
        
        self.add(
            title: "Array<Int> insertion_sort (sorted input)",
            input: [Int].self
        ) { input in
            return { timer in
                var input = input
                input.sort()
                var array = input
                array.reserveCapacity(0) // Force unique storage
                timer.measure {
                    array.insertion_sort()
                }
                precondition(array.elementsEqual(0 ..< input.count))
            }
        }
    }
}
