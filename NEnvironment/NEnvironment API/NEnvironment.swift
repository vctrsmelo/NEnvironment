
/*
 
 Objetivo:
 - Ter uma única source of truth
 - Não ser uma variável global (acessível de qualquer lugar do código)
 - Mas deve poder ser acessível de qualquer lugar que precise acessá-la.
 
 */

import Foundation

// MARK: - Source of Truth
// É quem mantém em memória as informações. Não pode ser acessado diretamente.
// Decidi criar uma classe ao invés de só um dicionário porque se quisermos
// persistir ela futuramente, dá pra fazer dentro da classe.

private let sourceOfTruth = NEnvironment()
private class NEnvironment {
    var elements = [String: Any]()
    
    subscript(key: String) -> Any? {
        get { elements[key] }
        set { elements[key] = newValue; notify(for: key) }
    }
    
    private func notify(for key: String) {
        NotificationCenter.default.post(name: NSNotification.Name("Environment"), object: nil)
    }
}

@propertyWrapper
struct NEnvironmentObject<T> {
    private let id: String
    private let defaultValue: T
    
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
    
    init(id: EnvironmentObjectId) {
        self.init(id: id.rawValue, defaultValue: id.defaultValue())
    }
    
    init(id: String, defaultValue: T) {
        self.id = id
        self.defaultValue = defaultValue
    }

}

// MARK: - IDs

// Objetivos:
// - tornar IDs estáticos
// - facilitar criação dos NEnvironmentObject (não precisar passar defaultValue no init)

// TODO: trocar esse enum por um protocolo
enum EnvironmentObjectId: String {
    case name
    case age
    
    func defaultValue<T>() -> T {
        switch self {
        case .name: return "" as! T
        case .age: return 0 as! T
        }
    }
}

protocol NEnvironmentObserver: AnyObject { }
extension NEnvironmentObserver {
    func registerObserver(_ selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name("Environment"), object: nil)
    }
}
