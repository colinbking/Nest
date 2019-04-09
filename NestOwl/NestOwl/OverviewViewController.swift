//
//  OverviewViewController.swift
//  NestOwl
//
//  Created by Nathan Park on 3/2/19.
//  Copyright © 2019 Nathan Park. All rights reserved.
//

import UIKit
import CoreLocation

class OverviewViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var percentageFondy: UILabel!
    
    let locationManager:CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var coord: UILabel!
    @IBOutlet weak var exit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        //locationManager.distanceFilter = 100
        
        
        let geoFenceRegion:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(29.7182, -95.4001), radius: 100, identifier: "Fondy") //ADJUST RADIUS IF NEEDED
        locationManager.startMonitoring(for: geoFenceRegion)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        for currentLocation in locations {
//            coord.text = "\(currentLocation)"
//        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        percentageFondy.text = "100%!!!"
        createAlert(title: "CONGRATULATIONS!", message: "You have hatched \"Fondy Fanatic\"")
    }
    
    func createAlert(title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Yay", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
//        exit.text = "Exiting \(region.identifier)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

