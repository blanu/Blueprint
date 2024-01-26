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
            case .constructorCall(let call):
                return try call.transpile(.swift)

            case .functionCall(let call):
                return try call.transpile(.swift)

            case .math(let math):
                return try math.transpile(.swift)

            case .value(let value):
                return try value.transpile(.swift)
        }
    }
}
