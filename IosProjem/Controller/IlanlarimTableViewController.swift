//
//  IlanlarimTableViewController.swift
//  IosProjem
//
//  Created by Enes on 9.05.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class IlanlarimTableViewController: UITableViewController {
    
    var bilgi2 = [String]()
    var fiyat2 = [String]()
    var gonderenid2 = [String]()
    var ilanid2 = [String]()
    var koltuksayisi2 = [String]()
    var konum2 = [String]()
    var tarih2 = [String]()
    var varis2 = [String]()
    var ad2 = [String]()
    var soyad2 = [String]()
    var tel2 = [String]()
    var resimyolu2 = [String]()
    
    var ref2:DatabaseReference?

    @IBOutlet var tablo: UITableView!
    @IBOutlet var yukleniyorimleci2: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         ref2 = Database.database().reference()
        let id = Auth.auth().currentUser?.uid
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        yukleniyorimleci2.startAnimating()
        ref2?.child("Gonderiler").observeSingleEvent(of: .value, with: { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    let myChild = snap
                    if let myChildValue = myChild.value as? [String:Any] {
                        
                        if myChildValue["gonderenid"] as? String==id {
                            self.bilgi2.append(myChildValue["bilgi"] as! String)
                            self.fiyat2.append(myChildValue["fiyat"] as! String)
                            self.gonderenid2.append(myChildValue["gonderenid"] as! String)
                            self.ilanid2.append(myChildValue["ilanid"] as! String)
                            self.koltuksayisi2.append(myChildValue["koltuksayisi"] as! String)
                            self.konum2.append(myChildValue["konum"] as! String)
                            self.tarih2.append(myChildValue["tarih"] as! String)
                            self.varis2.append(myChildValue["varis"] as! String)
                            self.ad2.append(myChildValue["ad"] as! String)
                            self.soyad2.append(myChildValue["soyad"] as! String)
                            self.tel2.append(myChildValue["tel"] as! String)
                            
                            
                            self.ref2?.child("ResimYolları").child(id!).observeSingleEvent(of: .value, with: { (snapshot2) in
                                if let snapshots2 = snapshot2.children.allObjects as? [DataSnapshot] {
                                    for snap2 in snapshots2 {
                                        let myChild2 = snap2
                                        if let myChildValue2 = myChild2.value as? [String:Any] {
                                        
                                                self.resimyolu2.append(myChildValue2["resimyolu"] as! String)
                                        }
                                    }
                                }
                                self.tablo.reloadData()
                            })
                        }
                    }
                }
            }
            self.tablo.reloadData()
            self.yukleniyorimleci2.stopAnimating()
        })
        
       
        
        tablo.allowsMultipleSelectionDuringEditing=true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let moreRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Düzenle", handler:{action, indexpath in
            print("MORE•ACTION",indexPath.row);
            self.performSegue(withIdentifier: "goIlanlarimDuzenle", sender: nil)
            IlanDuzenleViewController.gelenKonum2=self.konum2[indexPath.row]
            IlanDuzenleViewController.gelenVaris2=self.varis2[indexPath.row]
            IlanDuzenleViewController.gelenTarih2=self.tarih2[indexPath.row]
            IlanDuzenleViewController.gelenFiyat2=self.fiyat2[indexPath.row]
            IlanDuzenleViewController.gelenKoltuk2=self.koltuksayisi2[indexPath.row]
            IlanDuzenleViewController.gelenBilgi2=self.bilgi2[indexPath.row]
        });
        moreRowAction.backgroundColor = UIColor(red: 0.298, green: 0.851, blue: 0.3922, alpha: 1.0);
        
        let deleteRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Sil", handler:{action, indexpath in
            
            self.ref2?.child("Gonderiler").child(self.ilanid2[indexPath.row]).removeValue()
            self.ilanid2.remove(at: indexPath.row)
            self.tablo.deleteRows(at: [indexPath], with: .automatic)
            
            if(self.ilanid2.count==0){
                self.performSegue(withIdentifier: "goSil", sender: nil)
            }
        });
        
        return [deleteRowAction, moreRowAction];
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ilanid2.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IlanlarimHucre", for: indexPath) as! IlanlarimTableViewCell

        cell.KisiAdi2.text=ad2[indexPath.row]
        cell.Tarih2.text=tarih2[indexPath.row]
        cell.Anoktasi2.text=konum2[indexPath.row]
        cell.Bnoktasi2.text=varis2[indexPath.row]
        cell.Fiyat2.text=fiyat2[indexPath.row]
        cell.KoltukSayisi2.text=koltuksayisi2[indexPath.row]

        return cell
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="goIlanlarimDuzenle" {
            
            let geciciviewcontrller=segue.destination as! IlanDuzenleViewController
            
            if let geciciindexpath=self.tablo.indexPathForSelectedRow {
                geciciviewcontrller.gelenKonum2=konum2[geciciindexpath.row]
                geciciviewcontrller.gelenVaris2=varis2[geciciindexpath.row]
                geciciviewcontrller.gelenTarih2=tarih2[geciciindexpath.row]
                geciciviewcontrller.gelenFiyat2=fiyat2[geciciindexpath.row]
                geciciviewcontrller.gelenKoltuk2=koltuksayisi2[geciciindexpath.row]
                geciciviewcontrller.gelenBilgi2=bilgi2[geciciindexpath.row]
            }
        }
    }*/
    

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
