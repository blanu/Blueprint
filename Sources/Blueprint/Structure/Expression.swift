//
//  Expression.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public enum Expression
{
    case functionCall(FunctionCall)
    case constructorCall(ConstructorCall)
    case math(MathExpression)
    case value(RValue)
}

extension Expression: Blueprint
{
    public func transpile(_ target: Target, indentation: Int = 0) throws -> Text
    {
        switch target
        {
            case .swift:
                return try self.transpileSwift(indentation)
        }
    }
}
