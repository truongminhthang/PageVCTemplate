//
//  DataViewController.swift
//  PageVCTemplate
//
//  Created by Thang Truong on 6/5/17.
//  Copyright © 2017 Thang Truong. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    static var instance : DataViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
    }

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }


}

