//
//  Visibility.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public enum Visibility
{
    case `public`
    case `private`
}

extension Visibility: Blueprint
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

