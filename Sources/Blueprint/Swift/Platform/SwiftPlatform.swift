//
//  SwiftPlatform.swift
//
//
//  Created by Dr. Brandon Wiley on 2/4/24.
//

import Foundation

import Text

public enum SwiftPlatform
{
    case macOS(macOSVersion)
    case iOS(iOSVersion)
}

public enum macOSVersion: Text
{
    case v10_13 = "v10_13"
    case v10_14 = "v10_14"
    case v10_15 = "v10_15"
    case v11 = "v11"
    case v12 = "v12"
    case v13 = "v13"
    case v14 = "v14"
}

public enum iOSVersion: Text
{
    case v12 = "v12"
    case v13 = "v13"
    case v14 = "v14"
    case v15 = "v15"
    case v16 = "v16"
    case v17 = "v17"
}

extension SwiftPlatform: Blueprint
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

extension SwiftPlatform
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        return """
        \(i)try 
        """.text
    }
}
