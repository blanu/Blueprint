//
//  SwiftToolsVersion.swift
//  
//
//  Created by Dr. Brandon Wiley on 2/4/24.
//

import Foundation

import Text

public enum SwiftToolsVersion: Text
{
    case v5_9 = "5.9"
}

extension SwiftToolsVersion: Blueprint
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

extension SwiftToolsVersion
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        return """
        // swift-tools-version: \(self.rawValue)
        // The swift-tools-version declares the minimum version of Swift required to build this package.

        """.text
    }
}
