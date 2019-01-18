//
//  Utilies.swift
//  FileUpload
//
//  Created by Mahendra Vishwakarma on 18/01/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class Utilities: NSObject {

    class func alertwarning(message:String, atView:AnyObject){
        
        let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        
       
        
        let cancel = UIAlertAction(title: "OK", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            
            
        })
        
        
        alertViewController.addAction(cancel)
        atView.present(alertViewController, animated: true, completion: nil)
    }
}
