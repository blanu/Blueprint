//
//  SwiftValue.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension Value
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        switch self
        {
            case .literal(let literal):
                return try literal.transpile(.swift)

            case .variable(let variable):
                return variable
        }
    }
}
