import UIKit

class StackViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tfForDate: UITextField!
    
    //MARK: - Variables
    let dateFormatter = DateFormatter()
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        addInitialData()
    }
    
    //MARK: - Actions
    @IBAction func changeTheOrientation(_ sender: UISwitch) {
        switchButton.isOn ? (stackView.axis = .horizontal) : (stackView.axis = .vertical)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        tfForDate.text = dateFormatter.string(from: sender.date)
    }
    
}// End of class

//MARK: - File Private Functions
extension StackViewController {
    
    fileprivate func  addInitialData() {
        dateFormatter.dateFormat = "MM/dd/yyyy"
        datePicker.datePickerMode = .date
        tfForDate.text = dateFormatter.string(from: datePicker.date)
    }
    
}// End of Extension
