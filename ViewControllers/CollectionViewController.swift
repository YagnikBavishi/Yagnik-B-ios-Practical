import UIKit

class CollectionViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    let reuseIdentifier = "cell"
    var items = ["GoogleLogoImage", "GoogleLogoImage", "GoogleLogoImage", "GoogleLogoImage","GoogleLogoImage", "GoogleLogoImage", "GoogleLogoImage", "GoogleLogoImage"]
    var oldValue: Double = Double(Constant.ZERO)
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.value = Double(items.count)
        oldValue = Double(items.count)
    }
    
    //MARK: - Actions
    @IBAction func addImage(_ sender: UIStepper) {
        if(sender.value >  oldValue) {
            oldValue = oldValue + Double(Constant.ONE)
            items.append("GoogleLogoImage")
            collectionView.reloadData()
        } else {
            oldValue = oldValue - Double(Constant.ONE)
            items.removeLast()
            collectionView.reloadData()
        }
    }
    
}//End of Class

//MARK: - UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.imgCollectionViewItem?.image = UIImage(named: "GoogleLogoImage")
        return cell
    }
    
}// End of Extension
