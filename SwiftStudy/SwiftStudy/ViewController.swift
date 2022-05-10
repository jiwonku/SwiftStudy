//
//  ViewController.swift
//  SwiftStudy
//
//  Created by 지원구 on 2022/05/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var isDarkMode : Bool = false
        
        if isDarkMode {
            NSLog("this is dark mode")
        }
        else {
            NSLog("this is not dark mode")
        }
        
        var title : String = isDarkMode ? "this is dark mode" : "this is not dark mode"
        NSLog("title is \(title)")
    }


}

