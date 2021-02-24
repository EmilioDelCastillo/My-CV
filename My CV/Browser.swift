//
//  Browser.swift
//  My CV
//
//  Created by Emilio Del Castillo on 08/12/2020.
//

import UIKit
import WebKit

class Browser: UIViewController, UIWebViewDelegate {

    @IBAction func previous(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    @IBAction func forward(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBOutlet weak var webView: WKWebView!
    
    // Unfortunately, users still have to log in to see the content
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: URL(string: "https://www.linkedin.com/in/emilio-del-castillo/")!)
        webView.load(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
