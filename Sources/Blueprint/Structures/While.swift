//
//  While.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

public struct While
{
    public let expression: Expression
    public let statements: [Statement]

    public init(expression: Expression, statements: [Statement] = [])
    {
        self.expression = expression
        self.statements = statements
    }
}

extension While: Blueprint
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
