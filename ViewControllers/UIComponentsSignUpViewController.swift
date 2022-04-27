import UIKit

class UIComponentsSignUpViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var tvBio: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnchangeProfile: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables
    let progress = Progress(totalUnitCount: Int64(Constant.FIVE))
    var activeTextField : UITextView? = nil
    let viewController = UIImagePickerController()
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addValuesForOutLet()
    }
    
    // MARK: - File Private Functions
    fileprivate func addValuesForOutLet() {
        self.hideKeyboardWhenTapAround()
        tvBio.layer.borderColor = UIColor.black.cgColor
        tvBio.layer.borderWidth = CGFloat(Constant.ONE)
        tvBio.addDoneButtonOnKeyboard()
        progressView.layer.cornerRadius = 10
        imgProfile.layer.borderWidth = 1
        imgProfile.layer.borderColor = UIColor.black.cgColor
        imgProfile.layer.cornerRadius = imgProfile.frame.height / 2
        btnchangeProfile.titleLabel?.font =  UIFont(name: "Times New Roman", size: CGFloat(Constant.TWNTYTWO))
    }
    
    fileprivate func validateFields() -> String? {
        if let email = tfEmail.text, let password = tfPassword.text {
            if((email.isEmpty)) {
                return "Email is Empty"
            } else if (!(email.contains(".")) || !(email.contains("@"))) {
                return "Wrong email"
            } else if((password.isEmpty)) {
                return "Password is Empty"
            } else if(tvBio.text.isEmpty) {
                return "Bio is Empty"
            } else if (sliderView.value == 0.0) {
                return "Age is required"
            }
            return nil
        }
        return nil
    }
    
    //MARK: - Actions
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        lblAge.text = "Age: \(Int(sender.value))"
    }
    
    @IBAction func maleRadioButton(_ sender: UIButton) {
        btnMale.isSelected = sender.tag == Constant.TWO ? true : false
        btnFemale.isSelected = sender.tag == Constant.TWO ? true : false
    }
    
    @IBAction func btnSubmitClick(_ sender: UIButton) {
        if let response = validateFields() {
            Alerts.customAlert(message: response, body:"" , viewController: self)
        } else {
            activityIndicator.startAnimating()
            UIView.animate(withDuration: 5.0) {
                self.progressView.setProgress(1.0, animated: true)
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5.0) {
                self.activityIndicator.stopAnimating()
                self.performSegue(withIdentifier: "tabView", sender: self)
            }
        }
    }
    
    @IBAction func changeProfile(_ sender: UIButton) {
        viewController.sourceType = .photoLibrary
        viewController.delegate = self
        viewController.allowsEditing = false
        present(viewController, animated: true)
    }

} // End of Class

//MARK: -  UITextFieldDelegate
extension UIComponentsSignUpViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("TextField should end editing method called")
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.tfEmail:
            self.tfPassword.becomeFirstResponder()
        case self.tfPassword:
            self.tvBio.becomeFirstResponder()
        default:
            self.tvBio.resignFirstResponder()
        }
        return true
    }

}// End of Extension

//MARK: - UITextViewDelegate
extension UITextView: UITextViewDelegate {
    
    func addDoneButtonOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self, action: #selector(resignFirstResponder))
        keyboardToolbar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = keyboardToolbar
    }
    
}// End of Extension

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension UIComponentsSignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            imgProfile.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}// End of Extension

