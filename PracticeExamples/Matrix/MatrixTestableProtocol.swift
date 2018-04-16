//
//  MatrixProtocol.swift
//  PracticeExamples
//
//  Created by Evgeny Karev on 16.04.2018.
//  Copyright © 2018 Evgeny Karev. All rights reserved.
//

import Foundation

protocol MatrixTestable {
    /// Author
    static var author: String { get }
    
    /// Matrix constructor
    /// - Parameters:
    ///   - dimension: Matrix size
    ///   - elementConstructor: Closure with input element row and column, which return the element Int64 value
    init(dimension: Int, elementConstructor: ((_ column: Int, _ row: Int) -> Int64))
    
    /// Determinant calculating function
    func determinant() -> Int64
}
