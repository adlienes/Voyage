//
//  IlanlarTableViewCell.swift
//  IosProjem
//
//  Created by Enes on 23.04.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit

class IlanlarTableViewCell: UITableViewCell {
    
    @IBOutlet var resim: UIImageView!
    @IBOutlet var KisiAdi: UILabel!
    @IBOutlet var Tarih: UILabel!
    @IBOutlet var Anoktasi: UILabel!
    @IBOutlet var Bnoktasi: UILabel!
    @IBOutlet var Fiyat: UILabel!
    @IBOutlet var KoltukSayisi: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
