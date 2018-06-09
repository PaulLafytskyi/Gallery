/*
 The MIT License (MIT)

 Copyright (c) 2015-present Badoo Trading Limited.

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import UIKit

public struct ItemIdentifier: Hashable {
    private let itemId: String
    private let sections: [String]

    init(title: String, subtitle: String? = nil) {
        var id = title
        if let subtitle = subtitle {
            id += "(" + subtitle + ")"
        }
        itemId = id
        sections = []
    }

    init(id: ItemIdentifier, sectionTitle: String) {
        self.itemId = id.itemId
        var sections = id.sections
        sections.append(sectionTitle)
        self.sections = sections
    }

    public var hashValue: Int {
        var result = sections
        result.append(itemId)
        return result.joined(separator: "/").hashValue
    }
}

public protocol Presentable {
    func present(from viewController: UIViewController)
}

public protocol Item: Presentable {
    var identifier: ItemIdentifier { get }
    var title: String { get }
    var subtitle: String? { get }
    var subitems: [Item] { get }
}

extension Item {
    public var identifier: ItemIdentifier {
        return ItemIdentifier(title: title, subtitle: subtitle)
    }
    public var subitems: [Item] {
        return []
    }
}
