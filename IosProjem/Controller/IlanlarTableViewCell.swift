//
//  IlanlarTableViewCell.swift
//  IosProjem
//
//  Created by Enes on 23.04.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit

class IlanlarTableViewCell: UITableViewCell {
    
    @IBOutlet var altView: UIView!
    @IBOutlet var profilresim: UIImageView!
    @IBOutlet var resim: UIImageView!
    @IBOutlet var KisiAdi: UILabel!
    @IBOutlet var Tarih: UILabel!
    @IBOutlet var Anoktasi: UILabel!
    @IBOutlet var Bnoktasi: UILabel!
    @IBOutlet var Fiyat: UILabel!
    @IBOutlet var KoltukSayisi: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        altView.layer.cornerRadius = 10
        self.resim.layer.cornerRadius = self.resim.frame.size.width / 2;
        self.resim.clipsToBounds=true
        self.resim.layer.borderWidth = 0.5;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
