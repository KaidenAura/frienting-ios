//
//  PageContentController.swift
//  tutorial
//
//  Created by 신영환 on 2018. 7. 9..
//  Copyright © 2018년 신영환. All rights reserved.
//

import UIKit

class PageContentController: UIViewController {


    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var pageIndex : Int!
    var titleText : String!
    var imageFile : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = UIImage(named: self.imageFile)
        self.labelTitle.text = self.titleText
    }
    
}
