//
//  NEnvironmentObject.swift
//  NEnvironment
//
//  Created by Victor Melo on 30/06/20.
//  Copyright © 2020 Victor Melo. All rights reserved.
//

import Foundation

private let sourceOfTruth = NEnvironment()

@propertyWrapper
public struct NEnvironmentObject<T: NEnvironmentValue> {
    private let id: String
    private(set) var defaultValue: T
    
    public var wrappedValue: T {
        set {
            sourceOfTruth[id] = newValue
        }
        get {
            let value = sourceOfTruth[id] as? T
            return value ?? defaultValue
        }
    }
    
    // MARK: - Initializers
    
    public init<Type: NEnvironmentKey>(id: Type, wrappedValue: T? = nil) {
        self.id = id.environmentId
        self.defaultValue = T.defaultValue
        guard let wrappedValue = wrappedValue else { return }
        self.wrappedValue = wrappedValue
    }

}
