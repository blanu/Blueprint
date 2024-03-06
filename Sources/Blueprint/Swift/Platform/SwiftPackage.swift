//
//  SwiftPackage.swift
//
//
//  Created by Dr. Brandon Wiley on 2/4/24.
//

import Foundation

import Text

public struct SwiftPackage
{
    public let toolsVersion: Text
    public let name: Text
    public let platforms: [SwiftPlatform]
//    public let products: [SwiftProduct]
//    public let dependencies: [SwiftDependency]
//    public let targets: [SwiftTarget]
//    public let swiftLanguageVersion: [SwiftLanguageVersion]
}

extension SwiftPackage: Blueprint
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

extension SwiftPackage
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        return ""
    }
}
