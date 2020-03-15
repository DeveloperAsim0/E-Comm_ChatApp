

import UIKit

struct Photo {
    var caption: String
    var comment: String
    var image: UIImage
    var price: String
    
    init(caption: String, comment: String, image: UIImage, price: String) {
        self.caption = caption
        self.comment = comment
        self.image = image
        self.price = price
    }
    
    init?(dictionary: [String: String]) {
        guard
            let caption = dictionary["Caption"],
            let comment = dictionary["Comment"],
            let photo = dictionary["Photo"],
            let price = dictionary["Price"],
            let image = UIImage(named: photo)
            else {
                return nil
        }
        self.init(caption: caption, comment: comment, image: image, price: price)
    }
    
    static func allPhotos() -> [Photo] {
        var photos: [Photo] = []
        guard
            let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
            let photosFromPlist = NSArray(contentsOf: URL) as? [[String:String]]
            else {
                return photos
        }
        for dictionary in photosFromPlist {
            if let photo = Photo(dictionary: dictionary) {
                photos.append(photo)
            }
        }
        return photos
        
    }
}
