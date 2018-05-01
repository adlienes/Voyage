//
//  IlanAraViewController.swift
//  IosProjem
//
//  Created by Enes on 16.04.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit

class IlanAraViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var LabelKonum: UITextField!
    @IBOutlet var LabelVaris: UITextField!
    @IBOutlet var LabelTarih: UITextField!
    
    
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
    
    
    
    @IBAction func BtnAra(_ sender: UIButton) {
        
        if LabelKonum.text != "" && LabelVaris.text != "" && LabelTarih.text != "" {
            performSegue(withIdentifier: "goIlanlar", sender: self)
        }else {
            let GirisBos=UIAlertController(title: "Hata", message: "Verieri Boş Geçmeyiniz", preferredStyle: UIAlertControllerStyle.alert)
            GirisBos.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(GirisBos, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pickerView = UIPickerView()
        createDatePicket()
        pickerView.delegate = self
        
        LabelKonum.inputView = pickerView
        LabelVaris.inputView=pickerView
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="goIlanlar" {
            
            let geciciviewcontroller=segue.destination as! IlanlarTableViewController
            
            geciciviewcontroller.gelenkonum=LabelKonum.text
            geciciviewcontroller.gelenvaris=LabelVaris.text
            geciciviewcontroller.gelentarih=LabelTarih.text
        }
    }
    
    func createDatePicket(){
        
        //toolbar
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        
        let done=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed) )
        toolbar.setItems([done], animated: false)
        
        LabelTarih.inputAccessoryView=toolbar
        LabelTarih.inputView=datepicket
        
        datepicket.datePickerMode = .date
        
    }
    
    @objc func donePressed(){
        
        let format=DateFormatter()
        format.dateStyle = .medium
        format.timeStyle = .none
        let tarihstring=format.string(from: datepicket.date)
        
        LabelTarih.text="\(tarihstring)"
        self.view.endEditing(true)
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
            LabelKonum.text = pickOption[row]
            LabelKonum.resignFirstResponder()
            LabelKonum.text = pickOption[row]
            kontrol=true
        }else{
            LabelVaris.text=pickOption[row]
            LabelVaris.resignFirstResponder()
            LabelVaris.text = pickOption[row]
            kontrol=false
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
