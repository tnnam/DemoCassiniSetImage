//
//  DataServices.swift
//  DemoCassiniSetImage
//
//  Created by Tran Ngoc Nam on 4/23/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

class DataServices {
    static let share = DataServices()
    
    private var _photos: [Image]?
    
    var photo: [Image] {
        set {
            _photos = newValue
        }
        get {
            if _photos == nil {
                updateData()
            }
            return _photos ?? []
        }
    }
    
    func updateData() {
        _photos = []
        
        let photo1 = Image(photo: "https://robohash.org/123.png")!
        let photo2 = Image(photo: "https://robohash.org/123.png")!
        let photo3 = Image(photo: "https://robohash.org/123.png")!
        
        _photos = [photo1, photo2, photo3]
    }
}
