//
//  MathExpression.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public indirect enum MathExpression
{
    case infix(Operator, Expression, Expression)
    case postfix(Operator, Expression)
    case prefix(Operator, Expression)
}

extension MathExpression: Blueprint
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
