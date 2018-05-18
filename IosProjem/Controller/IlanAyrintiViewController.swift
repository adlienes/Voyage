//
//  IlanAyrintiViewController.swift
//  IosProjem
//
//  Created by Enes on 2.05.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit

class IlanAyrintiViewController: UIViewController {

    @IBOutlet var LabelAd: UILabel!
    @IBOutlet var LabelSoyad: UILabel!
    @IBOutlet var LabelTel: UILabel!
    @IBOutlet var LabelTarih: UILabel!
    @IBOutlet var LabelKonum: UILabel!
    @IBOutlet var LabelVaris: UILabel!
    @IBOutlet var LabelKoltuk: UILabel!
    @IBOutlet var LabelFiyat: UILabel!
    @IBOutlet var LabelBİlgi: UILabel!
    @IBOutlet var ProfilResim: UIImageView!
    
    
    var gelenAd:String?
    var gelenSoyad:String?
    var gelenTel:String?
    var gelenTarih:String?
    var gelenKonum:String?
    var gelenVaris:String?
    var gelenKoltuk:String?
    var gelenFiyat:String?
    var gelenBilgi:String?
    var gelenResimyolu:String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LabelAd.text=gelenAd
        LabelSoyad.text=gelenSoyad
        LabelTel.text=gelenTel
        LabelTarih.text=gelenTarih
        LabelKonum.text=gelenKonum
        LabelVaris.text=gelenVaris
        LabelFiyat.text=gelenFiyat
        LabelKoltuk.text=gelenKoltuk
        LabelBİlgi.text=gelenBilgi
        
        let imageUrl = NSURL(string: gelenResimyolu!)
        let dataaa = try! Data(contentsOf: imageUrl! as URL)
        let resim = UIImage(data:dataaa)
        self.ProfilResim.image = resim
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func BtnGeri(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func BtnPaylas(_ sender: UIBarButtonItem) {
        
        let paylasmesaj=gelenAd! + " " + gelenSoyad! + " " + gelenTarih! + "'inde " + gelenKonum! + "'dan " + gelenVaris! + "'a Gidiyor."
        let viewcontreller=UIActivityViewController(activityItems: [paylasmesaj], applicationActivities: nil)
        present(viewcontreller, animated: true, completion: nil)
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
