//
//  Guard.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

public enum Guard
{
    case condition(Expression, [Statement])
    case `let`(Text, Expression, [Statement])
}

extension Guard: Blueprint
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
