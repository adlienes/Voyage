//
//  IlanlarViewController.swift
//  IosProjem
//
//  Created by Enes on 16.04.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit
import FirebaseDatabase


class IlanlarViewController: UIViewController,UITableViewDelegate, UITableViewDataSource   {
    
    @IBOutlet var tableView: UITableView!
    
    var postData = [String] ()
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        handle=ref?.child("Gonderiler").observe(.childAdded, with: { (snapshot) in
            
            let post=snapshot.value as? String
            
            if let actualpost=post {
                self.postData.append(actualpost)
                self.tableView.reloadData()
            }
        })
    }

    @IBAction func BtnGeri(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = postData[indexPath.row]
        return cell
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
