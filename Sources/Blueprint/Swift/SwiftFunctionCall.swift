//
//  SwiftFunctionCall.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension FunctionCall
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let tryingText: Text
        if self.trying
        {
            tryingText = "try "
        }
        else
        {
            tryingText = ""
        }

        let asyncText: Text
        if self.async
        {
            asyncText = "async "
        }
        else
        {
            asyncText = ""
        }

        let genericsText: Text
        if self.genericTypeParameters.isEmpty
        {
            genericsText = ""
        }
        else
        {
            genericsText = "<\(Text.join(try self.genericTypeParameters.map { try $0.transpile(.swift) }, ", "))>".text
        }

        let argumentsText: Text
        if self.arguments.isEmpty
        {
            argumentsText = ""
        }
        else
        {
            argumentsText = Text.join(try self.arguments.map { try $0.transpile(.swift) }, ", ")
        }

        return """
        \(tryingText)\(asyncText)\(self.name)\(genericsText)(\(argumentsText))
        """.text
    }
}
