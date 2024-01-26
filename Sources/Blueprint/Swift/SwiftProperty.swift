//
//  SwiftProperty.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension Property
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        let vis = try self.visibility.transpile(.swift)
        let mut = try self.mutability.transpile(.swift)
        let type = try self.type.transpile(.swift)

        let initText: Text
        if let initializer = self.initializer
        {
            initText = " = \(try initializer.transpile(.swift))".text
        }
        else
        {
            initText = ""
        }

        return """
        \(i)\(vis)\(mut) \(self.name): \(type)\(initText)
        """.text
    }
}
