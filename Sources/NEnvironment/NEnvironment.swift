import Foundation

public class NEnvironment {
    private var elements = [String: Any]()
    
    subscript(key: String) -> Any? {
        get { elements[key] }
        set { elements[key] = newValue }
    }
    
    /// Clear all data in environment. Useful for unit testing.
    public func clear() {
        self.elements = [:]
    }
}
