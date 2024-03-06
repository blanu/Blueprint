//
//  ClientFeature.swift
//
//
//  Created by Dr. Brandon Wiley on 1/30/24.
//

import Foundation

public struct ClientFeature: Feature
{
    public let features: Features

    public init(features: Features)
    {
        self.features = features
    }

    public func update() throws
    {
        var configuration: RuntimeConfiguration
        if let oldConfiguration = self.features.runtimeConfiguration
        {
            configuration = oldConfiguration
        }
        else
        {
            configuration = RuntimeConfiguration(features: (self.features))
        }

        if configuration.parameters["host"] == nil
        {
            configuration.parameters["host"] = RuntimeParameter(flag: "host", help: "the host to connect to in order to access the service", type: .named("Text"))
        }

        if configuration.parameters["port"] == nil
        {
            configuration.parameters["port"] = RuntimeParameter(flag: "port", help: "the port to connect to in order to access the service", type: .named("Int"))
        }

        self.features.runtimeConfiguration = configuration
    }
}

public enum ClientFeatureError: Error
{
    case configurationMissing
    case hostMissing
    case portMissing
}
