//
//  Value.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public enum RValue
{
    case literal(LiteralValue)
    case property(Text)
    case variable(Text)
    case type(Type)
}

extension RValue: Blueprint
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
