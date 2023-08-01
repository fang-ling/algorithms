//
//  mergesort.swift
//  tyx
//
//  Created by Fang Ling on 2023/3/21.
//

import Foundation


/// Merges two sorted array to form a single sorted array.
///
/// - Complexity: O(*n*), where *n* is the number of elements being merged.
private func merge<T : Comparable>(left : [T], right : [T]) -> [T] {
    var array = [T]()

    var j = 0
    var k = 0
    while true {
        if j >= left.count || k >= right.count {
            break
        }
        if left[j] < right[k] {
            array.append(left[j])
            j += 1
        } else {
            array.append(right[k])
            k += 1
        }
    }

    var i = j
    while i < left.count {
        array.append(left[i])
        i += 1
    }
    i = k
    while i < right.count {
        array.append(right[i])
        i += 1
    }

    return array
}

/// - Note:
/// The **merge sort** closely follows the divide-and-conquer paradigm. It
/// operates as follows:
///
/// - Divide: Divide the n-element sequence to be sorted into two subsequences
/// of $n / 2$ elements each.
/// - Conquer: Sort the two subsequences recursively using merge sort.
/// - Combine: Merge the two sorted subsequences to produce the sorted answer.
private func merge_sort<T : Comparable>(array : inout [T]) {
    if array.count > 1 {
        let mid = array.count / 2
        var left = [T](array[0 ..< mid])
        var right = [T](array[mid ..< array.count])
        merge_sort(array: &left)
        merge_sort(array: &right)
        array = merge(left: left, right: right)
    }
}

extension Array where Element : Comparable {
    /// Sorts the collection.
    ///
    /// - Complexity: O(*n* log *n*), where *n* is the length of the collection.
    public mutating func merge_sort() {
        Algorithms.merge_sort(array: &self)
    }
}
