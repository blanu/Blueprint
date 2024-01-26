//
//  SwiftImport.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension ImportSection
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        let globalsText = "\(i)\(try self.globals.map { try $0.transpile(.swift).string }.joined(separator: "\n"))"
        let localsText: Text
        if self.locals.isEmpty
        {
            localsText = ""
        }
        else
        {
            localsText = "\n\(i)\(self.locals.map { "import \($0)" }.joined(separator: "\n"))".text
        }

        return """
        \(globalsText)
        \(localsText)
        """.text
    }
}

extension GlobalImportTarget
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        switch self
        {
            case .BigNumber:
                return """
                \(i)import BigNumber
                """.text
            case .Datable:
                return """
                \(i)import Datable
                """.text
            case .Hex:
                return """
                \(i)import SwiftHexTools
                """.text
            case .Logging:
                return """
                \(i)import Logging
                """.text
            case .RadioWave:
                return """
                \(i)import RadioWave
                """.text
            case .Text:
                return """
                \(i)import Text
                """.text
        }
    }
}
