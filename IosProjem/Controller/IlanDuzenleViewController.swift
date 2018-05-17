//
//  IlanDuzenleViewController.swift
//  IosProjem
//
//  Created by Enes on 15.05.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class IlanDuzenleViewController: UIViewController {

    
    @IBOutlet var Konum: UITextField!
    @IBOutlet var Varis: UITextField!
    @IBOutlet var Tarih: UITextField!
    @IBOutlet var Ucret: UITextField!
    @IBOutlet var BosKoltuk: UITextField!
    @IBOutlet var Bilgi: UITextView!
    
    public static var gelenTarih2:String?
    public static var gelenKonum2:String?
    public static var gelenVaris2:String?
    public static var gelenKoltuk2:String?
    public static var gelenFiyat2:String?
    public static var gelenBilgi2:String?
    public static var gelenIlanid2:String?
    
    var ad:String?
    var soyad:String?
    var tel:String?
    var arabamodel:String?
    
    
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Konum.text=IlanDuzenleViewController.gelenKonum2
        Varis.text=IlanDuzenleViewController.gelenVaris2
        Tarih.text=IlanDuzenleViewController.gelenTarih2
        Ucret.text=IlanDuzenleViewController.gelenFiyat2
        BosKoltuk.text=IlanDuzenleViewController.gelenKoltuk2
        Bilgi.text=IlanDuzenleViewController.gelenBilgi2
        
        // Do any additional setup after loading the view.
        
        ref=Database.database().reference()
        BilgiGetir()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BtnGuncelle(_ sender: UIButton) {
        BilgiGuncelle()
    }
    
    func BilgiGetir()  {
        
        let gonderenid = Auth.auth().currentUser?.uid
        ref?.child("KullanıcıBilgileri").child(gonderenid!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let add = value?["ad"] as? String ?? ""
            let soyadd = value?["soyad"] as? String ?? ""
            let tell = value?["tel"] as? String ?? ""
            let araba = value?["arabamodel"] as? String ?? ""
            
            
            self.ad=add
            self.soyad=soyadd
            self.tel=tell
            self.arabamodel=araba
            
        })
    }
    
    func BilgiGuncelle()  {
        
        let gonderenid = Auth.auth().currentUser?.uid
        
        if Konum.text != "" && Varis.text != "" && Tarih.text != "" && Ucret.text != "" && BosKoltuk.text != "" {
            
            let gonderimodel=["ilanid":IlanDuzenleViewController.gelenIlanid2,"gonderenid": gonderenid,"konum": Konum.text! ,"varis": Varis.text!,"tarih":Tarih.text!,"fiyat": Ucret.text!,"koltuksayisi": BosKoltuk.text!,"bilgi": Bilgi.text!,"ad": ad,"soyad": soyad,"tel": tel]
            
       ref?.child("Gonderiler").child(IlanDuzenleViewController.gelenIlanid2!).setValue(gonderimodel)
            let KayitMesaj2=UIAlertController(title: "Başarılı", message: "İlan Güncelleme Başarılı", preferredStyle: UIAlertControllerStyle.alert)
            KayitMesaj2.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(KayitMesaj2, animated: true, completion: nil)
        } else {
            let KayitBos=UIAlertController(title: "Hata", message: "Lütfen Tüm Verileri Giriniz", preferredStyle: UIAlertControllerStyle.alert)
            KayitBos.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(KayitBos, animated: true, completion: nil)
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
