//
//  SwitchSwitch.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension Switch
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        if let defaultCase = self.defaultCase
        {
            return """
            \(i)switch \(try self.on.transpile(.swift))
            \(i){
            \(Text.join(try self.cases.map { try $0.transpile(.swift, indentation: indentation) }, "\n\n"))
            \(i)default:
            \(Text.join(try defaultCase.map { try $0.transpile(.swift, indentation: indentation + 1)}, "\n"))
            \(i)}
            """.text
        }
        else
        {
            return """
            \(i)switch \(try self.on.transpile(.swift))
            \(i){
            \(Text.join(try self.cases.map { try $0.transpile(.swift, indentation: indentation + 1) }, "\n\n"))
            \(i)}
            """.text
        }
    }
}
