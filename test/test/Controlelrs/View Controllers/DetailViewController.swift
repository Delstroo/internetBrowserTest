//
//  DetailViewController.swift
//  test
//
//  Created by Delstun McCray on 4/26/22.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {
    
    var organicQuestion: OrganicQuestions?
        let webView = WKWebView()

        override func viewDidLoad() {
            super.viewDidLoad()
            guard let organicResult = organicQuestion else { return }

            
            webView.frame = view.bounds
            webView.navigationDelegate = self

            let url = URL(string: organicResult.link ?? "")!
            let urlRequest = URLRequest(url: url)

            webView.load(urlRequest)
            webView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
            view.addSubview(webView)
        }

    @objc(webView:decidePolicyForNavigationAction:decisionHandler:) func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if navigationAction.navigationType == .linkActivated  {
                if let url = navigationAction.request.url,
                    let host = url.host, !host.hasPrefix("www.google.com"),
                    UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                    print(url)
                    print("Redirected to browser. No need to open it locally")
                    decisionHandler(.cancel)
                    return
                } else {
                    print("Open it locally")
                    decisionHandler(.allow)
                    return
                }
            } else {
                print("not a user click")
                decisionHandler(.allow)
                return
            }
        }
    }
