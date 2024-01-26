//
//  SwiftPassingSemantics.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension PassingSemantics
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        switch self
        {
            case .reference:
                return "class"

            case .value:
                return "struct"
        }
    }
}
