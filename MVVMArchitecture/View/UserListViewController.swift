//
//  UserListViewController.swift
//  iOSPracticals
//
//  Created by Yagnik Bavishi on 14/04/22.
//

import UIKit

class UserListViewController: UIViewController, Storyboarded {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var btnLogout: UIButton!
    
    // MARK: - Variables
    var coordinator: ArchitectureCoordinator?
    var userListModelClass = UserListViewModel()
    var fetchedStudentData = [UserData]()
    let userDefaults = UserManager()

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        bindData()
    }
    
    // MARK: - File Private Functions
    fileprivate func initialSetUp() {
        self.navigationItem.hidesBackButton = true
        activityIndicator.startAnimating()
        btnLogout.layer.masksToBounds = true
        btnLogout.layer.cornerRadius = CGFloat(Constant.TWENTY_FIVE)
        tableView.dataSource = self
        tableView.delegate = self
        registerCell()
        userListModelClass.getUserData()
    }
    
    fileprivate func registerCell() {
        tableView.register(UINib(nibName: "IndexTableViewCell", bundle: nil), forCellReuseIdentifier: "IndexTableViewCell")
    }
    
    fileprivate func bindData() {
        userListModelClass.error = { [weak self] in
            guard let self = self else {
                return
            }
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            Alerts.customAlert(message: "Data Loaded Error", body: "Data is not Loaded", viewController: self)
        }
        userListModelClass.studentData = { [weak self] data in
            guard let self = self else {
                return
            }
            self.fetchedStudentData = data
        }
        userListModelClass.dataLoaded = { [weak self] in
            guard let self = self else {
                return
            }
            self.tableView.reloadData()
        }
    }

    // MARK: - Actions
    @IBAction func logoutButtonAction(_ sender: UIButton) {
        userDefaults.isUserLogin = false
        coordinator?.backToMVVMArchitecture()
    }
    
}// End of class

// MARK: - UITableViewDataSource
extension UserListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  fetchedStudentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IndexTableViewCell") as? IndexTableViewCell else {
            return UITableViewCell()
        }
        cell.lblIndex.text = self.fetchedStudentData[indexPath.row].firstName + " " +  self.fetchedStudentData[indexPath.row].lastName
        if let url = URL(string: fetchedStudentData[indexPath.row].avatar) {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.layer.masksToBounds = true
                    cell.imgItem.layer.cornerRadius = cell.imgItem.frame.height / 2
                    cell.imgItem.image = UIImage(data: data)
                }
            }
        }
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        return cell
    }
    
}// End of Extension

// MARK: - UITableViewDelegate
extension UserListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constant.CELL_HEIGHT)
    }
    
}// End of Extension
