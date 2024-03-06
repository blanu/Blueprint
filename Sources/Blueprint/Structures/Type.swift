//
//  Type.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public indirect enum Type
{
    case named(Text)
    case list(Type)
    case optional(Type)
    case generic(Text, [Type])
    case type([Text])
    case function(arguments: [Type], returnType: Type, throws: Bool, escaping: Bool)
    case void
}

extension Type: Blueprint
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
