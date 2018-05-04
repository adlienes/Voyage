//
//  ProfilViewController.swift
//  IosProjem
//
//  Created by Enes on 4.05.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfilViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BtnCikis(_ sender: UIBarButtonItem) {
        
        
        let alert = UIAlertController(title: "Çıkış Yapmak İstiyormusunuz.", message: "Çıkış Yapmak İstiyorsanız Evet, Yapmak İstemiyorsanız Hayır'a Tıklayın", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Evet", style: UIAlertActionStyle.default, handler: { (action) in
            try! Auth.auth().signOut()
            self.performSegue(withIdentifier: "goSignout", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "Hayır", style: .cancel, handler: nil))
        
        self.present(alert, animated: true,completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
