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
    var ref:DatabaseReference?
    
    let meyve=["elma","armut","kiwi","ananas","muz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        
        ref?.child("Gonderiler").observeSingleEvent(of: .value, with: { (snapshot) in
           // print(snapshot.value)
            
            
    
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
            
                    let myChild = snap
                    if let myChildValue = myChild.value as? [String:Any] {
                        self.bilgi.append(myChildValue["bilgi"] as! String)
                        self.fiyat.append(myChildValue["fiyat"] as! String)
                        self.gonderenid.append(myChildValue["gonderenid"] as! String)
                        self.ilanid.append(myChildValue["ilanid"] as! String)
                        self.koltuksayisi.append(myChildValue["koltuksayisi"] as! String)
                        self.konum.append(myChildValue["konum"] as! String)
                        self.tarih.append(myChildValue["tarih"] as! String)
                        self.varis.append(myChildValue["varis"] as! String)
                        
                    }
                /*
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                       let post = Post(postKey: key, dictionary: postDict)
                     self.posts.append(post)
 
                    }*/
                }
                print(self.bilgi)
                print(self.fiyat)
                print(self.gonderenid)
                print(self.ilanid)
                print(self.koltuksayisi)
                print(self.konum)
                print(self.tarih)
                print(self.varis)
                print(self.bilgi.count)
            
                
            }
           // self.postTableView.reloadData()
            
            
        })
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return meyve.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "IlanlarHucre", for: indexPath) as! IlanlarTableViewCell
        cell.KisiAdi.text=meyve[indexPath.row]
    
        
        //let gecicihucre:IlanlarTableViewCell=tableView.dequeueReusableCell(withIdentifier: "IlanlarHucre") as! IlanlarTableViewCell
        //gecicihucre.KisiAdi.text=meyve[indexPath.row]
        
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
