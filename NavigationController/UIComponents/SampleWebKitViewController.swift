//
//  SampleWebKitViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/18.
//

import UIKit
import WebKit

class SampleWebKitViewController: UIViewController {
    
    @IBOutlet weak var vWeb: UIView!
    @IBOutlet weak var wkTest: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vWeb.alpha = 0
        
        if let url = URL(string: "https://naver.com") {
            wkTest.load(URLRequest(url: url))
        }
    }
    
    @IBAction func webviewButtonTouched(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.vWeb.alpha = 1
        })
       
        
        //https://eastjohntech.blogspot.com/2019/12/closure-self.html   closure에서는 왜 self를 사용해야 할까?
        //https://jusung.gitbook.io/the-swift-language-guide/language-guide/07-closures closure
        //https://greenchobo.tistory.com/3 [Swift] Closure에서 weak self 의 사용
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.vWeb.alpha = 0
        })
    }
}
