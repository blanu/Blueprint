//
//  Expression.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public indirect enum Expression
{
    case cast(Cast)
    case constructorCall(ConstructorCall)
    case functionCall(FunctionCall)
    case index(Index)
    case math(MathExpression)
    case value(RValue)
    case chain(ChainedExpression)
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
