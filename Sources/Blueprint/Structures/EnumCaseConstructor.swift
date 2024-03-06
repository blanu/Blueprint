//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 3/6/24.
//

import Foundation

import Text

public struct EnumCaseConstructor
{
    public let type: Text
    public let name: Text
    public let values: [RValue]

    public init(type: Text, name: Text, values: [RValue])
    {
        self.type = type
        self.name = name
        self.values = values
    }
}

extension EnumCaseConstructor: Blueprint
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
