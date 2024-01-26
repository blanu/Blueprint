//
//  SwiftCaseArgument.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension CaseArgument
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        switch self
        {
            case .assign(let name):
                return "let \(name)".text

            case .ignore:
                return "_"
        }
    }
}
