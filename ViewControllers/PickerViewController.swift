import UIKit
import MapKit

class PickerViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var map: MKMapView!
    
    //MARK: - Variables
    var locationArray = ["ahmedabad", "surat", "amreli", "rajkot", "mumbai"]
    var allLocationLatitudeAndLongitude: [CLLocationCoordinate2D] = []
    let centerLocation = CLLocation(latitude: 23.0225, longitude: 72.5714)
    let regionRadious = Constant.TENTHOUSAND
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        addLatitudeAndLogitude()
    }
    
}// End of class

//MARK: - File Private Functions
extension PickerViewController {
    
    fileprivate func addLatitudeAndLogitude() {
        centreMap(location: centerLocation)
        allLocationLatitudeAndLongitude.append(CLLocationCoordinate2D(latitude: 23.0225, longitude: 72.5714))
        allLocationLatitudeAndLongitude.append(CLLocationCoordinate2D(latitude: 21.1702, longitude: 72.8311))
        allLocationLatitudeAndLongitude.append(CLLocationCoordinate2D(latitude: 21.6015, longitude: 71.2204))
        allLocationLatitudeAndLongitude.append(CLLocationCoordinate2D(latitude: 22.3039, longitude: 70.8022))
        allLocationLatitudeAndLongitude.append(CLLocationCoordinate2D(latitude: 19.0760, longitude: 72.8777))
    }
    
    fileprivate func centreMap(location: CLLocation){
        let region = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: CLLocationDistance(Constant.TENTHOUSAND), longitudinalMeters: CLLocationDistance(Constant.TENTHOUSAND))
        map.setRegion(region, animated: true)
    }
    
    fileprivate func setPinUsingMKPointAnnotation(location: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        let selectedAnnotation = map.annotations
        
        for annotation in selectedAnnotation {
            map.removeAnnotation(annotation)
        }
        
        annotation.coordinate = location
        annotation.title = "Here"
        annotation.subtitle = "Device Location"
        let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: CLLocationDistance(Constant.TENTHOUSAND), longitudinalMeters: CLLocationDistance(Constant.TENTHOUSAND))
        map.setRegion(coordinateRegion, animated: true)
        map.addAnnotation(annotation)
    }
    
}// End of Extension

//MARK: - UIPickerViewDataSource
extension PickerViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constant.ONE
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setPinUsingMKPointAnnotation(location: allLocationLatitudeAndLongitude[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationArray.count
    }
    
}// End of Extension

//MARK: - UIPickerViewDelegate
extension PickerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationArray[row]
    }
    
}// End of Extension

