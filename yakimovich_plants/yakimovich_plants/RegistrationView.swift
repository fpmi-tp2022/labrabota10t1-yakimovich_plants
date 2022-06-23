//
//  RegistrationView.swift
//  yakimovich_plants
//
//  Created by Depravo on 21.06.2022.
//

import Foundation

import UIKit

class RegistrationView: UIViewController{
    @IBOutlet weak var imageWelcome: UIImageView!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rpassword: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var pageSwitcher: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var viewMapButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "";
        imageWelcome.image = UIImage(named: "welcome")
        
        pageSwitcher.setTitle(NSLocalizedString("sign in", comment: ""), forSegmentAt: 0)
        pageSwitcher.setTitle(NSLocalizedString("sign up", comment: ""), forSegmentAt: 1)
        signUpButton.setTitle(NSLocalizedString("sign up", comment: ""), for: .normal)
        viewMapButton.setTitle(NSLocalizedString("view map", comment: ""), for: .normal)
        login.placeholder = NSLocalizedString("login", comment: "")
        password.placeholder = NSLocalizedString("password", comment: "")
        rpassword.placeholder = NSLocalizedString("repeat password", comment: "")
   
    }
    @IBAction func viewMap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "MapViewController") as MapViewController
                    
                    secondVC.modalPresentationStyle = .fullScreen
                    secondVC.modalTransitionStyle = .crossDissolve
                    
                    present(secondVC, animated: true, completion: nil)
    }
    @IBAction func switchPage(_ sender: Any) {
        if pageSwitcher.selectedSegmentIndex == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVC = storyboard.instantiateViewController(identifier: "ViewController")
                        
                        secondVC.modalPresentationStyle = .fullScreen
                        secondVC.modalTransitionStyle = .crossDissolve
                        
                        present(secondVC, animated: true, completion: nil)
            // zagruzka
        }
    }
    @IBAction func signUpClick(_ sender: Any) {
        if login.text == "" || password.text == "" || rpassword.text != password.text || address.text == "" {
            resultLabel.text = NSLocalizedString("Incorrect data!", comment: "")
        }
        else{
        let path = "/Users/depravo/julia/labrabota10t1-yakimovich_plants/yakimovich_plants/yakimovich_plants/userData.plist"
                    let plist = NSMutableDictionary(contentsOfFile: path)
                    plist?.setObject(password.text, forKey: login.text as! NSCopying)
                    plist?.write(toFile: path, atomically: true)
            
            let path_city = "/Users/depravo/julia/labrabota10t1-yakimovich_plants/yakimovich_plants/yakimovich_plants/userCity.plist"
                        let plist2 = NSMutableDictionary(contentsOfFile: path_city)
                        plist2?.setObject(address.text, forKey: login.text as! NSCopying)
                        plist2?.write(toFile: path_city, atomically: true)
            
            resultLabel.text = NSLocalizedString("Registrate succesfully!", comment: "")
            
            let path_plants = "/Users/depravo/julia/labrabota10t1-yakimovich_plants/yakimovich_plants/yakimovich_plants/usersPlants.plist"
            let dictionary = NSMutableDictionary(contentsOfFile: path_plants)
            let arr = [String]()
            dictionary?.setObject(arr, forKey: "plants_\(login.text!)" as NSCopying)
            dictionary?.write(toFile: path_plants, atomically: true)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVC = storyboard.instantiateViewController(identifier: "ViewController")
                        
                        secondVC.modalPresentationStyle = .fullScreen
                        secondVC.modalTransitionStyle = .crossDissolve
                        
                        present(secondVC, animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
}
