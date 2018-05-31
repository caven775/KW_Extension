//
//  ViewController.swift
//  KW_Extension_Swift
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        KWAlert(title: "我是标题", message: "测试测试一下");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

