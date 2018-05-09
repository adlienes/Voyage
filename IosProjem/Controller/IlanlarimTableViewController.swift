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
                        }
                    }
                }
            }
            self.tablo.reloadData()
            self.yukleniyorimleci2.stopAnimating()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

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
