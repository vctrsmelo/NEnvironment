import Foundation

public class NEnvironment {
    
    static var shared = NEnvironment()
    
    private var elements = [String: Any]()
    
    subscript(key: String) -> Any? {
        get { elements[key] }
        set { elements[key] = newValue }
    }
    
    /// Clear all data in environment. Useful for unit testing.
    public static func clear() {
        shared.elements = [:]
    }
}
