import Plot
import Publish
import Foundation

struct DebateList<Site: Website>: Component {
    var items: [Item<Site>]
    var site: Site
    var dateFormatter: DateFormatter
    
    var body: Component {
        List(items) { item in
            Article {
                H1(item.title)
                Node.a(
                    .class("post-card-image-link"),
                    .href(item.path.absoluteString)
                )
            }
        }
    }
}
