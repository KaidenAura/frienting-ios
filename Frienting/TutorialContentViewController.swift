//
//  TutorialContentHolderViewController.swift
//  tutorial
//
//  Created by 신영환 on 2018. 7. 10..
//  Copyright © 2018년 신영환. All rights reserved.
//

import UIKit

class TutorialContentViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var imageFileName : String!
    var pageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.isHidden = true
        myImageView.image = UIImage(named : imageFileName)
        pageControl.currentPage = pageIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func skipButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
