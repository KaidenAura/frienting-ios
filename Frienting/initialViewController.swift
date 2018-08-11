//
//  initialViewController.swift
//  Frienting
//
//  Created by 신영환 on 2018. 7. 28..
//  Copyright © 2018년 신영환. All rights reserved.
//

import UIKit

class initialViewController: UITabBarController {

    var needTutorial = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (needTutorial){
            displayTutorial()
        }
    }
    
    func displayTutorial(){
        if (needTutorial){
            if let pageViewController = storyboard?.instantiateViewController(withIdentifier : "TutorialPageViewController"){
                self.present(pageViewController, animated : true, completion : nil)
             }
        needTutorial = false
        }
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

}
