//
//  ViewController.swift
//  WebApp
//
//  Created by Pablo Bertaco on 28/05/20.
//  Copyright © 2020 Pablo Bertaco. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    static var urlString = "https://www.???.com/"
    
    init() {
        super.init(nibName: "\(Self.self)", bundle: .main)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func action(_ sender: Any) {
        self.webView.delegate = self
        self.loadRequest()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadRequest()
        
        self.configureConsole(key: "log")
        self.configureConsole(key: "debug")
        self.configureConsole(key: "info")
        self.configureConsole(key: "warn")
        self.configureConsole(key: "error")
    }
    
    func loadRequest() {
        let urlRequest = URLRequest(url: URL(string: ViewController.urlString)!)
        self.webView.loadRequest(urlRequest)
    }
    
    func configureConsole(key: NSString) {
        let context = self.webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as! JSContext
        let consoleFunction : @convention(block) (String) -> Void = { (msg: String) in
            print("console.\(key) \(msg)")
        }
        context.objectForKeyedSubscript("console").setObject(unsafeBitCast(consoleFunction, to: AnyObject.self), forKeyedSubscript: key)
    }
    
}

