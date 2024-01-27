//
//  SwitchCase.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public struct SwitchCase
{
    public let name: Text
    public let arguments: [CaseArgument]

    public init(name: Text, arguments: [CaseArgument] = [])
    {
        self.name = name
        self.arguments = arguments
    }
}

extension SwitchCase: Blueprint
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
