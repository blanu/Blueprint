//
//  SwiftStructure.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension Structure
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        return """
        \(i)\(try self.makeHeader())
        \(i){
        \(try self.makeBody(indentation))
        \(i)}
        """.text
    }

    func makeHeader() throws -> Text
    {
        let vis = try self.visibility.transpile(.swift)
        let pass = try self.passing.transpile(.swift)

        let types = self.inherits + self.implements

        let typesText: Text
        if types.isEmpty
        {
            typesText = ""
        }
        else
        {
            typesText = ": \(types.map { $0.string }.joined(separator: ", "))".text
        }

        return """
        \(vis)\(pass) \(self.name)\(typesText)
        """.text
    }

    func makeBody(_ indentation: Int) throws -> Text
    {
        if self.properties.isEmpty
        {
            if self.functions.isEmpty
            {
                return ""
            }
            else
            {
                let functionsText = Text.join(try self.functions.map { try $0.transpile(.swift, indentation: indentation) }, "\n")

                return """
                \(functionsText)
                """.text
            }
        }
        else
        {
            let propertiesText = Text.join(try self.properties.map { try $0.transpile(.swift, indentation: indentation) }, "\n")

            if self.functions.isEmpty
            {
                return """
                \(propertiesText)
                """.text
            }
            else
            {
                let functionsText = Text.join(try self.functions.map { try $0.transpile(.swift, indentation: indentation) }, "\n")

                return """
                \(propertiesText)
                \(functionsText)
                """.text
            }
        }
    }
}
