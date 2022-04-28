import UIKit

class AllComponentsViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var collectionView: UIView!
      
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.alpha = CGFloat(Constant.ZERO)
        collectionView.alpha = CGFloat(Constant.ONE)
    }
    
    //MARK: - Actions
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentedControlActionChanged(sender: AnyObject) {
        switch(sender.selectedSegmentIndex) {
        case 0:
            tableView.alpha = CGFloat(Constant.ZERO)
            collectionView.alpha = CGFloat(Constant.ONE)
        case 1:
            tableView.alpha = CGFloat(Constant.ONE)
            collectionView.alpha = CGFloat(Constant.ZERO)
        default:
            break
        }
    }
    
}//End of class
