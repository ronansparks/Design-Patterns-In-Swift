/*:
💍 单例模式（Singleton）
------------

单例模式确保一个类只有一个对象被创建。
所有对该类的对象的引用，都指向同一个实例。
应用的场景较少，不要滥用该模式！

### 例子:
*/
class DeathStarSuperlaser {
    static let sharedInstance = DeathStarSuperlaser()

    private init() {
        // 私有化初始方法，确保只有一个实例被创建
    }
}
/*:
### 使用:
*/
let laser = DeathStarSuperlaser.sharedInstance
