//
//  AnnotationParameter.swift
//
//
//  Created by Dr. Brandon Wiley on 1/27/24.
//

import Foundation

import Text

public struct AnnotationParameter
{
    public let name: Text
    public let value: LiteralValue

    public init(name: Text, value: LiteralValue)
    {
        self.name = name
        self.value = value
    }
}

extension AnnotationParameter: Blueprint
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
