//
//  WebKitViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/18.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {
    
    let mainUrl = "https://naver.com"
    
    @IBOutlet weak var vWeb: UIView!
    @IBOutlet weak var wvTest: WKWebView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnForward: UIButton!
    @IBOutlet weak var btnReload: UIButton!
    
//    var popupWebView: WKWebView? // 새창 웹뷰

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
    }
    
    func initializeUI() {
        setupWebView()
    }
    
    func setupWebView() {
        showWebView(isHidden: true, duration: 0)
        goHome()
        wvTest.uiDelegate = self
        wvTest.navigationDelegate = self
    }
    
    func checkWebViewButtons() {
        btnBack.isEnabled = wvTest.canGoBack
        btnForward.isEnabled = wvTest.canGoForward
    }
    
    func showWebView(isHidden: Bool, duration: Double) {
        //https://eastjohntech.blogspot.com/2019/12/closure-self.html   closure에서는 왜 self를 사용해야 할까?
        //https://jusung.gitbook.io/the-swift-language-guide/language-guide/07-closures closure
        //https://greenchobo.tistory.com/3 [Swift] Closure에서 weak self 의 사용

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
    
    @IBAction func backButtonTouched(_ sender: Any) {
        if wvTest.canGoBack {
            wvTest.goBack()
        }
    }
    
    @IBAction func forwardButtonTouched(_ sender: Any) {
        if wvTest.canGoForward {
            wvTest.goForward()
        }
    }
    
    @IBAction func refreshButtonTouched(_ sender: Any) {
        wvTest.reload()
    }
    
    @IBAction func homeButtonTouched(_ sender: Any) {
        goHome()
    }
    
    func goHome() {
        if let url = URL(string: mainUrl) {
            let request = URLRequest(url: url)
            wvTest.load(request)
        }
    }
}


extension WebKitViewController: WKUIDelegate {
    func webViewDidClose(_ webView: WKWebView) {  }
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {  }
//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//        NSLog("createWebViewWith :\(navigationAction)")
//       popupWebView = WKWebView(frame: webView.bounds, configuration: configuration)
//       popupWebView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//       popupWebView?.navigationDelegate = self
//       popupWebView?.uiDelegate = self
//       view.addSubview(popupWebView!)
//       return popupWebView!
//    }
}

extension WebKitViewController: WKNavigationDelegate {
    
    //이 메소드가 불려지는 시점은 내가 가고 있는 목적지는 알고 있지만, 아직 가지 않은 상태이고 여기서 이동 허가를 하게 된다면 이동이 되어진다.
    // navigationAction : 다음에 로드 될 페이지의 정보? 라고 생각하면 쉬울 것이다.
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        NSLog("decidePolicyFor \(navigationAction.request.url!)")
        if let url = navigationAction.request.url {
            if url.absoluteString.contains("https://naverapp.m.naver.com/?urlScheme=naversearchapp") {
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }
    
    // 안착 된 후에 페이지 로드 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("didCommit \(webView.url!)")
    }
    
    //메인 프레임에 안착 될 때
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("didStartProvisionalNavigation \(webView.url!)")
        checkWebViewButtons()
    }
    
    //페이지 로드가 완료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("didFinish \(webView.url!)")
        checkWebViewButtons()
    }
    
    //로드 중 에러
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        NSLog("didFail \(error)")
    }
}
