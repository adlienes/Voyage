//
//  KullaniciModel.swift
//  IosProjem
//
//  Created by Enes on 1.05.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import Foundation


class KullaniciModel {
    
    var id = ""
    var ad = ""
    var soyad = ""
    var tel = ""
    
    
    init( id:String,ad:String,soyad:String,tel:String) {
        self.id=id
        self.ad=ad
        self.soyad=soyad
        self.tel=tel
    }
}
