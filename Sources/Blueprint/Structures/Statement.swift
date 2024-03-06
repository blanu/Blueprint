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
    case assignment(LValue, Expression)
    case blank
    case branch(Branch)
    case `break`
    case comment(Comment)
    case `continue`
    case expression(Expression)
    case `guard`(Guard)
    case `return`
    case `switch`(Switch)
    case `throw`(Expression)
    case tryCatch(TryCatch)
    case  `while`(While)
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
