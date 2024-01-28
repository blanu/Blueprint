//
//  SwiftConstructor.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension Constructor
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        return """
        \(i)\(try self.makeInitHeader())
        \(i){
        \(try indentedBlock(self.statements, indentation))
        \(i)}
        """.text
    }

    func makeInitHeader() throws -> Text
    {
        let vis: Text = try self.visibility.transpile(.swift, indentation: 0)
        let fail: Text = self.failable ? "?" : ""
        let throwable = self.throwing ? " throws" : ""
        let params = try self.parameters.map
        {
            param in

            try param.transpile(Target.swift).string
        }.joined(separator: ", ")

        return """
        \(vis)init\(fail)(\(params))\(throwable)
        """.text
    }
}
