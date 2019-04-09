

import Foundation
import UIKit

let imageView = UIImageView(image: #imageLiteral(resourceName: "type the name of your image here..."))
class TutorialViewCotroller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: #imageLiteral(resourceName: "intoImage"))
        view.addSubview(imageView)
    }
}
