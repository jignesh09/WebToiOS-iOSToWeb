//
//  ViewController.swift
//  WebView-ClientDemo
//
//  Created by KRISHNA Mac on 06/01/18.
//  Copyright © 2018 Xongolab. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet var webViewObj: UIWebView!
    
    var MainURL = NSURL()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Your webView code goes here
        
        MainURL = NSURL (string: "http://oggit.coderspreview.com/load.html")!
        let requestObj = URLRequest(url: MainURL as URL)
        webViewObj.loadRequest(requestObj)
        
        
    }
        
    //MARK: WebView delegate method
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        let requestURL = webViewObj.request?.url
        let Matchcontent:String = (requestURL?.absoluteString)!
        print(Matchcontent)
        
    
        if Matchcontent.contains("app_link")
        {
            let stringArr = Matchcontent.components(separatedBy: ":")
            print(stringArr)
            
            let requestObj = URLRequest(url: MainURL as URL)
            webViewObj.loadRequest(requestObj)
            
            let open_dialog_box = UIAlertController(title: "iOS Native Alert", message: "Input is \(stringArr[2])", preferredStyle: UIAlertControllerStyle.alert)
            
            open_dialog_box.addAction(UIAlertAction(title: "Success", style: .default, handler: { (action: UIAlertAction!) in
                let param = "Success"
                self.webViewObj.stringByEvaluatingJavaScript(from: "appToWebpage('\(param)')")
            }))
            
            open_dialog_box.addAction(UIAlertAction(title: "Failure", style: .default, handler: { (action: UIAlertAction!) in
                let param = "Failure"
                self.webViewObj.stringByEvaluatingJavaScript(from: "appToWebpage('\(param)')")
            }))
            present(open_dialog_box, animated: true, completion: nil)
        }
        
    }
}

