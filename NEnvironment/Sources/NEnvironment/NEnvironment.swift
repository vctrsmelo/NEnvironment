import Foundation
import CryptoKit

class NEnvironment {
    var elements = [Int: Any]()
    
    subscript(key: Int) -> Any? {
        get { elements[key] }
        set { elements[key] = newValue; notify(for: key) }
    }
    
    private func notify(for key: Int) {
        NotificationCenter.default.post(name: NSNotification.Name("Environment"), object: nil)
    }
}
