//
//  PlantInfoView.swift
//  yakimovich_plants
//
//  Created by Depravo on 22.06.2022.
//

import UIKit
var plantName = String()
class PlantInfoView : UIViewController{
    
    @IBOutlet weak var plantNameLabel: UILabel!
    @IBAction func swipe(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "ProfileView")
                    
                    secondVC.modalPresentationStyle = .fullScreen
                    secondVC.modalTransitionStyle = .crossDissolve
                    
                    present(secondVC, animated: true, completion: nil)
    }
   
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var water: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var size: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        plantName = selectedPlant
        plantNameLabel.text = plantName
        let path = Bundle.main.path(forResource: "plantsData", ofType: ".plist")
        let dictionary = NSDictionary(contentsOfFile: path!)
        let data = dictionary?.object(forKey: "plantInfo") as? NSDictionary
        let dictPlant = data?.value(forKey: plantName) as? NSDictionary
        print(plantName)
        let imgName = dictPlant?.object(forKey:     "image") as! String
        let dscr = dictPlant?.object(forKey:     "description") as! String
        let waterText =  dictPlant?.object(forKey:     "water") as! String
        let humidityText =  dictPlant?.object(forKey:     "humidity") as! String
        let sizeText =  dictPlant?.object(forKey:     "size") as! String
        let locationText =  dictPlant?.object(forKey:     "location") as! String
        
        img.image = UIImage(named: imgName )
        descriptionLabel.text = dscr
        waterReq.text = waterText
        humidityReq.text = humidityText
        sizeReq.text = sizeText
        locationReq.text = locationText
        
        water.layer.masksToBounds = true
        water.text = ""
        water.layer.cornerRadius = 10
        
        humidity.layer.masksToBounds = true
        humidity.text = ""
        humidity.layer.cornerRadius = 10
        
        location.layer.masksToBounds = true
        location.text = ""
        location.layer.cornerRadius = 10
        
        size.layer.masksToBounds = true
        size.text = ""
        size.layer.cornerRadius = 10
        
    }
    @IBOutlet weak var locationReq: UILabel!
    @IBOutlet weak var sizeReq: UILabel!
    @IBOutlet weak var humidityReq: UILabel!
    @IBOutlet weak var waterReq: UILabel!
}
