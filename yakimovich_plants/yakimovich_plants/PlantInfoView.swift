//
//  PlantInfoView.swift
//  yakimovich_plants
//
//  Created by Depravo on 22.06.2022.
//

import UIKit

class PlantInfoView : UIViewController{
    var plantName = String()
    @IBOutlet weak var plantNameLabel: UILabel!
    @IBAction func swipe(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "ProfileView")
                    
                    secondVC.modalPresentationStyle = .fullScreen
                    secondVC.modalTransitionStyle = .crossDissolve
                    
                    present(secondVC, animated: true, completion: nil)
    }
   
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        plantNameLabel.text = plantName
        let path = Bundle.main.path(forResource: "plantsData", ofType: ".plist")
        let dictionary = NSDictionary(contentsOfFile: path!)
        let data = dictionary?.object(forKey: "plantInfo") as? NSDictionary
        let dictPlant = data?.value(forKey: plantName) as? NSDictionary
        let imgName = dictPlant?.object(forKey:     "image") as! String
        img.image = UIImage(named: imgName )

      
    }
}
