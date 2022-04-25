//
//  ArchitectureViewController.swift
//  iOSPracticals
//
//  Created by Yagnik Bavishi on 13/04/22.
//

import UIKit

class ArchitectureViewController: UIViewController,Storyboarded {

    // MARK: - Variables
    var coordinator: ArchitectureCoordinator?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    //MARK: - File Private Functions
    func initialSetUp() {
        if let navController = self.navigationController {
            coordinator = ArchitectureCoordinator(navController)
        }
    }
    
    // MARK: - Actions
    @IBAction func btnBackAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startMVCArchitecture(_ sender: UIButton) {
        coordinator?.goToMVCArchitecture()
    }
    
    @IBAction func startMVPArchitecture(_ sender: UIButton) {
        coordinator?.goToMVPArchitecture()
    }
    
    @IBAction func startMVVMArchitecture(_ sender: UIButton) {
        coordinator?.start()
    }
    
}// End of Class
