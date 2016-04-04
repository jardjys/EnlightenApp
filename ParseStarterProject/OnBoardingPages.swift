//
//  OnBoardingPages.swift
//  Enlighten
//
//  Created by Juan Andrés Rocha Díaz on 17/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class OnBoardingPages: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                direction: .Forward,
                animated: true,
                completion: nil)
        }
        
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController("First"),
            self.newColoredViewController("Second"),
            self.newColoredViewController("Third")]
    }()
    
    private func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewControllerWithIdentifier("\(color)VC")
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
            
            guard previousIndex >= 0 else {
                return nil
            }
            
            guard orderedViewControllers.count > previousIndex else {
                return nil
            }
            
            return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count
            
            guard orderedViewControllersCount != nextIndex else {
                return nil
            }
            
            guard orderedViewControllersCount > nextIndex else {
                return nil
            }
            
            return orderedViewControllers[nextIndex]
    }
}

extension OnBoardingPages : UIPageViewControllerDataSource{
    
    /*func pageViewController(pageViewController: UIPageViewController,
    viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController,
    viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    return nil
    }*/
    
    
    
}
