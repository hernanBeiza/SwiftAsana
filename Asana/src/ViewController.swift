//
//  ViewController.swift
//  Asana
//
//  Created by Hernán Beiza on 4/24/17.
//  Copyright © 2017 Hiperactivo. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WebFrameLoadDelegate {

    @IBOutlet var asanaWebView:WebView!;

    @IBOutlet var circularProgressIndicator:NSProgressIndicator!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        asanaWebView.frameLoadDelegate = self;
        circularProgressIndicator.isDisplayedWhenStopped = false;

        self.cargar();
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    // MARK: WebViewDelegate
    func webView(_ sender: WebView!, didStartProvisionalLoadFor frame: WebFrame!) {
        circularProgressIndicator.startAnimation(nil);
    }

    func webView(_ sender: WebView!, didFinishLoadFor frame: WebFrame!) {
        circularProgressIndicator.stopAnimation(nil);
    }
    
    
    func webView(_ sender: WebView!, didFailLoadWithError error: Error!, for frame: WebFrame!) {
        circularProgressIndicator.stopAnimation(nil);
        
    }
    
    func cargar(){
        let url = NSURL(string: "https://app.asana.com");
        let request = NSURLRequest(url: (url?.absoluteURL)!);
        asanaWebView!.mainFrame.load(request as URLRequest!);
    }
    
}

