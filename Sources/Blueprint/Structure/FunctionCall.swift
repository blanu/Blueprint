//
//  Call.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public struct FunctionCall
{
    public let trying: Bool
    public let name: Text
    public let genericTypeParameters: [Type]
    public let arguments: [Argument]

    public init(trying: Bool = false, name: Text, genericTypeParameters: [Type] = [], arguments: [Argument] = [])
    {
        self.trying = trying
        self.name = name
        self.genericTypeParameters = genericTypeParameters
        self.arguments = arguments
    }
}

extension FunctionCall: Blueprint
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
