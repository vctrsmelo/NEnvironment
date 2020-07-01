import Foundation
import CryptoKit

class NEnvironment {
    var elements = [String: Any]()
    
    subscript(key: String) -> Any? {
        get { elements[key] }
        set { elements[key] = newValue; notify(for: key) }
    }
    
    private func notify(for key: String) {
        NotificationCenter.default.post(name: NSNotification.Name("Environment"), object: nil)
    }
}
