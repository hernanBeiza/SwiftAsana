//
//  ViewController.swift
//  Asana
//
//  Created by Hernán Beiza on 4/24/17.
//  Copyright © 2017 Hiperactivo. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet var asanaWebView:WebView!;

    override func viewDidLoad() {
        super.viewDidLoad()
        self.cargar();
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func cargar(){
        let url = NSURL(string: "https://app.asana.com");
        let request = NSURLRequest(url: (url?.absoluteURL)!);
        asanaWebView!.mainFrame.load(request as URLRequest!);
    }
}

