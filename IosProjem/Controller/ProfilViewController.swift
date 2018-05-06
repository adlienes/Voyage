//
//  ProfilViewController.swift
//  IosProjem
//
//  Created by Enes on 4.05.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class ProfilViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var profilresim: UIImageView!
    @IBOutlet var Ad: UITextField!
    @IBOutlet var Soyad: UITextField!
    @IBOutlet var Tel: UITextField!
    @IBOutlet var ArabaModel: UITextField!
    @IBOutlet var YukleniyorImleci: UIActivityIndicatorView!
    
    var ref:DatabaseReference?
    var ref2:StorageReference?

    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ref = Database.database().reference()
        ref2=Storage.storage().reference()
        
        BİlgiGetir()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func BİlgiGetir()  {
        
        YukleniyorImleci.startAnimating()
        let gonderenid = Auth.auth().currentUser?.uid
        ref?.child("KullanıcıBilgileri").child(gonderenid!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let add = value?["ad"] as? String ?? ""
            let soyadd = value?["soyad"] as? String ?? ""
            let tell = value?["tel"] as? String ?? ""
            
            self.Ad.text=add
            self.Soyad.text=soyadd
            self.Tel.text=tell
            self.YukleniyorImleci.stopAnimating()
        })
    }
    
    func BilgiKaydet() {
        
        if Ad.text != nil && Soyad.text != nil {
            let id = Auth.auth().currentUser?.uid
            let kulanicimodel=["id":id, "ad": Ad.text!, "soyad": Soyad.text!, "tel": Tel.text!]
            
            ref?.child("KullanıcıBilgileri").child(id!).setValue(kulanicimodel)
            
            let Kayit=UIAlertController(title: "Başarılı", message: "Bilgiler Başarılı Bir Şekilde Güncellendi", preferredStyle: UIAlertControllerStyle.alert)
            Kayit.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(Kayit, animated: true, completion: nil)
        } else {
            let KayitHata=UIAlertController(title: "Hata", message: "Verieri Boş Geçmeyiniz", preferredStyle: UIAlertControllerStyle.alert)
            KayitHata.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(KayitHata, animated: true, completion: nil)
        }
    }
    
    @IBAction func BtnKaydet(_ sender: Any) {
        BilgiKaydet()
        ResimKaydet()
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
    
    @IBAction func ResimSec(_ sender: Any) {
        let controller=UIImagePickerController()
        controller.delegate=self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
    }
   
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image=info[UIImagePickerControllerOriginalImage] as! UIImage
        profilresim.image=image
        print("BİLGİ",image)
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func ResimKaydet()  {
       //ref2?.child("Resimler").putFile()
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
