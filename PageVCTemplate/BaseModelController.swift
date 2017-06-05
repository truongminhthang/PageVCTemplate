//
//  BaseModelController.swift
//  PageVCTemplate
//
//  Created by Thang Truong on 6/5/17.
//  Copyright © 2017 Thang Truong. All rights reserved.
//

import UIKit

class BaseModelController: NSObject, UIPageViewControllerDataSource {
    
    var viewcontrollers: [UIViewController] = {
        let dateFormatter = DateFormatter()
        let pageData = dateFormatter.monthSymbols
        return pageData!.map{ data in
            let dataViewController = DataViewController.instance
            dataViewController.dataObject = data
            return dataViewController
            }
    }()
    var index = 0
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        // Return the data view controller for the given index.
        if (self.viewcontrollers.count == 0) || (index >= self.viewcontrollers.count) || (index < 0) {
            return nil
        }
        self.index = index
        
        return viewcontrollers[index]
    }
    
    func indexOfViewController(_ viewController: UIViewController) -> Int {
        return viewcontrollers.index(of: viewController) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.viewcontrollers.count {
            return nil
        }
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewcontrollers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return index
    }
}
