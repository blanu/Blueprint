//
//  SwiftAnnotation.swift
//
//
//  Created by Dr. Brandon Wiley on 1/27/24.
//

import Foundation

import Text

extension Annotation
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        let parameterText: Text
        if self.parameters.isEmpty
        {
            parameterText = ""
        }
        else
        {
            parameterText = "(\(Text.join(try self.parameters.map { try $0.transpile(.swift) }, ", ")))".text
        }

        return """
        \(i)@\(self.name)\(parameterText)
        """.text
    }
}
