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
    
    var imageFileName : String!
    var pageIndex : Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.image = UIImage(named : imageFileName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
