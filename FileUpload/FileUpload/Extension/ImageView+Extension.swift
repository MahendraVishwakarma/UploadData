//
//  ImageView+Extension.swift
//  FileUpload
//
//  Created by Mahendra Vishwakarma on 17/01/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import UIKit


//this class is responsible to convert image into data
extension UIImage{
    func convertIntoDataFrom() -> Data{
        
        guard let imageDta = self.pngData() else{
            return Data()
        }
        
        return imageDta
    }
}
