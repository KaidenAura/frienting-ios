//
//  TutorialPageViewController.swift
//  Frienting
//
//  Created by 신영환 on 2018. 7. 28..
//  Copyright © 2018년 신영환. All rights reserved.
//

import UIKit


class TutorialPageViewController: UIPageViewController, UIPageViewControllerDelegate {

    var pageImages = ["img01", "img02", "img03", "img04"]
    var index = 0
    var pageControl = UIPageControl()
    
    func configurePageControl(){
        pageControl = UIPageControl(frame: CGRect(x:0, y : UIScreen.main.bounds.maxY - 50, width : UIScreen.main.bounds.width, height : 50))
        pageControl.numberOfPages = pageImages.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let startTutorialVC = self.viewControllerAtIndex(index: 0){
        print(startTutorialVC.imageFileName)
        print(startTutorialVC.pageIndex)
        setViewControllers( [startTutorialVC] , direction: .forward, animated: true, completion: nil)
        }
        self.delegate = self
        configurePageControl()
        // Do any additional setup after loading the view.
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    
    func viewControllerAtIndex(index : Int) -> TutorialContentViewController? {
        if (index == NSNotFound || index < 0 || index >= self.pageImages.count){
            return nil
        }
        if let tutorialContentViewController = storyboard?.instantiateViewController(withIdentifier : "TutorialContentViewController") as? TutorialContentViewController{
            
            tutorialContentViewController.imageFileName = pageImages[index]
            tutorialContentViewController.pageIndex = index
            //print(index, pageControl.currentPage)
            
            return tutorialContentViewController
        }
        return nil
    }

}

extension TutorialPageViewController : UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! TutorialContentViewController).pageIndex
        index = index - 1
        pageControl.currentPage = pageControl.currentPage - 1
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! TutorialContentViewController).pageIndex
        index = index+1
        pageControl.currentPage = pageControl.currentPage + 1
        return self.viewControllerAtIndex(index: index)
    }
   
}
