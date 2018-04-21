//
//  GonderiModel.swift
//  IosProjem
//
//  Created by Enes on 25.03.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import Foundation


class GonderiModel {
    
     var ilanid = ""
     var gonderenid = ""
     var konum = ""
     var varis = ""
     var tarih = ""
     var fiyat = ""
     var koltuksayisi = ""
     var bilgi = ""
    
    
    init( ilanid:String,gonderenid:String,konum:String,varis:String,tarih:String,fiyat:String,koltuksayisi:String,bilgi:String) {
        self.ilanid=ilanid
        self.gonderenid=gonderenid
        self.konum=konum
        self.varis=varis
        self.tarih=tarih
        self.fiyat=fiyat
        self.koltuksayisi=koltuksayisi
        self.bilgi=bilgi
    }
}
