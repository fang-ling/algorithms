//
//  quicksort.swift
//
//
//  Created by Fang Ling on 2023/3/21.
//

import Foundation

/// - Note: Partition the array `A[p ... r]` into two (possibly empty) subarrays
/// `A[p ..< q]` and `A[q + 1 ... r]` such that each element of `A[p ..< q]` is
/// less than or equal to `A[q]`, which is, in turn, less than or equal to each
/// element of `A[q + 1 ... r]`.
private func partition<T: Comparable>(array: inout ArraySlice<T>,
                                      _ p : Int,
                                      _ r : Int) -> Int {
    let x = array[r]
    var i = p - 1
    for j in p ..< r {
        if array[j] <= x {
            i += 1
            array.swapAt(i, j)
        }
    }
    array.swapAt(i + 1, r)
    return i + 1
}

/// - Note: Instead of always using `A[r]` as the pivot, we will select a
/// randomly chosen element from the subarray `A[p ... r]`. We do so by first
/// exchanging element `A[r]` with an element chosen at random from `A[p ... r]`
/// .
private
func randomized_partition<T : Comparable> (array: inout ArraySlice<T>,
                                           _ p : Int,
                                           _ r : Int) -> Int {
    let i = Int.random(in: p ... r)
    array.swapAt(i, r)
    return partition(array: &array, p, r)
}


/// - Note: Sort the two subarrays `A[p ..< q]` and `A[q + 1 ... r]` by
/// recursive calls to quicksort.
private func quicksort<T : Comparable>(array: inout ArraySlice<T>,
                                       _ p : Int,
                                       _ r : Int) {
    if p < r {
        let q = randomized_partition(array: &array, p, r)
        quicksort(array: &array, p, q - 1)
        quicksort(array: &array, q + 1, r)
    }
}

extension Array where Element : Comparable {
    /// Sorts the collection.
    ///
    /// - Complexity: O(*n* log *n*) expected, where *n* is the length of the
    /// collection.
    public mutating func quicksort() {
        Algorithms.quicksort(array: &self[...], 0, count - 1)
    }
}
