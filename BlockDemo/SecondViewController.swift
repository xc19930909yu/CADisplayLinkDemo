//
//  SecondViewController.swift
//  BlockDemo
//
//  Created by share on 2018/7/16.
//  Copyright © 2018年 sonjk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var count = 0
    
    var displaylink : CADisplayLink?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.red
        
        displaylink = CADisplayLink.creatDisplayLink { [weak self] (link) in
            self?.count += 1
            print(self?.count ?? 0)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        displaylink?.removeFromRunLoop()
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
