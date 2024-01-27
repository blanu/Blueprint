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

        let staticText: Text
        if self.isStatic
        {
            staticText = "static "
        }
        else
        {
            staticText = ""
        }

        let vis = try self.visibility.transpile(.swift)
        let mut = try self.mutability.transpile(.swift)

        let typeText: Text
        if let type = self.type
        {
            typeText = ": \(try type.transpile(.swift))".text
        }
        else
        {
            typeText = ""
        }

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
        \(try optional(self.annotation))
        \(i)\(staticText)\(vis)\(mut) \(self.name)\(typeText)\(initText)
        """.text
    }
}
