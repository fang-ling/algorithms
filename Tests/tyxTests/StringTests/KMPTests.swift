//
//  KMPTests.swift
//  
//
//  Created by Fang Ling on 2023/5/19.
//

import Foundation
import XCTest
@testable import tyx

final class KMPTests: XCTestCase {
    func test_π() {
        XCTAssertEqual(compute_prefix_function(Array("ABAABC")),
                       [0-1, 0-1, 1-1, 1-1, 2-1, 0-1])
    }
    
    func test_kmp() {
        XCTAssertEqual("tobeornottobe".indicesOf(pattern: "to"), [0, 9])
        XCTAssertEqual("".indicesOf(pattern: ""), [])
        XCTAssertEqual("aaa".indicesOf(pattern: "b"), [])
        XCTAssertEqual("Fang-Ling".indicesOf(pattern: "Fang-LingTzu-han"), [])
        XCTAssertEqual("Ssu-yen".indicesOf(pattern: "Ssu-yen"), [0])
    }
}
