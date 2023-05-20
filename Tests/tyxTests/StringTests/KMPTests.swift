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
        XCTAssertEqual("tobeornottobe".indices_of(pattern: "to"), [0, 9])
        XCTAssertEqual("".indices_of(pattern: ""), [])
        XCTAssertEqual("aaa".indices_of(pattern: "b"), [])
        XCTAssertEqual("Fang-Ling".indices_of(pattern: "Fang-LingTzu-han"), [])
        XCTAssertEqual("Ssu-yen".indices_of(pattern: "Ssu-yen"), [0])
    }
}
