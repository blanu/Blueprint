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

public func join(_ blueprints: [any Blueprint], _ indentation: Int = 0, _ separator: Text = "", _ target: Target = .swift) throws -> Text
{
    if blueprints.isEmpty
    {
        return ""
    }
    else
    {
        return Text.join(try blueprints.map { try $0.transpile(target, indentation: indentation) }, separator)
    }
}

public func list(_ blueprints: [any Blueprint], _ prefix: Text = "", _ target: Target = .swift) throws -> Text
{
    if blueprints.isEmpty
    {
        return ""
    }
    else
    {
        return "\(prefix)\(try join(blueprints, 0, ", ", target))".text
    }
}

public func block(_ blueprints: [any Blueprint], _ indentation: Int, _ target: Target = .swift) throws -> Text
{
    return try join(blueprints, indentation, "\n", target)
}

public func indentedBlock(_ blueprints: [any Blueprint], _ indentation: Int, _ target: Target = .swift) throws -> Text
{
    return try join(blueprints, indentation + 1, "\n", target)
}

public func optional(_ blueprint: Blueprint?, _ indentation: Int = 0, _ target: Target = .swift) throws -> Text
{
    if let blueprint
    {
        return try blueprint.transpile(target, indentation: indentation)
    }
    else
    {
        return ""
    }
}
