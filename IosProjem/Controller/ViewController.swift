//
//  ViewController.swift
//  IosProjem
//
//  Created by Enes on 18.03.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if Auth.auth().currentUser != nil {
             self.performSegue(withIdentifier: "goAna", sender: self)
        } else {
            print("Kullıanıcı yok")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

