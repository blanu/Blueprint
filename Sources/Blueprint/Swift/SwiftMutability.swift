//
//  SwiftMutability.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension Mutability
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        switch self
        {
            case .immutable:
                return "let"

            case .mutable:
                return "var"
        }
    }
}
