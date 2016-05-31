//
//  ViewController.swift
//  Cool Stopwatch
//
//  Created by Roydon Jeffrey on 5/26/16.
//  Copyright © 2016 Italyte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var startTime = NSTimeInterval()
    
    @IBOutlet var displayTimeLabel: UILabel!
    
    @IBAction func start(sender: AnyObject) {
        
        if !timer.valid {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
            
        }

    }
    
    @IBAction func stop(sender: AnyObject) {
        
        timer.invalidate()
    }
    
    func updateTime() {
        
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        let hours = UInt8(elapsedTime / 3600)
        elapsedTime -= (NSTimeInterval(hours) * 3600)
        
        let minutes = UInt8(elapsedTime / 60)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        let fraction = UInt8(elapsedTime * 100)
        
        let strHours = String(format: "%02d", hours)
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
            
        displayTimeLabel.text = "\(strHours):\(strMinutes):\(strSeconds):\(strFraction)"
        
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




