import UIKit
import Alamofire

class TableViewWithApiCallViewController: UIViewController, Storyboarded {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAddUser: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables
    var coordinator: AuthenticationCoordinator?
    var fetchedStudentData = [UserData]()
    var message: String?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    //MARK: - File Private Functions
    fileprivate func initialSetUp() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(logoutAction))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0/255.0, green: 117/255.0, blue: 227/255.0, alpha: 1)
        activityIndicator.startAnimating()
        btnAddUser.layer.masksToBounds = true
        btnAddUser.layer.cornerRadius = CGFloat(Constant.TWENTY_FIVE)
        tableView.register(UINib(nibName: "IndexTableViewCell", bundle: nil), forCellReuseIdentifier: "IndexTableViewCell")
        message == "Alamofire" ? getDataUsingAlamofire() : getDataUsingURLSession()
    }
    
    @objc fileprivate func logoutAction() {
        coordinator?.backToLoginScreen()
    }
    
    fileprivate func getDataUsingURLSession() {
        self.title = "URL Session"
        fetchedStudentData = []
        btnAddUser.isHidden = true
        if let url = URL(string: "https://reqres.in/api/users?delay=3") {
            let urlRequest = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, urlResponse, error) in
                guard let responseData = data else {
                    return
                }

                if let error = error {
                    Alerts.customAlert(message: "Unsuccess", body: "\(error.localizedDescription)", viewController: self ?? UIViewController())
                }
                do {
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode(ListOfUser.self, from: responseData)
                    for index in userResponse.data {
                        self?.fetchedStudentData.append(UserData(id: index.id, email: index.email, firstName: index.firstName, lastName: index.lastName, avatar: index.avatar))
                    }
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                } catch let error {
                    Alerts.customAlert(message: "Unsuccess", body: "\(error.localizedDescription)", viewController: self ?? UIViewController())
                }
            }
            dataTask.resume()
        }
    }
    
    fileprivate func getDataUsingAlamofire() {
        self.title = "Alamofire"
        fetchedStudentData = []
        if let url = URL(string: "https://reqres.in/api/users") {
            AlamofireRequest.alamofireRequest(withURl: url, httpMethod: .get, withParameter: nil, decodingType: ListOfUser.self, withEncoding: URLEncoding.default) { [weak self] (responseData) in
                if let responseData = responseData {
                    for index in responseData.data {
                        self?.fetchedStudentData.append(UserData(id: index.id, email: index.email, firstName: index.firstName, lastName: index.lastName, avatar: index.avatar))
                    }
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    fileprivate func addUser(_ name: String, _ job: String) {
        if let url = URL(string: "https://reqres.in/api/users") {
            let parameter = ["name": name, "job": job]
            AF.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { [weak self] (response) in
                switch response.result {
                case .success(let responseData):
                    guard let userData = responseData else {
                        return
                    }
                    do {
                        let json = try JSONSerialization.jsonObject(with: userData, options: [])
                        Alerts.customAlert(message: "Success", body: "\(json)", viewController: self ?? UIViewController())                        
                    } catch let error {
                        Alerts.customAlert(message: "Unsuccess", body: "\(error.localizedDescription)", viewController: self ?? UIViewController())
                    }
                case .failure(let error):
                    Alerts.customAlert(message: "Unsuccess", body: "\(error.localizedDescription)", viewController: self ?? UIViewController())
                }
            }
        }
    }
    
    //MARK: - Actions
    @IBAction func addUserAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add User", message: "Enter User Name and Job", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter User Name"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Job"
        }
        
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { [weak alert] (_) in
            var  userName: String?
            var userJob: String?
            var textField = alert?.textFields?[Constant.ZERO]
            textField = alert?.textFields?[Constant.ZERO]
            userName = textField?.text
            textField = alert?.textFields?[Constant.ONE]
            userJob = textField?.text
            if let name = userName, let job = userJob {
                if name.isEmpty {
                    userName = "morpheus"
                }
                if job.isEmpty {
                    userJob = "leader"
                }
            }
            self.addUser(userName ?? "morpheus", userJob ?? "leader")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}// End of Class
//MARK: - UITableViewDataSource
extension TableViewWithApiCallViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constant.ONE
    }
    
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
//MARK: - UITableViewDelegate
extension TableViewWithApiCallViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constant.CELL_HEIGHT)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = fetchedStudentData[indexPath.row].id
        coordinator?.startDisplaySingleUserDataViewController(id: id)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}// End of Extension
