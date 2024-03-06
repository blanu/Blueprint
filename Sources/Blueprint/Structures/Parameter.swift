//
//  Parameter.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public struct Parameter
{
    public let name: Text
    public let type: Type
    public let label: Text?
    public let anonymous: Bool
    public let defaultValue: LiteralValue?

    public init(name: Text, type: Type, label: Text? = nil, anonymous: Bool = false, defaultValue: LiteralValue? = nil)
    {
        self.name = name
        self.type = type
        self.label = label
        self.anonymous = anonymous
        self.defaultValue = defaultValue
    }
}

extension Parameter: Blueprint
{
    public func transpile(_ target: Target, indentation: Int = 0) throws -> Text
    {
        return try self.transpileSwift(indentation)
    }
}
