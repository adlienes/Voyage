//
//  IlanDuzenleViewController.swift
//  IosProjem
//
//  Created by Enes on 15.05.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Konum.text=IlanDuzenleViewController.gelenKonum2
        Varis.text=IlanDuzenleViewController.gelenVaris2
        Tarih.text=IlanDuzenleViewController.gelenTarih2
        Ucret.text=IlanDuzenleViewController.gelenFiyat2
        BosKoltuk.text=IlanDuzenleViewController.gelenKoltuk2
        Bilgi.text=IlanDuzenleViewController.gelenBilgi2
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BtnGuncelle(_ sender: UIButton) {
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
