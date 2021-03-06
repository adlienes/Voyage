//
//  IlanlarTableViewController.swift
//  IosProjem
//
//  Created by Enes on 18.04.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit
import FirebaseDatabase


class IlanlarTableViewController: UITableViewController {
    
    var bilgi = [String]()
    var fiyat = [String]()
    var gonderenid = [String]()
    var ilanid = [String]()
    var koltuksayisi = [String]()
    var konum = [String]()
    var tarih = [String]()
    var varis = [String]()
    var ad = [String]()
    var soyad = [String]()
    var tel = [String]()
    var resimyoluu = [String]()
    
    
    var ref:DatabaseReference?

    @IBOutlet var YukleniyorImlec: UIActivityIndicatorView!
    @IBOutlet var table: UITableView!
    
   
    
    var gelenkonum:String?
    var gelenvaris:String?
    var gelentarih:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        
        IlanGetir()
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func IlanGetir()  {
        YukleniyorImlec.startAnimating()
        
        ref?.child("Gonderiler").observeSingleEvent(of: .value, with: { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    let myChild = snap
                    if let myChildValue = myChild.value as? [String:Any] {
                        
                        if myChildValue["konum"] as? String==self.gelenkonum && myChildValue["varis"] as? String==self.gelenvaris && myChildValue["tarih"] as? String==self.gelentarih {
                            
                            self.bilgi.append(myChildValue["bilgi"] as! String)
                            self.fiyat.append(myChildValue["fiyat"] as! String)
                            self.gonderenid.append(myChildValue["gonderenid"] as! String)
                            self.ilanid.append(myChildValue["ilanid"] as! String)
                            self.koltuksayisi.append(myChildValue["koltuksayisi"] as! String)
                            self.konum.append(myChildValue["konum"] as! String)
                            self.tarih.append(myChildValue["tarih"] as! String)
                            self.varis.append(myChildValue["varis"] as! String)
                            self.ad.append(myChildValue["ad"] as! String)
                            self.soyad.append(myChildValue["soyad"] as! String)
                            self.tel.append(myChildValue["tel"] as! String)
                            self.resimyoluu.append(myChildValue["resimyolu"] as! String)
     
                        }else {
                            let GirisHata=UIAlertController(title: "Hata", message: "Böyle Bir Kayıt Bulunamadı", preferredStyle: UIAlertControllerStyle.alert)
                            GirisHata.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: { (action) in
                                self.performSegue(withIdentifier: "goIlanYok", sender: self)
                            }))
                            self.present(GirisHata, animated: true, completion: nil)
                        }
                    }
                }
            }
            // self.postTableView.reloadData()
            self.table.reloadData()
            self.YukleniyorImlec.stopAnimating()
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ilanid.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "IlanlarHucre", for: indexPath) as! IlanlarTableViewCell
        cell.KisiAdi.text=ad[indexPath.row]
        cell.Tarih.text=tarih[indexPath.row]
        cell.Anoktasi.text=konum[indexPath.row]
        cell.Bnoktasi.text=varis[indexPath.row]
        cell.Fiyat.text=fiyat[indexPath.row]
        cell.KoltukSayisi.text=koltuksayisi[indexPath.row]
        
        let resimm=resimyoluu[indexPath.row]
        let imageUrl = NSURL(string: resimm)
        let dataaa = try! Data(contentsOf: imageUrl! as URL)
        let resim = UIImage(data:dataaa)
        cell.resim.image=resim
        
        
        //let gecicihucre:IlanlarTableViewCell=tableView.dequeueReusableCell(withIdentifier: "IlanlarHucre") as! IlanlarTableViewCell
        //gecicihucre.KisiAdi.text=meyve[indexPath.row]
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goAyrinti" {
            
            let geciciviewcontrller=segue.destination as! IlanAyrintiViewController
            
            if let geciciindexpath=self.table.indexPathForSelectedRow {
                geciciviewcontrller.gelenKonum=konum[geciciindexpath.row]
                geciciviewcontrller.gelenVaris=varis[geciciindexpath.row]
                geciciviewcontrller.gelenTarih=tarih[geciciindexpath.row]
                geciciviewcontrller.gelenFiyat=fiyat[geciciindexpath.row]
                geciciviewcontrller.gelenKoltuk=koltuksayisi[geciciindexpath.row]
                geciciviewcontrller.gelenBilgi=bilgi[geciciindexpath.row]
                geciciviewcontrller.gelenAd=ad[geciciindexpath.row]
                geciciviewcontrller.gelenSoyad=soyad[geciciindexpath.row]
                geciciviewcontrller.gelenTel=tel[geciciindexpath.row]
                geciciviewcontrller.gelenResimyolu=resimyoluu[geciciindexpath.row]
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
