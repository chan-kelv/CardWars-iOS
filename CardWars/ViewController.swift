//
//  ViewController.swift
//  CardWars
//
//  Created by Dev on 2015-07-29.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLeftCard: UIImageView!
    @IBOutlet weak var imgRightCard: UIImageView!
    @IBOutlet weak var btnDraw: UIButton!
    @IBOutlet weak var imgBackground: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actnDrawTapped(sender: UIButton) {
        self.btnDraw.setTitle("Draw!", forState: UIControlState.Normal)
    }

}

