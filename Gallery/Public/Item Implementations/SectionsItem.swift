/*
 The MIT License (MIT)

 Copyright (c) 2018-present Badoo Trading Limited.

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

public struct SectionsItem: Item {

    // MARK: - Private properties

    private let sections: [Section]

    // MARK: - Instantiation

    public init(title: String,
                subtitle: String? = nil,
                image: UIImage? = nil,
                sections: [Section]) {
        self.title = title
        self.image = image
        self.subtitle = subtitle
        self.sections = sections
    }

    // MARK: - Item

    public let title: String
    public let image: UIImage?
    public let subtitle: String?

    public var subitems: [Item] {
        return sections.flatMap { $0.items }
    }

    public func viewController() -> UIViewController {
        let dataProvider = SectionsDataProvider(sections: sections)
        let controller = SectionsViewController(dataProvider: dataProvider)
        dataProvider.delegate = controller
        return controller
    }
}
