//
//  ViewController.swift
//  simple-web-view
//
//  Created by Fuka Takashima on 2025/09/05.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: URL(string: "https://game.granbluefantasy.jp/")!)
        webView.load(request)
        webView.isInspectable = true

    }

    @IBAction func inputUrlAlert() {
        let alertController = UIAlertController(
            title:"Enter URL",
            message:"Enter the URL to open in WebView.",
            preferredStyle: UIAlertController.Style.alert
        )
        alertController.addTextField()
        let openButton = UIAlertAction(title: "Open", style: UIAlertAction.Style.default) {(action:UIAlertAction) in
            if let textField = alertController.textFields?.first {
                guard let url = URL(string: textField.text!) else {
                    // invalid url
                    return
                }
                self.webView.load(URLRequest(url: url))
            }
        }
        alertController.addAction(openButton)

        let cancelButton = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler:nil)
        alertController.addAction(cancelButton)

        present(alertController, animated:true, completion: nil)

    }

}

