//
//  KMP+Testing.swift
//  
//
//  Created by Fang Ling on 2023/5/20.
//

import Foundation

/* This function isn't intended to be used outside of `KMP`'s own test
 * target
 */
@inline(__always)
func compute_prefix_function(_ pattern : [Character]) -> [Int] {
    let m = pattern.count
    var π = [Int](repeating: 0, count: m)
    π[0] = -1 /* adjust for 0-origin indexing */
    var k = -1 /* also for 0-origin indexing */
    
    for q in 1 ..< m {
        /* adjust for 0-origin indexing */
        while k > -1 && pattern[k + 1] != pattern[q] {
            k = π[k] /* character does not match */
        }
        if pattern[k + 1] == pattern[q] {
            k += 1 /* character matches, continue */
        }
        /* assign prefix to position of last character matched */
        π[q] = k
    }
    return π
}
