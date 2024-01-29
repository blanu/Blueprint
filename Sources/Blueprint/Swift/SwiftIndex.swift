//
//  SwiftIndex.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

extension Index
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        switch self
        {
            case .range(let array, let range):
                return "\(i)\(try array.transpile(.swift))[\(try range.transpile(.swift))]".text

            case .single(let array, let index):
                return "\(i)\(try array.transpile(.swift))[\(try index.transpile(.swift))]".text
        }
    }
}
