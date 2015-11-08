//
//  ViewController.swift
//  SwiftCollatz
//
//  Created by 178inaba on 2015/10/18.
//  Copyright © 2015年 178inaba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var targetNumField: UITextField!
    @IBOutlet weak var resultView: UITableView!

    // collatz results
    var results: [UInt64] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        targetNumField.keyboardType = .NumberPad
        resultView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapCalc(sender: UIButton) {
        targetNumField.resignFirstResponder()

        results = []
        calcCollatz(UInt64(targetNumField.text!)!)
        resultView.reloadData()
    }

    func calcCollatz(num: UInt64) {
        results.append(num)
        print(num)

        if num % 2 == 1 && num > 1 {
            calcCollatz(3 * num + 1)
        } else if num % 2 == 0 {
            calcCollatz(num / 2)
        }
    }

    // cell rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    // change cell value
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel!.text = String(results[indexPath.row])
        return cell
    }
}
