//
//  RootViewController.swift
//  PageVCTemplate
//
//  Created by Thang Truong on 6/5/17.
//  Copyright © 2017 Thang Truong. All rights reserved.
//

import UIKit

class RootViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    var currentViewController: UIViewController? {
        return viewControllers?[0]
    }
    var index : Int {
        guard currentViewController != nil else {
            return NSNotFound
        }
        return modelController.indexOfViewController(currentViewController!)
    }
    
    var scrollView: UIScrollView! {
        if _scrollView == nil {
            for view in self.view.subviews {
                if(view is UIScrollView) {
                    _scrollView = (view as! UIScrollView)
                }
            }
        }
        
        return _scrollView
    }
    
    var startViewControllerIndex = 0
    
    private var _scrollView: UIScrollView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Configure the page view controller and add it as a child view controller.
        delegate = self
        dataSource = modelController
        if let startingViewController: UIViewController = self.modelController.viewControllerAtIndex(startViewControllerIndex) {
            
            let viewControllers = [startingViewController]
            setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var modelController = BaseModelController()
    
    // MARK: - UIPageViewController delegate methods
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
    }
    
    func next() {
        jump(toIndex: index + 1)
    }
    
    func previous() {
        jump(toIndex: index - 1)
    }
    
    func jump(toIndex: Int, animated: Bool = true) {
        guard toIndex != NSNotFound && toIndex >= 0 else {
            return
        }
        let direction : UIPageViewControllerNavigationDirection = toIndex > index ? .forward : .reverse
        if let viewController = modelController.viewControllerAtIndex(toIndex) {
            self.setViewControllers([viewController], direction: direction , animated: true, completion: {done in })
        }
    }
}
