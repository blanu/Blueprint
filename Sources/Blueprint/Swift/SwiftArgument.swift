//
//  SwiftArgument.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension Argument
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        if let label = self.label
        {
            return "\(label): \(try self.value.transpile(.swift, indentation: indentation))".text
        }
        else
        {
            return try self.value.transpile(.swift, indentation: indentation)
        }
    }
}
