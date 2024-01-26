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
