//
//  NEnvironmentObject.swift
//  NEnvironment
//
//  Created by Victor Melo on 30/06/20.
//  Copyright © 2020 Victor Melo. All rights reserved.
//

import Foundation

@propertyWrapper
public struct NEnvironmentObject<T: NEnvironmentValue> {
    private let id: String
    private(set) var defaultValue: T
    
    public var wrappedValue: T {
        set {
            NEnvironment.shared[self.id] = newValue
            self.notify(for: self.id)
        }
        get {
            NEnvironment.shared[self.id] as? T ?? defaultValue
        }
    }
    
    // MARK: - Initializers
    
    public init<Type: NEnvironmentKey>(id: Type) {
        self.id = id.environmentId
        self.defaultValue = T.defaultValue
    }
    
    private func notify(for key: String) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name("Environment"), object: nil)
        }
    }
}
