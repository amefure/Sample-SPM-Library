// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI
import UIKit

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

public class ResourceLoader {
    
    public static let image: Image = Image("sample", bundle: .module)
    public static let uiImage: UIImage = UIImage(named: "sample", in: .module, compatibleWith: nil)!
    
    public static let image2: Image = Image("sample2", bundle: .module)
    public static let uiImage2: UIImage = UIImage(named: "sample", in: .module, compatibleWith: nil)!
    
}
