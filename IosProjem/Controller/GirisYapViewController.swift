//
//  GirisYapViewController.swift
//  IosProjem
//
//  Created by Enes on 18.03.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class GirisYapViewController: UIViewController {

    @IBOutlet var EtGirisEmail: UITextField!
    @IBOutlet var EtGirisSifre: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BtnGeri(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func BtnGiris(_ sender: UIButton) {
        if EtGirisEmail.text != "" && EtGirisSifre.text != "" {
            Auth.auth().signIn(withEmail: EtGirisEmail.text!, password: EtGirisSifre.text!, completion: { (user, error) in
                
                if user != nil  {
                    self.performSegue(withIdentifier: "gotoHome2", sender: self)
                } else {
                    let GirisHata=UIAlertController(title: "Hata", message: "Böyle Bir Kullanıcı Sistemde Kayıtlı Değiş", preferredStyle: UIAlertControllerStyle.alert)
                    GirisHata.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
                    self.present(GirisHata, animated: true, completion: nil)
                }
            })
        }else {
            let GirisBos=UIAlertController(title: "Hata", message: "Verieri Boş Geçmeyiniz", preferredStyle: UIAlertControllerStyle.alert)
            GirisBos.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(GirisBos, animated: true, completion: nil)
        }
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
