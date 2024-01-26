//
//  ConstuctorCall.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public struct ConstructorCall
{
    public let trying: Bool
    public let name: Text
    public let genericTypeParameters: [Type]
    public let arguments: [Argument]
}

extension ConstructorCall: Blueprint
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
