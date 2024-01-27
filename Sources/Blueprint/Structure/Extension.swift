//
//  Extension.swift
//
//
//  Created by Dr. Brandon Wiley on 1/27/24.
//

import Foundation

import Text

public struct Extension
{
    public let name: Text
    public let implements: [Text]
    public let properties: [Property]
    public let functions: [Function]

    public init(name: Text, implements: [Text] = [], properties: [Property] = [], functions: [Function] = [])
    {
        self.name = name
        self.implements = implements
        self.properties = properties
        self.functions = functions
    }
}

extension Extension: Blueprint
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

