//
//  ChainedExpression.swift
//
//
//  Created by Dr. Brandon Wiley on 3/18/24.
//

import Foundation

import Text

public struct ChainedExpression
{
    public let lvalue: Expression
    public let rvalue: FunctionCall

    public init(lvalue: Expression, rvalue: FunctionCall)
    {
        self.lvalue = lvalue
        self.rvalue = rvalue
    }
}

extension ChainedExpression: Blueprint
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
