//
//  WebViewController.swift
//  splittable_tt
//
//  Created by Lawrence Dawson on 10/11/2016.
//  Copyright © 2016 Lawrence Dawson. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var professionUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       loadWebPage(urlString: professionUrl)
        
    }
    func loadWebPage(urlString: String){
        let url = NSURL(string: urlString )
        let request = NSURLRequest(url: url as! URL)
        webView.loadRequest(request as URLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
