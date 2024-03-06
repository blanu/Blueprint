//
//  RuntimeConfiguration.swift
//
//
//  Created by Dr. Brandon Wiley on 1/30/24.
//

import Foundation

import Text

public struct RuntimeConfiguration: Feature
{
    public let features: Features
    public var parameters: [Text: RuntimeParameter] = [:]

    public init(features: Features)
    {
        self.features = features
    }

    public func update() throws
    {

    }
}

public struct RuntimeParameter
{
    public let flag: Text
    public let help: Text
    public let type: Type

    public init(flag: Text, help: Text, type: Type)
    {
        self.flag = flag
        self.help = help
        self.type = type
    }
}
