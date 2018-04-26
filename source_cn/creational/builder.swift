/*:
👷 建造者模式（Builder）
----------

建造者模式用于，将一个复杂对象的构造与它的表示（属性）分离，可以创建不同的表示（属性）。
使用其他类控制对象的构建。

### 示例
*/
class DeathStarBuilder {

    var x: Double?
    var y: Double?
    var z: Double?

    typealias BuilderClosure = (DeathStarBuilder) -> ()

    init(buildClosure: BuilderClosure) {
        buildClosure(self)
    }
}

struct DeathStar : CustomStringConvertible {

    let x: Double
    let y: Double
    let z: Double

    init?(builder: DeathStarBuilder) {

        if let x = builder.x, let y = builder.y, let z = builder.z {
            self.x = x
            self.y = y
            self.z = z
        } else {
            return nil
        }
    }

    var description:String {
        return "Death Star at (x:\(x) y:\(y) z:\(z))"
    }
}
/*:
### 使用
*/
let empire = DeathStarBuilder { builder in
    builder.x = 0.1
    builder.y = 0.2
    builder.z = 0.3
}

let deathStar = DeathStar(builder:empire)
/*:
>**更多示例:** [Design Patterns in Swift](https://github.com/kingreza/Swift-Builder)
*/
