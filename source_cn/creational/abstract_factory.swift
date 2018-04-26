/*:
🌰 抽象工厂模式（Abstract Factory）
-------------------

抽象工厂模式提供一个接口，用于创建一组相关或相互依赖的工厂。
工厂将在运行时创建具体的对象。
 
### 示例
*/
/*: 
协议
*/
protocol Decimal {
    func stringValue() -> String
    // 工厂
    static func make(string : String) -> Decimal
}

typealias NumberFactory = (String) -> Decimal

// 工厂方法实现

struct NextStepNumber: Decimal {
    private var nextStepNumber: NSNumber

    func stringValue() -> String { return nextStepNumber.stringValue }
    
    // 工厂
    static func make(string: String) -> Decimal {
        return NextStepNumber(nextStepNumber: NSNumber(value: (string as NSString).longLongValue))
    }
}

struct SwiftNumber : Decimal {
    private var swiftInt: Int

    func stringValue() -> String { return "\(swiftInt)" }
    
    // 工厂
    static func make(string: String) -> Decimal {
        return SwiftNumber(swiftInt:(string as NSString).integerValue)
    }
}
/*:
抽象工厂
*/
enum NumberType {
    case nextStep, swift
}

enum NumberHelper {
    static func factory(for type: NumberType) -> NumberFactory {
        switch type {
        case .nextStep:
            return NextStepNumber.make
        case .swift:
            return SwiftNumber.make
        }
    }
}
/*:
### 使用
*/
let factoryOne = NumberHelper.factory(for: .nextStep)
let numberOne = factoryOne("1")
numberOne.stringValue()

let factoryTwo = NumberHelper.factory(for: .swift)
let numberTwo = factoryTwo("2")
numberTwo.stringValue()
