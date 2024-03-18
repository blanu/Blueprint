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
            asyncText = "await "
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
        else if self.arguments.count == 1
        {
            let argument = self.arguments[0]

            switch argument.value
            {
                case .literal(let literal):
                    switch literal
                    {
                        case .closure(let closure):
                            argumentsText = try closure.transpile(.swift, indentation: indentation)

                            return """
                            \(tryingText)\(asyncText)\(self.name)\(genericsText)
                            \(argumentsText)
                            """.text

                        default:
                            argumentsText = try argument.transpile(.swift)
                    }

                default:
                    argumentsText = try argument.transpile(.swift)
            }
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
