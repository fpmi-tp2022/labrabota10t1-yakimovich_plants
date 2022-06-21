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
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "";
        imageWelcome.image = UIImage(named: "welcome")
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
            resultLabel.text = "Incorrect data!"
        }
        else{
        let path = "/Users/depravo/julia/labrabota10t1-yakimovich_plants/yakimovich_plants/yakimovich_plants/userData.plist"
                    let plist = NSMutableDictionary(contentsOfFile: path)
                    plist?.setObject(password.text, forKey: login.text as! NSCopying)
                    plist?.write(toFile: path, atomically: true)
            resultLabel.text = "Registrate succesfully!"
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVC = storyboard.instantiateViewController(identifier: "ViewController")
                        
                        secondVC.modalPresentationStyle = .fullScreen
                        secondVC.modalTransitionStyle = .crossDissolve
                        
                        present(secondVC, animated: true, completion: nil)
        }
    }
}
