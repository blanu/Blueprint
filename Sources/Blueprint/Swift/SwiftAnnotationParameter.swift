//
//  SwiftAnnotationParameter.swift
//
//
//  Created by Dr. Brandon Wiley on 1/27/24.
//

import Foundation

import Text

extension AnnotationParameter
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        return "\(self.name): \(try self.value.transpile(.swift))".text
    }
}
