//
//  Branch.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

public struct Branch
{
    public let condition: Expression
    public let statements: [Statement]
    public let elseClause: ElseClause?

    public init(condition: Expression, statements: [Statement] = [], elseClause: ElseClause? = nil)
    {
        self.condition = condition
        self.statements = statements
        self.elseClause = elseClause
    }
}

extension Branch: Blueprint
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

public indirect enum ElseClause
{
    case `else`([Statement])
    case elseIf(Branch)
}

extension ElseClause: Blueprint
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
