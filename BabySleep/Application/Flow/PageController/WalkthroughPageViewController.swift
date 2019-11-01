//
//  PageController.swift
//  BabySleep
//
//  Created by Denis Abramov on 26.10.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit


class WalkthroughPageViewController: UIPageViewController,
                                     UIPageViewControllerDelegate,
                                     UIPageViewControllerDataSource {
    
    var pageControl = UIPageControl()
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVC(viewController: "Blue"),
                self.newVC(viewController: "Red")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        configurePageControl()
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(
            frame: CGRect(
                x: 0, y: UIScreen.main.bounds.maxY - 50,
                width: UIScreen.main.bounds.width,
                height: 50
            )
        )
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
        
        func newVC(viewController: String) -> UIViewController {
            return UIViewController(
                nibName: "WalkthroughViewController", bundle: nil
            )
        }
        
        func pageViewController(_ pageViewController: UIPageViewController,
                                didFinishAnimating finished: Bool,
                                previousViewControllers: [UIViewController],
                                transitionCompleted completed: Bool) {
            let pageContentViewController = pageViewController.viewControllers![0]
            self.pageControl.currentPage = orderedViewControllers.firstIndex(
                of: pageContentViewController)!
        }
        
        func pageViewController(_ pageViewController: UIPageViewController,
                                viewControllerBefore
            viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.firstIndex(
                of: viewController) else {
                    return nil
            }
            let previousIndex = viewControllerIndex - 1
            
            guard previousIndex >= 0 else {
                return orderedViewControllers.last
            }
            
            guard orderedViewControllers.count > previousIndex else {
                return nil
            }
            return orderedViewControllers[previousIndex]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController,
                                viewControllerAfter
            viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.firstIndex(
                of: viewController) else {
                    return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count
            
            guard orderedViewControllersCount != nextIndex else {
                return orderedViewControllers.first
            }
            
            guard orderedViewControllersCount > nextIndex else {
                return nil
            }
            
            return orderedViewControllers[nextIndex]
        }
}
