//
//  FileUploadViewController.swift
//  FileUpload
//
//  Created by Mahendra Vishwakarma on 17/01/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class FileUploadViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.uploadButton.setTitle("Take Photo", for: .normal)
        self.uploadButton.isUploadable  = false
    }
    
    @IBOutlet weak var uploadButton: ActionButton!
    @IBOutlet weak var uploadingImageView: UIImageView!
    
    
    // responsible for choose option to take image & upload image api
    @IBAction func chooseImage(_ sender: Any) {
        
        self.uploadButton.isUploadable ? self.uploadData(image: uploadingImageView.image!): self.takeImagefromResource()
        
    }
    

}
