//
//  SwiftTryCatch.swift
//
//
//  Created by Dr. Brandon Wiley on 1/29/24.
//

import Foundation

import Text

extension TryCatch
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        return """
        \(i)do
        \(i){
        \(try indentedBlock(self.tryBlock, indentation))
        \(i)}
        \(i)catch
        \(i){
        \(try indentedBlock(self.catchBlock, indentation))
        \(i)}
        """.text
    }
}
