//
//  SwiftFunction.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension Function
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        return """
        \(i)\(try self.makeInitHeader())
        \(i){
        \(self.makeInitBody(indentation + 1))
        \(i)}
        """.text
    }

    func makeInitHeader() throws -> Text
    {
        let mut: Text = self.mutating ? "mutating " : ""
        let vis: Text = try self.visibility.transpile(.swift, indentation: 0)
        let throwable = self.throwing ? " throws" : ""
        let params = try self.parameters.map
        {
            param in

            try param.transpile(Target.swift).string
        }.joined(separator: ", ")

        let returnText: Text
        switch self.returnType
        {
            case .void:
                returnText = ""

            default:
                returnText = " -> \(try self.returnType.transpile(.swift))".text
        }

        return """
        \(mut)\(vis)func \(self.name)(\(params))\(throwable)\(returnText)
        """.text
    }

    func makeInitBody(_ indentation: Int) -> Text
    {
        return ""
    }
}
