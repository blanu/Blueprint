//
//  LiteralValue.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public enum LiteralValue
{
    case boolean(Bool)
    case string(Text)
    case number(Int)
    case array([RValue])
    case dictionary(keys: [LiteralValue], values: [LiteralValue])
    case constructor(Type, [LiteralValue])
}

extension LiteralValue: Blueprint
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
