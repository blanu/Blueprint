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
    public let statements: [Statement]

    public init(name: Text, arguments: [CaseArgument] = [], statements: [Statement] = [])
    {
        self.name = name
        self.arguments = arguments
        self.statements = statements
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
