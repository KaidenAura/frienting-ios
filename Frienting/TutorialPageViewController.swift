//
//  TutorialPageViewController.swift
//  Frienting
//
//  Created by 신영환 on 2018. 7. 28..
//  Copyright © 2018년 신영환. All rights reserved.
//

import UIKit


class TutorialPageViewController: UIPageViewController {

    var pageImages = ["img01", "img02", "img03", "img04"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let startTutorialVC = self.viewControllerAtIndex(index: 0){
        print(startTutorialVC.imageFileName)
        print(startTutorialVC.pageIndex)
           setViewControllers([startTutorialVC], direction: .forward, animated: true, completion: nil)
        }
        
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
    
    func nextPageWithIndex(index : Int){
        
    }
    
    func viewControllerAtIndex(index : Int) -> TutorialContentViewController? {
        if (index == NSNotFound || index < 0 || index >= self.pageImages.count){
            return nil
        }
        if let tutorialContentViewController = storyboard?.instantiateViewController(withIdentifier : "TutorialContentViewController") as? TutorialContentViewController{
            print("did!")
            print(pageImages[index])
    
            tutorialContentViewController.imageFileName = pageImages[index]
            tutorialContentViewController.pageIndex = index
            return tutorialContentViewController
        }
        return nil
    }

}

extension TutorialPageViewController : UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! TutorialContentViewController).pageIndex
        index = index-1
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! TutorialContentViewController).pageIndex
        index = index+1
        return self.viewControllerAtIndex(index: index)
    }
    
    
}
