//
//  ViewController.swift
//  SwiftCollatz
//
//  Created by 178inaba on 2015/10/18.
//  Copyright © 2015年 178inaba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetNumField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapCalc(sender: UIButton) {
        calcCollatz(UInt64(targetNumField.text!)!)
    }

    func calcCollatz(num: UInt64) {
        print(num)

        if num % 2 == 1 && num > 1 {
            calcCollatz(3 * num + 1)
        } else if num % 2 == 0 {
            calcCollatz(num / 2)
        }
    }
}
