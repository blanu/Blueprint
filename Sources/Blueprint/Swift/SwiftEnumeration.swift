//
//  SwiftEnumeration.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension Enumeration
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        return """
        \(i)\(try self.makeInitHeader())
        \(i){
        \(try self.makeInitBody(indentation + 1))
        \(i)}
        """.text
    }

    func makeInitHeader() throws -> Text
    {
        let vis: Text = try self.visibility.transpile(.swift, indentation: 0)

        let typesText: Text
        if self.implements.isEmpty
        {
            typesText = ""
        }
        else
        {
            typesText = ": \(self.implements.map { $0.string }.joined(separator: ", "))".text
        }

        return """
        \(vis)enum \(self.name)\(typesText)
        """.text
    }

    func makeInitBody(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        return Text.join(try self.cases.map
        {
            enumCase in

            "\(i)\(try enumCase.transpile(Target.swift))".text
        }, "\n")
    }
}
