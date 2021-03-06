//
//  IlanPaylasViewController.swift
//  IosProjem
//
//  Created by Enes on 25.03.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class IlanPaylasViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet var KonumSearch: UITextField!
    @IBOutlet var VarisSearch: UITextField!
    @IBOutlet var SearchTarih: UITextField!
    @IBOutlet var ViewUcret: UIView!
    @IBOutlet var ViewKoltuk: UIView!
    @IBOutlet var ViewBilgi: UIView!
    @IBOutlet var LabelKonum: UILabel!
    @IBOutlet var LabelVaris: UILabel!
    @IBOutlet var EtUcret: UITextField!
    @IBOutlet var EtBos: UITextField!
    @IBOutlet var EtBilgi: UITextView!
    
    
    var ad:String!
    var soyad:String!
    var tel:String!
    var resimyolu:String!
    
    
    var pickOption = ["Adana", "Adıyaman", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin",
                      "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale",
                      "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir",
                      "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir",
                      "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya",
                      "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya",
                      "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak",
                      "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak",
                      "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"]
    var kontrol=false
    
    let datepicket=UIDatePicker()
    let pickerView = UIPickerView()
    
    var ref:DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref=Database.database().reference()
        
        createPicker()
        createDatePicket()
        
        
        ViewUcret.layer.borderWidth=2
        ViewUcret.layer.borderColor = UIColor.lightGray.cgColor
        
        ViewKoltuk.layer.borderWidth=1
        ViewKoltuk.layer.borderColor=UIColor.lightGray.cgColor
        
        ViewBilgi.layer.borderWidth=1
        ViewBilgi.layer.borderColor=UIColor.lightGray.cgColor

        // Do any additional setup after loading the view.
        BilgiGetir()
    }
    
    
    @IBAction func BtnPaylas(_ sender: UIButton) {
        GonderiPaylas()
    }
    
    func GonderiPaylas()  {
        
        let key = ref.childByAutoId().key
        let gonderenid = Auth.auth().currentUser?.uid
        
        if KonumSearch.text != "" && VarisSearch.text != "" && SearchTarih.text != "" && EtUcret.text != "" && EtBos.text != "" {
            
            let gonderimodel=["ilanid":key,"gonderenid": gonderenid,"konum": KonumSearch.text! ,"varis": VarisSearch.text!,"tarih":SearchTarih.text!,"fiyat": EtUcret.text!,"koltuksayisi": EtBos.text!,"bilgi": EtBilgi.text!,"ad": ad!,"soyad": soyad!,"tel": tel!,"resimyolu":resimyolu!]
            
            /*let gonderi=GonderiModel(ilanid: key, gonderenid: "ad", konum: KonumSearch.text!, varis: VarisSearch.text!, tarih: SearchTarih.text!, fiyat: EtUcret.text!, koltuksayisi: EtBos.text!, bilgi: EtBilgi.text!) */
            
            ref.child("Gonderiler").child(key).setValue(gonderimodel)
            let KayitMesaj=UIAlertController(title: "Başarılı", message: "İlan Paylaşımı Başarılı", preferredStyle: UIAlertControllerStyle.alert)
            KayitMesaj.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(KayitMesaj, animated: true, completion: nil)
        } else {
            let KayitBos=UIAlertController(title: "Hata", message: "Lütfen Tüm Verileri Giriniz", preferredStyle: UIAlertControllerStyle.alert)
            KayitBos.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(KayitBos, animated: true, completion: nil)
        }
        
        
    }
    
    func BilgiGetir(){
        
        let gonderenid = Auth.auth().currentUser?.uid
        ref?.child("KullanıcıBilgileri").child(gonderenid!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let add = value?["ad"] as? String ?? ""
            let soyadd = value?["soyad"] as? String ?? ""
            let tell = value?["tel"] as? String ?? ""
            self.ad=add
            self.soyad=soyadd
            self.tel=tell
        })
        
        ref?.child("ResimYolları").child(gonderenid!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let resimyoluu = value?["resimyolu"] as? String ?? ""
        
            self.resimyolu=resimyoluu
        })
    }
    
    
    func createPicker() {
        
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        
        let done=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed2) )
        toolbar.setItems([done], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        pickerView.delegate = self
        pickerView.dataSource=self
        
        KonumSearch.inputAccessoryView=toolbar
        KonumSearch.inputView = pickerView
        
        VarisSearch.inputAccessoryView=toolbar
        VarisSearch.inputView=pickerView
        
        
        
    }
    
    func createDatePicket(){
        
        //toolbar
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        
        let done=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed) )
        toolbar.setItems([done], animated: false)
        
        SearchTarih.inputAccessoryView=toolbar
        SearchTarih.inputView=datepicket
        
        datepicket.datePickerMode = .date
    
    }
    
    @objc func donePressed2(){
        
        print("done pres")
        KonumSearch.resignFirstResponder()
        VarisSearch.resignFirstResponder()
        kontrol=true
    }
    
    @objc func donePressed(){
        
        let format=DateFormatter()
        format.dateStyle = .medium
        format.timeStyle = .none
        let tarihstring=format.string(from: datepicket.date)
        
        SearchTarih.text="\(tarihstring)"
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if kontrol==false {
            KonumSearch.text = pickOption[row]
            LabelKonum.text = pickOption[row]
        }else{
            VarisSearch.text=pickOption[row]
            LabelVaris.text = pickOption[row]
        }
    }
}
