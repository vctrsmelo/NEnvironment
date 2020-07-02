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
    var isUpdating: Bool = false
    
    public var wrappedValue: T {
        set {
            isUpdating = true
            sourceOfTruth[id] = newValue
            notify(for: id)
            isUpdating = false
        }
        get {
            guard isUpdating == false else { return defaultValue }

            let value = sourceOfTruth[id] as? T
            return value ?? defaultValue
        }
    }
    
    // MARK: - Initializers
    
    public init<Type: NEnvironmentKey>(id: Type) {
        self.id = id.environmentId
        self.defaultValue = T.defaultValue
    }
    
    private func notify(for key: String) {
        NotificationCenter.default.post(name: NSNotification.Name("Environment"), object: nil)
    }

}
