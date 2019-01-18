//
//  FileUploadViewController+Extension.swift
//  FileUpload
//
//  Created by Mahendra Vishwakarma on 17/01/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

extension FileUploadViewController{
    
   
    //choose option to take photo
    func takeImagefromResource()
    {
        
        let pickerController = UIImagePickerController()
        
        let alertViewController = UIAlertController(title: nil, message: "Choose resource to take photo", preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
            {
                pickerController.delegate = self
                pickerController.sourceType = UIImagePickerController.SourceType.camera
                pickerController.allowsEditing = true
                self.present(pickerController, animated: true, completion: nil)
            }
            
        })
        
        
        let gallery = UIAlertAction(title: "Gallery", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
                pickerController.delegate = self
                pickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
                pickerController.allowsEditing = true
                self.present(pickerController, animated: true, completion: nil)
            }
            
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            
            
        })
        
        
        alertViewController.addAction(camera)
        alertViewController.addAction(gallery)
        alertViewController.addAction(cancel)
        self.present(alertViewController, animated: true, completion: nil)
        
    }
    
    
    //MARK:- imagePickerController delegates
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{
            return
        }
        
        uploadingImageView.image = image
        self.uploadButton.setTitle("Upload on Server", for: .normal)
        self.uploadButton.isUploadable = true
        
        dismiss(animated:true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated:true, completion: nil)
    }
    
    //MARK:- call method to upload data on server
    
    final func uploadData(image:UIImage){
        
        WebServices.uploadDataOnServer(data: image.convertIntoDataFrom()) { (status) in
            
            print(status)
        }
    }
}
