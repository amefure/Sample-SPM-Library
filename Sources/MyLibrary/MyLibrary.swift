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
}

public class TextFileReader {
    public static func readTextFile() -> String? {
        let bundle = Bundle.module

        guard let url = bundle.url(forResource: "sample", withExtension: "txt") else {
            return nil
        }

        return try? String(contentsOf: url, encoding: .utf8)
    }
}

public struct MyImageView: View {
    public var body: some View {
        Image("sample", bundle: .module)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
        
        Image(uiImage: UIImage(named: "sample", in: .module, compatibleWith: nil)!)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}

#Preview {
    VStack {
        Text("HELLO")
        MyImageView()
        Text(TextFileReader.readTextFile() ?? "NONE")
    }
   
}
