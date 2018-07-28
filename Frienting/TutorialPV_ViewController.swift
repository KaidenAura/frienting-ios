//
//  TutorialPV_ViewController.swift
//  Frienting
//
//  Created by 신영환 on 2018. 7. 21..
//  Copyright © 2018년 신영환. All rights reserved.
//

import UIKit

class TutorialPV_ViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var VCArr : [UIViewController] = {
        return [self.VCInstance(name:"First"),
                self.VCInstance(name:"Second"),]
    }()
    
    private func VCInstance(name : String ) -> UIViewController{
        return UIStoryboard(name : "Main", bundle : nil).instantiateViewController(withIdentifier : name)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            }
            else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArr.index(of:viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return VCArr.last
        }
        
        guard VCArr.count > previousIndex else {
            return nil
        }
        
        return VCArr[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = VCArr.index(of:viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex - 1
        guard nextIndex < VCArr.count else {
            return VCArr.first
        }
        
        guard VCArr.count > nextIndex else {
            return nil
        }
        
        return VCArr[nextIndex]
    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let firstVC = VCArr.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArr.count
    }
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCArr.index(of:firstViewController) else {
            return 0
            
        }
    }
    

}
