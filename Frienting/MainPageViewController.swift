//
//  MainViewController.swift
//  tutorial
//
//  Created by 신영환 on 2018. 7. 14..
//  Copyright © 2018년 신영환. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPageViewControllerDelegate , UIPageViewControllerDataSource {

    var mainPageImages : NSArray!
    //new code
    var pageViewController : UIPageViewController!
    var pageControll = UIPageControl()
    
    func configurePageControl(){
        pageControll = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width , height: 50))
        pageControll.numberOfPages = mainPageImages.count
        pageControll.currentPage = 0
        pageControll.tintColor = UIColor.black
        pageControll.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControll)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainPageImages = NSArray(objects : "main01", "main02", "main03", "main04", "main05")
        
        //MyPageViewController를 UIPageViewController로 변환해서 pageViewController로 설정
        //이 뷰 컨트롤러가 자식 뷰 컨트롤러가 될 것.
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier : "MainPageViewController") as! UIPageViewController
        
        //datasource?
        self.pageViewController.dataSource = self
        
        //TutorialContentViewController에 이미지와 인덱스를 설정하고 가져옴
        let initialContentViewController = self.pageMainAtIndex(index: 0) as MainContentViewController
        
        let viewControllers = NSArray(object: initialContentViewController)
        
        //pageViewController에 viewController를 추가함.
        //viewController는 TutorialContentViewController의 뷰들이 저장되어있다?
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
        //pageViewController를 self의 자식 뷰로 넣고, 서브 뷰를 추가.
        self.pageViewController.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX , height: UIScreen.main.bounds.maxX)
            //CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
        
        pageViewController.delegate = self
        configurePageControl()
    }
    
    func pageMainAtIndex(index : Int) -> MainContentViewController{
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainContentViewController") as! MainContentViewController
        pageContentViewController.imageFileName = mainPageImages[index] as! String
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
        
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        let viewController = viewController as! MainContentViewController
        var index = viewController.pageIndex as Int
        if (index == 0 || index == NSNotFound){
            
            return self.pageMainAtIndex(index: mainPageImages.count - 1)
        }
        index = index - 1
        return self.pageMainAtIndex(index: index)
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        let viewController = viewController as! MainContentViewController
        var index = viewController.pageIndex as Int
        if ((index == NSNotFound)){
            return nil
        }
        index = index + 1
        if (index == mainPageImages.count){
            return self.pageMainAtIndex(index: 0)
        }
        return self.pageMainAtIndex(index: index)
    }
    
 
    
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return mainPageImages.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }


}
