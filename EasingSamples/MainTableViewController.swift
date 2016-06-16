//
//  MainTableViewController.swift
//  EasingSamples
//
//  Created by Todd Johnson on 2/26/16.
//  Copyright © 2016 toddjohn. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    var easingFunction: ((t: Float) -> (Float))?

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? EasingViewController {
            vc.easingFunction = self.easingFunction
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let easingFunctions = [
            LinearInterpolation,
            QuadraticEaseIn,
            QuadraticEaseOut,
            QuadraticEaseInOut,
            CubicEaseIn,
            CubicEaseOut,
            CubicEaseInOut,
            QuarticEaseIn,
            QuarticEaseOut,
            QuarticEaseInOut,
            SineEaseIn,
            SineEaseOut,
            SineEaseInOut,
            ElasticEaseIn,
            ElasticEaseOut,
            ElasticEaseInOut,
            ExponentialEaseIn,
            ExponentialEaseOut,
            ExponentialEaseInOut,
            BackEaseIn,
            BackEaseOut,
            BackEaseInOut,
            BounceEaseIn,
            BounceEaseOut,
            BounceEaseInOut,
        ]
        self.easingFunction = easingFunctions[indexPath.row]
        self.performSegueWithIdentifier("easingViewSegue", sender: self)
    }
}
