//
//  Property.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public struct Property
{
    public let isStatic: Bool
    public let visibility: Visibility
    public let mutability: Mutability
    public let name: Text
    public let type: Type?
    public let initializer: Expression?

    public init(isStatic: Bool = false, visibility: Visibility = .public, mutability: Mutability = .immutable, name: Text, type: Type? = nil, initializer: Expression? = nil)
    {
        self.isStatic = isStatic
        self.visibility = visibility
        self.mutability = mutability
        self.name = name
        self.type = type
        self.initializer = initializer
    }
}

extension Property: Blueprint
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
