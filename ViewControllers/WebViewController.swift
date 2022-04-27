import UIKit
import WebKit

class WebViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var btnBack: UIBarButtonItem!
    
    //MARK: - Variables
    let url = URL(string: "https://www.google.com/")!
   
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        webView.load(URLRequest(url: url))
    }

    //MARK: - Actions
    @IBAction func rewindButtonAction(sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func forwardAction(sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    @IBAction func searchButton(_ sender: Any) {
        guard let pdfURL = Bundle.main.url(forResource: "AboutiOS", withExtension: ".pdf") else {
            return
        }
        webView.loadFileURL(pdfURL, allowingReadAccessTo: pdfURL.deletingLastPathComponent())
    }
    
}// End of class
