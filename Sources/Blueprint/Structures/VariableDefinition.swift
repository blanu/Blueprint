//
//  VariableDefinition.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public struct VariableDefinition
{
    public let mutability: Mutability
    public let name: Text
    public let type: Type?

    public init(mutability: Mutability = .immutable, name: Text, type: Type? = nil)
    {
        self.mutability = mutability
        self.name = name
        self.type = type
    }
}

extension VariableDefinition: Blueprint
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
