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
struct NEnvironmentObject<T: NEnvironmentValue> {
    private let id: String
    private(set) var defaultValue: T
    
    var wrappedValue: T {
        set {
            sourceOfTruth[id] = newValue
        }
        get {
            let value = sourceOfTruth[id] as? T
            return value ?? defaultValue
        }
    }
    
    // MARK: - Initializers
    
    init<Type: NEnvironmentKey>(id: Type) {
        self.id = id.environmentId
        self.defaultValue = T.defaultValue
    }

}
