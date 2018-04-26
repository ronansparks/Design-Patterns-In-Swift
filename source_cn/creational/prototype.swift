/*:
🃏 原型模式（Prototype）
------------

通过复制一个现有对象的所有属性，创建出一个新的单独的对象。这个被复制的对象，就是原型。
如果创建一个新对象时，消耗资源多、耗时久，非常适合使用这个模式。

### 示例
*/
class ChungasRevengeDisplay {
    var name: String?
    let font: String

    init(font: String) {
        self.font = font
    }

    func clone() -> ChungasRevengeDisplay {
        return ChungasRevengeDisplay(font:self.font)
    }
}
/*:
### 使用
*/
let Prototype = ChungasRevengeDisplay(font:"GotanProject")

let Philippe = Prototype.clone()
Philippe.name = "Philippe"

let Christoph = Prototype.clone()
Christoph.name = "Christoph"

let Eduardo = Prototype.clone()
Eduardo.name = "Eduardo"
/*:
>**更多示例:** [Design Patterns in Swift](https://github.com/kingreza/Swift-Prototype)
*/
