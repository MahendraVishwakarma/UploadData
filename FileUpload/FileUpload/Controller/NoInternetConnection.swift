//
//  NoInternetConnection.swift
//  FileUpload
//
//  Created by Mahendra Vishwakarma on 18/01/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class NoInternetConnection: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnConn(_ sender: Any)
    {
        if(WebServices.isConnectionEstablish())
        {
            self.dismiss(animated: true, completion: nil)
        }
        else
        {
            Utilities.alertwarning(message: "No internet connection found", atView: self)
        }
        
    }
    
    

}
