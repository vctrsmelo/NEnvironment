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
    private var queue: DispatchQueue = DispatchQueue.global(qos: .utility)
    let semaphore = DispatchSemaphore(value: 1)
    
    public var wrappedValue: T {
        set {
            queue.async { [self] in
                self.semaphore.wait()  // requesting the resource

                sourceOfTruth[self.id] = newValue
                self.notify(for: self.id)

                self.semaphore.signal() // releasing the resource
            }
            
        }
        get {
            return defaultValue
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

//    let lowerPriority = DispatchQueue.global(qos: .utility)
//    let semaphore = DispatchSemaphore(value: 1)
//    func getWrappedValue(queue: DispatchQueue, symbol: String) {
//        queue.async {
//            debugPrint("\(symbol) -- waiting")
//            semaphore.wait()  // requesting the resource
//
//            for i in 0...10 {
//                print(symbol, i)
//            }
//
//            debugPrint("\(symbol) -- signal")
//            semaphore.signal() // releasing the resource
//        }
//    }
    
    
}
