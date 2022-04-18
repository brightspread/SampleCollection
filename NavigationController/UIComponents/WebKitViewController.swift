//
//  WebKitViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/18.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {
    
    @IBOutlet weak var vWeb: UIView!
    @IBOutlet weak var wvTest: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
    }
    
    func initializeUI() {
        setupWebView()
    }
    
    func setupWebView() {
        showWebView(isHidden: true, duration: 0)
        wvTest.load(URLRequest(url: URL(string: "https://naver.com")!))
    }
    
    func showWebView(isHidden: Bool, duration: Double) {
        UIView.animate(withDuration: duration, animations: { [weak self] in
            if isHidden {
                self?.vWeb.alpha = 0
            } else {
                self?.vWeb.alpha = 1
            }
        })
    }
    
    @IBAction func webViewButtonTouched(_ sender: Any) {
        showWebView(isHidden: false, duration: 1)
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        showWebView(isHidden: true, duration: 1)
    }
    
}


