//
//  Statement.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public enum Statement
{
    case assignment(RValue, Expression)
    case blank
    case `break`
    case comment(Comment)
    case `continue`
    case expression(Expression)
    case `return`
    case `throw`(Expression)
}

extension Statement: Blueprint
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
