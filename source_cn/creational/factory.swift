/*:
🏭 工厂模式（Factory Pattern）
-----------------

工厂模式用于替代类的构造，抽象出生成对象的过程，在运行时决定对象的类型。

### 示例
*/
protocol Currency {
    func symbol() -> String
    func code() -> String
}

class Euro : Currency {
    func symbol() -> String {
        return "€"
    }
    
    func code() -> String {
        return "EUR"
    }
}

class UnitedStatesDolar : Currency {
    func symbol() -> String {
        return "$"
    }
    
    func code() -> String {
        return "USD"
    }
}

enum Country {
    case unitedStates, spain, uk, greece
}

enum CurrencyFactory {
    static func currency(for country:Country) -> Currency? {

        switch country {
            case .spain, .greece :
                return Euro()
            case .unitedStates :
                return UnitedStatesDolar()
            default:
                return nil
        }
        
    }
}
/*:
### 使用
*/
let noCurrencyCode = "没有可用的货币码"

CurrencyFactory.currency(for: .greece)?.code() ?? noCurrencyCode
CurrencyFactory.currency(for: .spain)?.code() ?? noCurrencyCode
CurrencyFactory.currency(for: .unitedStates)?.code() ?? noCurrencyCode
CurrencyFactory.currency(for: .uk)?.code() ?? noCurrencyCode
