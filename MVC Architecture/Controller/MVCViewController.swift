//
//  MVCViewController.swift
//  iOSPracticals
//
//  Created by Yagnik Bavishi on 12/04/22.
//

import UIKit
import Alamofire

class MVCViewController: UIViewController, Storyboarded {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var coordinator: ArchitectureCoordinator?
    var fetchedData = [DataModel]()

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    //MARK: - File Private Functions
    fileprivate func initialSetUp() {
        tableView.dataSource = self
        tableView.delegate = self
        registerCell()
        getData()
    }
    
    fileprivate func registerCell(){
        tableView.register(UINib(nibName: "RSSTableViewCell", bundle: nil), forCellReuseIdentifier: "RSSTableViewCell")
    }
    
    fileprivate func getData() {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
            AlamofireRequest.alamofireRequest(withURl: url, httpMethod: .get, withParameter: nil, withEncoding: URLEncoding.default) { [weak self] (responseData) in
                guard let self = self else {
                    return
                }
                if let userData = responseData {
                    do {
                        let decoder = JSONDecoder()
                        let userResponse = try decoder.decode([DataModel].self, from: userData)
                        for index in userResponse {
                            self.fetchedData.append(DataModel(userId: index.userId, id: index.id , title: index.title, body: index.body))
                        }
                        self.tableView.reloadData()
                    } catch {
                        Alerts.customAlert(message: "Data Loaded Error", body: "Data is not Loaded", viewController: self)
                    }
                }
            }
        }
    }
    
}// End of class

//MARK: - UITableViewDataSource
extension MVCViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RSSTableViewCell") as? RSSTableViewCell else {
            return UITableViewCell()
        }
        
        cell.lblTitle.text = self.fetchedData[indexPath.row].title
        return cell
    }
    
}// End of Extension

//MARK: -  UITableViewDelegate
extension MVCViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constant.CELL_HEIGHT)
    }
    
}// End of Extension
