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

    public init(visibility: Visibility, name: Text, implements: [Text] = [], cases: [Case])
    {
        self.visibility = visibility
        self.name = name
        self.implements = implements
        self.cases = cases
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
