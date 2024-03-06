//
//  Enumeration.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public class Enumeration
{
    public let visibility: Visibility
    public let name: Text
    public let implements: [Text]
    public let cases: [Case]
    public let constructors: [Constructor]

    public init(visibility: Visibility = .public, name: Text, implements: [Text] = [], cases: [Case], constructors: [Constructor] = [])
    {
        self.visibility = visibility
        self.name = name
        self.implements = implements
        self.cases = cases
        self.constructors = constructors
    }
}

extension Enumeration: Blueprint
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
