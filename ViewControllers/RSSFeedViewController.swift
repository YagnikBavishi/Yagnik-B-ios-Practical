import UIKit
import Alamofire
import AlamofireRSSParser

class RSSFeedViewController: UIViewController, Storyboarded {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables
    var coordinator: AuthenticationCoordinator?
    var newsData = [itemData]()
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    //MARK: - File Private Functions
    func initialSetUp() {
        activityIndicator.startAnimating()
        tableView.register(UINib(nibName: "RSSTableViewCell", bundle: nil), forCellReuseIdentifier: "RSSTableViewCell")
        if let url = URL(string: "https://developer.apple.com/news/rss/news.rss") {
            newsData = []
            AF.request(url).responseRSS { [weak self] (response) in
                switch response.result {
                case .success(let feed):
                    print("feed...\(feed)")
                    for index in feed.items {
                        self?.newsData.append(itemData(title: index.title, pubDate: index.pubDate))
                    }
                    self?.tableView.reloadData()
                    break
                case .failure(let error):
                    print("error in rss....\(error)")
                }
            }
        }
    }
    
}// End of Class

//MARK: - UITableViewDataSource
extension RSSFeedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constant.ONE
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RSSTableViewCell") as? RSSTableViewCell else {
            return UITableViewCell()
        }
        cell.lblTitle.text = newsData[indexPath.row].title
        if let pubDate = newsData[indexPath.row].pubDate {
            cell.lblPublishDate.text =  "\(String(describing: pubDate))"

        }
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        return cell
    }
    
}// End of Extension

//MARK: - UITableViewDelegate
extension RSSFeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constant.CELL_HEIGHT)
    }
    
}// End of Extension
