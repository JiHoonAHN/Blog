import Publish
import Plot

struct BlogHTMLFactory: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Blog>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(
                for: context.site,
                description: "JihoonAHN Blog records my growth process. I share all my knowledge and experiences with you."
            ),
            .body(
                .grid(
                    .header(for: context.site),
                    .homePage(for: context.allItems(
                        sortedBy: \.date,
                        order: .descending)
                        .filter { $0.sectionID == .posts },
                        on: context.site),
                    .footer(for: context.site)
                )
            )
        )
    }
    
    func makeSectionHTML(for section: Section<Blog>, context: PublishingContext<Blog>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .div(.h1(.text(section.title))),
                    .footer(for: context.site)
                )
            )
        )
    }
    
    func makeItemHTML(for item: Item<Blog>, context: PublishingContext<Blog>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(
                for: context.site,
                title: item.title,
                description: item.description
            ),
            .body(
                .grid(
                    .header(for: context.site),
                    .post(for: item, on: context.site),
                    .footer(for: context.site)
                )
            )
        )
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<Blog>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(
                for: context.site,
                title: page.title,
                description: page.description
            ),
            .body(
                .grid(
                    .header(for: context.site),
                    .page(for: page, context: context),
                    .footer(for: context.site)
                )
            )
        )
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Blog>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(
                for: context.site,
                title: "JiHoonAHN blog All Tags",
                description: "All the tags on JiHoonAHN blog | \(context.allTags.map{ $0.string }.joined(separator: ", "))"
            ),
            .body(
                .grid(
                    .header(for: context.site),
                    .tagList(for: page.tags.reversed(), on: context.site),
                    .footer(for: context.site)
                )
            )
        )
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Blog>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(
                for: context.site,
                title: "Tags | \(page.tag.string)",
                description: "\(page.tag.string) | Found \(context.pages.count) posts"
            ),
            .body(
                .grid(
                    .header(for: context.site),
                    .tagDetail(
                        for: context.items(
                            taggedWith: page.tag,
                            sortedBy: \.date),
                        on: context.site,
                        title: "\(page.tag.string.capitalized)"
                    ),
                    .footer(for: context.site)
                )
            )
        )
    }
}
