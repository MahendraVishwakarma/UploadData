
//
//  ActionButton.swift
//  FileUpload
//
//  Created by Mahendra Vishwakarma on 17/01/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

class ActionButton:UIButton{
    
    var isUploadable = false
    var title:String?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    private func setup(){
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    
    
    
}
