//
//  Operator.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

public enum Operator
{
    case add
    case bitwiseAnd
    case booleaAnd
    case bitwiseOr
    case booleanOr
    case divide
    case equal
    case greaterThan
    case greaterThanOrEqual
    case lessThan
    case lessThanOrEqual
    case multiply
    case not
    case negate
    case subtract
}

extension Operator: Blueprint
{
    public func transpile(_ target: Target, indentation: Int = 0) throws -> Text
    {
        return try self.transpileSwift(indentation)
    }
}
