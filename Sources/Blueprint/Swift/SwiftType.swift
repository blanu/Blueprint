//
//  SwiftType.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension Type
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        switch self
        {
            case .function(arguments: let arguments, returnType: let returnType, throws: let throwing, escaping: let escaping):
                let argumentsText = Text.join(try arguments.map { try $0.transpile(.swift) }, ",")
                let returnTypeText = try returnType.transpile(.swift)

                let throwsText: Text
                if throwing
                {
                    throwsText = " throws"
                }
                else
                {
                    throwsText = ""
                }

                let escapeText: Text
                if escaping
                {
                    escapeText = " @escaping"
                }
                else
                {
                    escapeText = ""
                }

                return """
                \(escapeText)(\(argumentsText))\(throwsText) -> \(returnTypeText)
                """.text

            case .generic(let name, let params):
                let paramsText = try params.map { try $0.transpile(.swift).string }.joined(separator: ", ")
                return "\(name)<\(paramsText)>".text

            case .list(let type):
                return "[\(try type.transpile(.swift))]".text

            case .named(let name):
                return name

            case .optional(let type):
                return "\(try type.transpile(.swift))?".text

            case .type(_):
                return "[Type]".text

            case .void:
                return "Void"
        }
    }
}
