//
//  KMP.swift
//  
//
//  Created by Fang Ling on 2023/5/19.
//

import Foundation

extension String {
    @inlinable public func indicesOf(pattern : String) -> [Int] {
        if pattern.count > self.count || pattern.isEmpty {
            return []
        }
        
        /* Encapsulate knowledge about how the pattern matches against shifts of
         * itself. We want the longest proper prefix P that is also a proper
         * suffix of pattern[:q].
         */
        /// - Returns: prefix function where π[q] is the length of the longest
        /// prefix of pattern that is a proper suffix of pattern[:q]
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
        
        var result = [Int]()
        let pattern_array = Array(pattern)
        let text_array = Array(self)
        let π = compute_prefix_function(pattern_array)
        let m = pattern.count - 1 /* adjust for 0-origin indexing. */
        var q = -1 /* index in pattern of last character matched */
        for i in text_array.indices {
            /* again, adjust q for 0-origin indexing */
            while q > -1 && pattern_array[q + 1] != text_array[i] {
                q = π[q] /* next character matches */
            }
            if pattern_array[q + 1] == text_array[i] {
                q += 1 /* next character matches */
            }
            if q == m {
                result.append(i - m)
                q = π[q]
            }
        }
        return result
    }
}
