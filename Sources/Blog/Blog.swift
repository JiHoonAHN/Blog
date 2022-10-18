import Foundation
import Publish
import Plot

struct Blog: Website {
    enum SectionID: String, WebsiteSectionID {
        case posts
        case debate
        case about
        
        var name: String {
            switch self {
            case .posts: return "Posts"
            case .debate: return "Debate"
            case .about: return "About"
            }
        }
    }
    
    struct ItemMetadata: WebsiteItemMetadata {
        var excerpt: String
        var topic: String {
            return excerpt
        }
    }
    
    var url = URL(string: "https://your-website-url.com")!
    var title = "JiHoon"
    var name = "JiHoonAHN-Blog"
    var description = "iOS Developer"
    var language: Language { .english }
    var imagePath: Path? { nil }
    var socialMediaLinks: [SocialMediaLink] { [.github,.email] }
    var information: [String] { ["Introduce","Project","Service","Open Source"] }
}