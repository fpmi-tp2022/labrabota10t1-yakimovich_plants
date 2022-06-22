//
//  ProfileView.swift
//  yakimovich_plants
//
//  Created by Depravo on 21.06.2022.
//

import Foundation
import UIKit



class ProfileView : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        pageSwitcher.selectedSegmentIndex = 0
       // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var pageSwitcher: UISegmentedControl!
    @IBAction func switchPage(_ sender: Any) {
        if pageSwitcher.selectedSegmentIndex == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVC = storyboard.instantiateViewController(identifier: "PlantsCollectionView")
                        
                        secondVC.modalPresentationStyle = .fullScreen
                        secondVC.modalTransitionStyle = .crossDissolve
                        
                        present(secondVC, animated: true, completion: nil)
        }
    }
}
