
import UIKit

class CardImageManager {
    static let sharedManager = CardImageManager()
    
    lazy var images: [CardImageModel] = {
        let path = NSBundle.mainBundle().pathForResource("images", ofType: "plist")!
        let array = NSArray(contentsOfFile: path) as! [[String:AnyObject]]
        
        var arrM = [CardImageModel]()
        
        for dict in array {
            let name = dict["name"] as! String
            let title = dict["title"] as! String
            let model = CardImageModel(name: name, title: title)
            arrM.append(model)
        }
        
        return arrM
    }()
}
