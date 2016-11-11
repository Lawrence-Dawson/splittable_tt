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
    
    var dataPassed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let passedUrl = dataPassed
        print(passedUrl)
      
       loadWebPage(urlString: dataPassed)
        
    }
    func loadWebPage(urlString: String){
        let url = NSURL(string: urlString )
        let request = NSURLRequest(url: url as! URL)
        webView.loadRequest(request as URLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
