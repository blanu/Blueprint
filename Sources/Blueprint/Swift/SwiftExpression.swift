//
//  SwiftExpression.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension Expression
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        switch self
        {
            case .cast(let cast):
                return try cast.transpile(.swift)

            case .chain(let chain):
                return try chain.transpile(.swift)

            case .constructorCall(let call):
                return try call.transpile(.swift)

            case .functionCall(let call):
                return try call.transpile(.swift)

            case .index(let index):
                return try index.transpile(.swift, indentation: indentation)

            case .math(let math):
                return try math.transpile(.swift)

            case .value(let value):
                return try value.transpile(.swift)
        }
    }
}
