//
//  Structure.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public class Structure
{
    public let passing: PassingSemantics
    public let visibility: Visibility
    public let name: Text
    public let inherits: [Text]
    public let implements: [Text]
    public var properties: [Property]
    public var functions: [Function]

    public init(passing: PassingSemantics = .value, visibility: Visibility = .public, name: Text, inherits: [Text] = [], implements: [Text] = [], properties: [Property] = [], functions: [Function] = [])
    {
        self.passing = passing
        self.visibility = visibility
        self.name = name
        self.inherits = inherits
        self.implements = implements
        self.properties = properties
        self.functions = functions
    }
}

extension Structure: Blueprint
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
