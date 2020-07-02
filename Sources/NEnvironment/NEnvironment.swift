import Foundation

class NEnvironment {
    var elements = [String: Any]()
    
    subscript(key: String) -> Any? {
        get { elements[key] }
        set { elements[key] = newValue }
    }
}
