//
//  ViewController.swift
//  tutorial
//
//  Created by 신영환 on 2018. 7. 9..
//  Copyright © 2018년 신영환. All rights reserved.
//

import UIKit

class TutorialPVController: UIViewController, UIPageViewControllerDataSource {
    
    var tutorialPageImages : NSArray!
    var pageViewController : UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tutorialPageImages = NSArray(objects : "img01", "img02", "img03", "img04")
        
        //MyPageViewController를 UIPageViewController로 변환해서 pageViewController로 설정
        //이 뷰 컨트롤러가 자식 뷰 컨트롤러가 될 것.
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier : "TutorialPageViewController") as! UIPageViewController
        
        //datasource?
        self.pageViewController.dataSource = self
        
        //TutorialContentViewController에 이미지와 인덱스를 설정하고 가져옴
        let initialContentViewController = self.pageTutorialAtIndex(index: 0) as TutorialContentViewController
        
        let viewControllers = NSArray(object: initialContentViewController)
        
        //pageViewController에 viewController를 추가함.
        //viewController는 TutorialContentViewController의 뷰들이 저장되어있다?
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
 
        //pageViewController를 self의 자식 뷰로 넣고, 서브 뷰를 추가.
        self.pageViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
    }
    
    func pageTutorialAtIndex(index : Int) -> TutorialContentViewController{
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "TutorialContentViewController") as! TutorialContentViewController
        pageContentViewController.imageFileName = tutorialPageImages[index] as! String
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
        
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        let viewController = viewController as! TutorialContentViewController
        var index = viewController.pageIndex as Int
        if (index == 0 || index == NSNotFound){

            return self.pageTutorialAtIndex(index: tutorialPageImages.count - 1)
        }
        index = index - 1
        return self.pageTutorialAtIndex(index: index)
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        let viewController = viewController as! TutorialContentViewController
        var index = viewController.pageIndex as Int
        if ((index == NSNotFound)){
            return nil
        }
        index = index + 1
        if (index == tutorialPageImages.count){
            return self.pageTutorialAtIndex(index: 0)
        }
        return self.pageTutorialAtIndex(index: index)
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return tutorialPageImages.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        let nextView :TheNextViewController = self.storyboard?.instantiateViewController(withIdentifier: "TheNextViewController") as! TheNextViewController
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        appdelegate.window!.rootViewController = nextView
    }
   


}

