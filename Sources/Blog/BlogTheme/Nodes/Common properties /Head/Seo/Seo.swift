import Plot

extension Node where Context == HTML.HeadContext {
    static func seo(for site : Blog, description: String? = nil) -> Node {
        return .group(
            .title("\(site.name)"),
            .meta(
                .name("description"),
                .content(site.description)
            ),
            .meta(
                .property("og:description"),
                .content(description ?? "")
            ),
            .meta(
                .property("og:url"),
                .content(site.url.description)
            ),
            .meta(
                .property("og:image"),
                .content("/images/logo/Pelagornis_dark.jpg")
            ),
            .meta(
                .property("og:type"),
                .content("website")
            )
        )
    }
}

