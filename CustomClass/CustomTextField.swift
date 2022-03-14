import UIKit

/// This Custom Class is used for giving Padding for TextField From the top, left, bottom and right

class CustomTextField: UITextField {
    
    //MARK: - Variable
    let padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 20)
    
    //MARK: - override Methods
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}// End of Class
