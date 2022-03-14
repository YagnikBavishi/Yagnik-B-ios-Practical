import UIKit

class PageViewController: UIPageViewController {
    
    //MARK: - Variables
    lazy var viewControllerList: [UIViewController] = {
        let storyboard = UIStoryboard(name: "UIComponentsStoryboard", bundle: nil)
        let firstViewController = storyboard.instantiateViewController(withIdentifier:"UIComponentsSignUpViewController")
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "UIComponentsLoginViewController")
        return [firstViewController, secondViewController]
    } ()
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let viewController = viewControllerList.first {
            self.setViewControllers([viewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
}// End of Class

//MARK: - UIPageViewControllerDataSource
extension PageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllerList.lastIndex(of: viewController) else {
            return nil
        }
        let previousIndex = index - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard previousIndex < viewControllerList.count else {
            return nil
        }
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllerList.lastIndex(of: viewController) else {
            return nil
        }
        let previousIndex = index + 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard previousIndex < viewControllerList.count else {
            return nil
        }
        return viewControllerList[previousIndex]
    }
    
}// End of Extension
