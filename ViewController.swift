//
//  ViewController.swift
//  Multicast-Delegate-Example
//
//  Created by Andrew on 4/25/18.
//  Copyright © 2018 Andrew Nordahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func testButtonPressed(_ sender: Any) {
        (UIApplication.shared.delegate as! AppDelegate).multicastDelegatorObject.notifyDelegates()
        (sender as? UIButton)?.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            (sender as? UIButton)?.isEnabled = true
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
