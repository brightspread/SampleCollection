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
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnForward: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
    }
    
    func initializeUI() {
        setupWebView()
        checkWebViewButtons()
    }
    
    func setupWebView() {
        showWebView(isHidden: true, duration: 0)
        wkTest.load(URLRequest(url: URL(string: "https://naver.com")!))
        
        wkTest.navigationDelegate = self
        wkTest.uiDelegate = self
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
    
    @IBAction func webviewButtonTouched(_ sender: Any) {
        showWebView(isHidden: false, duration: 1)
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        showWebView(isHidden: true, duration: 1)
    }
    
    @IBAction func backButtonTouched(_ sender: Any) {
        if wkTest.canGoBack {
            wkTest.goBack()
        }
    }

    @IBAction func forwardButtonTouched(_ sender: Any) {
        if wkTest.canGoForward {
            wkTest.goForward()
        }
    }
    
    @IBAction func reloadButtonTouched(_ sender: Any) {
        wkTest.reload()
    }
    
    @IBAction func homtButtonTouched(_ sender: Any) {
        wkTest.load(URLRequest(url: URL(string: "https://naver.com")!))
    }
    
    func checkWebViewButtons() {
        btnBack.isEnabled = wkTest.canGoBack
        btnForward.isEnabled = wkTest.canGoForward
    }
}

extension SampleWebKitViewController: WKNavigationDelegate {
    //이 메소드가 불려지는 시점은 내가 가고 있는 목적지는 알고 있지만, 아직 가지 않은 상태이고 여기서 이동 허가를 하게 된다면 이동이 되어진다.
    // navigationAction : 다음에 로드 될 페이지의 정보? 라고 생각하면 쉬울 것이다.
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        NSLog("decidePolicyFor \(navigationAction.request.url!)")
        if let url = navigationAction.request.url {
            if url.absoluteString.contains("naversearchapp") {
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }
    
    // 메인 프레임에 안착 될 때
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("didStartProvisionalNavigation \(webView.url!)")
    }
    
    // 안착 된 후에 페이지 로드 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("didCommit \(webView.url!)")
    }
    
    // 페이지 로드가 완료됐을 때
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("didFinish \(webView.url!)")
        checkWebViewButtons()
    }
    
    // 페이지 로딩 실패
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        NSLog("didFail \(webView.url!)")
    }
}

extension SampleWebKitViewController: WKUIDelegate {
    // 새창열기
//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//    }
//    
//    func webViewDidClose(_ webView: WKWebView) {
//    }
//
//    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
//    }
}

