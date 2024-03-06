//
//  Annotation.swift
//
//
//  Created by Dr. Brandon Wiley on 1/27/24.
//

import Foundation

import Text

public struct Annotation
{
    public let name: Text
    public let parameters: [AnnotationParameter]

    public init(name: Text, parameters: [AnnotationParameter] = [])
    {
        self.name = name
        self.parameters = parameters
    }
}

extension Annotation: Blueprint
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
