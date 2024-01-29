//
//  SwiftRangeOperator.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

extension RangeOperator
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        switch self
        {
            case .exclusive(let x, let y):
                let xText: Text
                if let x = x
                {
                    xText = try x.transpile(.swift)
                }
                else
                {
                    xText = ""
                }

                let yText: Text
                if let y = y
                {
                    yText = try y.transpile(.swift)
                }
                else
                {
                    yText = ""
                }

                return "\(xText)..<\(yText)".text

            case .inclusive(let x, let y):
                let xText: Text
                if let x = x
                {
                    xText = try x.transpile(.swift)
                }
                else
                {
                    xText = ""
                }

                let yText: Text
                if let y = y
                {
                    yText = try y.transpile(.swift)
                }
                else
                {
                    yText = ""
                }

                return "\(xText)...\(yText)".text
        }
    }
}
