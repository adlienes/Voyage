//
//  KayitOlViewController.swift
//  IosProjem
//
//  Created by Enes on 18.03.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class KayitOlViewController: UIViewController {

    
    @IBOutlet var EtKayitAd: UITextField!
    @IBOutlet var EtKayitSoyad: UITextField!
    @IBOutlet var EtKayitEmail: UITextField!
    @IBOutlet var EtKayitTel: UITextField!
    @IBOutlet var EtKayitSifre: UITextField!
    
    var resim="https://firebasestorage.googleapis.com/v0/b/iosprojem-79dac.appspot.com/o/KullaniciResim%2Fprofile-2092113_960_720.png?alt=media&token=411a54af-f751-49f2-8d00-b505a788fe79"
    
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref=Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BtnGeri(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func BtnKayitOl(_ sender: UIButton) {
        
        if EtKayitEmail.text != "" && EtKayitSifre.text != "" && EtKayitAd.text != "" && EtKayitSoyad.text != "" && EtKayitTel.text != "" {
            Auth.auth().createUser(withEmail: EtKayitEmail.text!, password: EtKayitSifre.text!) { (user, error) in
                ///asdsadasdasd
                if user != nil {
                    self.performSegue(withIdentifier: "gotoHome", sender: self)
                    self.KullaniciBilgileriKaydet()
                    
                }else {
                    let KayitHata=UIAlertController(title: "Hata", message: "Kayıt Yapılırken Hata Oluştu", preferredStyle: UIAlertControllerStyle.alert)
                    KayitHata.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
                    self.present(KayitHata, animated: true, completion: nil)                }
                
            }
        } else {
            let KayitBos=UIAlertController(title: "Hata", message: "Verieri Boş Geçmeyiniz", preferredStyle: UIAlertControllerStyle.alert)
            KayitBos.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(KayitBos, animated: true, completion: nil)
        }
    }
    
    func KullaniciBilgileriKaydet(){
        
        let id = Auth.auth().currentUser?.uid
        let kulanicimodel=["id":id, "ad": EtKayitAd.text!, "soyad": EtKayitSoyad.text!, "tel": EtKayitTel.text!,"arabamodel":""]
        let kulanicimodel2=["resimyolu":resim]
        ref.child("KullanıcıBilgileri").child(id!).setValue(kulanicimodel)
        ref.child("ResimYolları").child(id!).setValue(kulanicimodel2)
        
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
