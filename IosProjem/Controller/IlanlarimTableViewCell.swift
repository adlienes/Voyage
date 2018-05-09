//
//  IlanlarimTableViewCell.swift
//  IosProjem
//
//  Created by Enes on 9.05.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit

class IlanlarimTableViewCell: UITableViewCell {

    
    @IBOutlet var altview2: UIView!
    @IBOutlet var profilresim2: UIImageView!
    @IBOutlet var resim2: UIImageView!
    @IBOutlet var KisiAdi2: UILabel!
    @IBOutlet var Tarih2: UILabel!
    @IBOutlet var Anoktasi2: UILabel!
    @IBOutlet var Bnoktasi2: UILabel!
    @IBOutlet var Fiyat2: UILabel!
    @IBOutlet var KoltukSayisi2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        altview2.layer.cornerRadius = 10
        self.resim2.layer.cornerRadius = self.resim2.frame.size.width / 2;
        self.resim2.clipsToBounds=true
        self.resim2.layer.borderWidth = 0.5;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
