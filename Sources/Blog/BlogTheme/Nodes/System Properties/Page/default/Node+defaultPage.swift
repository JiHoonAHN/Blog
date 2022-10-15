import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    
    static func defaultPage(for page: Page, on site: Blog) -> Node {
        return .div()
    }
    
}