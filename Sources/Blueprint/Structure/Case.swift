//
//  Case.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public struct Case
{
    public let name: Text
    public let value: Type?

    public init(name: Text, value: Type? = nil)
    {
        self.name = name
        self.value = value
    }
}

extension Case: Blueprint
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
