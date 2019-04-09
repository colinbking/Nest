//
//  MenuViewController.swift
//  NestOwl
//
//  Created by Nathan Park on 3/2/19.
//  Copyright © 2019 Nathan Park. All rights reserved.
//

import UIKit
import iCarousel

class MenuViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {
    
    @IBOutlet var carouselview: iCarousel!
    
    var imgArr = [UIImage(named: "skyspace_badge"),UIImage(named: "chaus_badge"), UIImage(named: "eastwest_badge"), UIImage(named: "football_badge"), UIImage(named: "shep_badge"), UIImage(named: "rec_badge")]
    
    //var nums = [Int]()
    
    override func awakeFromNib(){
        super.awakeFromNib()
        //nums = ["a","b","c","d","e","f"]
        //nums = [1, 2, 3, 4, 5, 6, 7]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carouselview.type = .rotary
        carouselview.contentMode = .scaleAspectFill
        carouselview.isPagingEnabled = true
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imgArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView{
        var imageView: UIImageView!
        if view == nil {
            imageView = UIImageView(frame: CGRect(x: 0, y:0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            imageView.contentMode = .scaleAspectFit
        }
        else{
            imageView = view as? UIImageView
        }
        
        //let tempView = UIView(frame: CGRect(x: 0, y:0, width: 200, height: 200))
        
        imageView.image = imgArr[index]
        //tempView.backgroundColor = UIColor.blue
        
        return imageView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.spacing{
            return value * 0.9
        }
        return value
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


