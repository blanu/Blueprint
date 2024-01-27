//
//  Blueprint.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public protocol Blueprint
{
    func transpile(_ target: Target, indentation: Int) throws -> Text
}

public func indent(_ indentation: Int) -> Text
{
    guard indentation > 0 else
    {
        return ""
    }

    let array = Array<Character>(repeating: " ", count: indentation * 4)
    return Text(fromUTF8String: String(array: array))
}

public func join(_ blueprints: [any Blueprint], _ indentation: Int = 0, _ separator: Text = "") throws -> Text
{
    return Text.join(try blueprints.map { try $0.transpile(.swift, indentation: indentation) }, separator)
}

public func list(_ blueprints: [any Blueprint]) throws -> Text
{
    return try join(blueprints, 0, ", ")
}

public func block(_ blueprints: [any Blueprint], _ indentation: Int) throws -> Text
{
    return try join(blueprints, indentation, "\n")
}

public func indentedBlock(_ blueprints: [any Blueprint], _ indentation: Int) throws -> Text
{
    return try join(blueprints, indentation + 1, "\n")
}

