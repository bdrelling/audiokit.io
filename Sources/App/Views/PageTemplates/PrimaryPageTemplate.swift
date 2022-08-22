// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor

/// The primary page template used across the website.
struct PrimaryPageTemplate: PageTemplate {
    /// The title of the website, displayed at the end of a page title.
    /// (eg. `Page Title - Website Title` or `Home - AudioKit`.)
    static let title = "AudioKit"
    
    /// The `<head>` element of the page.
    /// This uses `Node` syntax for `Plot` to ensure better cotrol of top-level elements.
    /// For all other elements on the site, we use `Component`.
    static func head(with page: Page) -> Node<HTML.DocumentContext> {
        .responsiveHead(
            .meta(
                .name("theme-color"),
                .content("#63d2ff")
            ),
            .stylesheet("/css/main.css"),
            .title("\(page.title) - \(self.title)"),
            .favicon("/images/favicon.png")
        )
    }
    
    /// The `<body>` element of the page.
    /// This uses `Node` syntax for `Plot` to ensure better cotrol of top-level elements.
    /// For all other elements on the site, we use `Component`.
    public static func body(with page: Page) -> Node<HTML.DocumentContext> {
        .body(
            .component(page.content)
        )
    }
}

// MARK: - Extensions

// Set the default template for all TemplatedPage objects.
// You can override this on an individual TemplatedPage,
// or simply inherit from Page if you don't wish to use the template.
extension TemplatedPage {
    typealias Template = PrimaryPageTemplate
}