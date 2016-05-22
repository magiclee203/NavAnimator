
import UIKit

struct CardImageModel {
    let name: String
    let title: String
    
    lazy var image: UIImage? = {
        return UIImage(named: self.name)
    }()
    
    init(name: String, title: String) {
        self.name = name
        self.title = title
    }
}