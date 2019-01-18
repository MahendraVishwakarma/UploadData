//
//  WebServices.swift
//  FileUpload
//
//  Created by Mahendra Vishwakarma on 17/01/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

class WebServices:NSObject, URLSessionTaskDelegate{
    
    static let shared = WebServices()
    class func isConnectionEstablish() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
    
    class func uploadDataOnServer(data:Data, completion: @escaping (Any)->()){
        
        if (!WebServices.isConnectionEstablish()){
            showNoInternetViewController()
            return
        }
        WebServices.shared.pushDataOnServer(data: data)
        
    }
    
    // upload data on server
    
    private func pushDataOnServer(data:Data){
    
    let url = URL(string: "http://0.0.0.0")!
    
        let tempDir = FileManager.default.temporaryDirectory
        let localURL = tempDir.appendingPathComponent("saveDataToLocal")
        try? data.write(to: localURL)
        
        let request = requestWithHeaders(httpMethod: HTTPMehtod.get.rawValue, url: url)
        
        let config = URLSessionConfiguration.background(withIdentifier: "muzunly")
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        let task = session.uploadTask(with: request, fromFile: localURL)
        task.resume()
        
    }
    
    private func requestWithHeaders(httpMethod: String, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.timeoutInterval = 60
        
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        headers["Authorization"] = UserData.token // set username & password
        request.allHTTPHeaderFields = headers
        
        return request
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        
    }
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        
    }
    
    
    
    
   private class func showNoInternetViewController()
    {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let strbrd = UIStoryboard.init(name: "Main", bundle: nil)
        let noInternetConnection = strbrd.instantiateViewController(withIdentifier: "NoInternetConnection") as! NoInternetConnection
        
        if(!noInternetConnection.isBeingPresented)
        {
            appDelegate.window?.rootViewController?.present(noInternetConnection, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    
    
}
