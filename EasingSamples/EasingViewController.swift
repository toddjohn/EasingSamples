//
//  EasingViewController.swift
//  EasingSamples
//
//  Created by Todd Johnson on 2/26/16.
//  Copyright © 2016 toddjohn. All rights reserved.
//

import UIKit

class EasingViewController: UIViewController {
    @IBOutlet var easingView: EasingView!
    var easingFunction: ((t: Float) -> (Float))?

    override func viewWillAppear(animated: Bool) {
        self.easingView.easingFunction = self.easingFunction
        self.easingView.currentPosition = 0.5
    }

    @IBAction func sliderChanged(sender: UISlider) {
        self.easingView.currentPosition = sender.value
    }
}
