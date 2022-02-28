import UIKit

class TableViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UISearchBar!
    @IBOutlet var headerView: UIView!
    @IBOutlet var footerView: UIView!
    @IBOutlet weak var lblHeaderView: UILabel!
    @IBOutlet weak var lblFooterView: UILabel!
    @IBOutlet weak var imgForHeader: UIImageView!
    
    //MARK: - Variables
    var stringArray = ["C Language", "C++ Language", "Java Language", "Python Language", "Swift Language", "Facebook", "Google","Python Language", "Swift Language", "Facebook", "Google"]
    let refreshControl = UIRefreshControl()
    var filteredData: [String] = []

    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        addPullToRefresh()
        addDataIntoHeaderAndFooter()
    }
    
}//End of Class

//MARK: - File Private Functions
extension TableViewController {
    
    fileprivate func addPullToRefresh() {
        tableView.register(UINib(nibName: "IndexTableViewCell", bundle: nil), forCellReuseIdentifier: "IndexTableViewCell")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        searchView.delegate = self
        filteredData = stringArray
    }
    
    @objc fileprivate func refresh(_ sender: AnyObject) {
        tableView.layer.borderColor = UIColor.black.cgColor
        tableView.layer.borderWidth = 2
        refreshControl.endRefreshing()
    }

    fileprivate func addDataIntoHeaderAndFooter() {
        headerView.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50)
        footerView.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50)
        lblHeaderView.text = "Section - 1"
        lblFooterView.text = "End of Section - 1"
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
    }
    
}//End of Extension

//MARK: - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constant.ONE
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IndexTableViewCell") as? IndexTableViewCell else {
            return UITableViewCell()
        }
        cell.imgItem?.image = UIImage(named: "GoogleLogoImage")
        cell.lblIndex.text = filteredData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}// End of Extension

//MARK: - UISearchBarDelegate
extension TableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? stringArray : stringArray.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        tableView.reloadData()
    }
    
}// End of extension
