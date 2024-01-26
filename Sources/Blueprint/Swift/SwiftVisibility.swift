//
//  SwiftVisibility.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension Visibility
{
    func transpileSwift(_ indentation: Int = 0) throws -> Text
    {
        switch self
        {
            case .private:
                return "private "

            case .public:
                return "public "
        }
    }
}
