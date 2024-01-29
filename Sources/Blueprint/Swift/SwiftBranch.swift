//
//  SwiftBranch.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

extension Branch
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        let elseText: Text
        if let elseClause = self.elseClause
        {
            elseText = try elseClause.transpile(.swift, indentation: indentation)
        }
        else
        {
            elseText = ""
        }

        return """
        \(i)if \(try self.condition.transpile(.swift))
        \(i){
        \(try indentedBlock(self.statements, indentation))
        \(i)}
        \(elseText)
        """.text
    }
}

extension ElseClause
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        switch self
        {
            case .else(let statements):
                return """
                \(i)else
                \(i){
                \(try indentedBlock(statements, indentation))
                \(i)}
                """.text

            case .elseIf(let branch):
                let elseText: Text
                if let elseClause = branch.elseClause
                {
                    elseText = try elseClause.transpile(.swift, indentation: indentation)
                }
                else
                {
                    elseText = ""
                }

                return """
                \(i)else if \(try branch.condition.transpile(.swift))
                \(i){
                \(try indentedBlock(branch.statements, indentation))
                \(i)}
                \(elseText)
                """.text
        }
    }
}
