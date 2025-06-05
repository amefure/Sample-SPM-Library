// The Swift Programming Language
// https://docs.swift.org/swift-book

// デフォルトではinternalのため別モジュールからはアクセスできない
class TestLibrary {
    var text = "Hello, World!"
}

// 別のモジュールからアクセスできるようにしたい場合はpublicを付与する
public class TestPublicLibrary {
    // デフォルトではinternalのため別モジュールからはアクセスできない
    var text = "Hello, World!"
    
    // イニシャライザにもpublicを付与しないと別のモジュールからインスタンス化できない
    public init(text: String = "Hello, World!") {
        self.text = text
    }
    
    // publicを指定しているので別モジュールからアクセス可能
    public func sayHello() {
        print(text)
    }
}
