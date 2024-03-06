//
//  LoggingFeature.swift
//
//
//  Created by Dr. Brandon Wiley on 1/30/24.
//

import Foundation

import Text

public struct LoggingFeature: Feature
{
    public let features: Features
    public let parameters: [Text: RuntimeParameter] = [:]

    public init(features: Features)
    {
        self.features = features
    }

    public func update() throws
    {
    }
}
