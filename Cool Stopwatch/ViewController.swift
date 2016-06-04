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
    var seconds = 59
    var minutes = 59
    var hours = 2
    
    @IBOutlet var displayTimeLabel: UILabel!
    
    @IBAction func start(sender: AnyObject) {
        
        if !timer.valid {
            
            if ((hours != 0) && (minutes != 0) && (seconds != 0)) {
                
                timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
                
            }
            
        }
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        timer.invalidate()
        
    }
    
    @IBAction func reset(sender: AnyObject) {
        
        timer.invalidate()
        seconds = 59
        minutes = 59
        hours = 2
        displayTimeLabel.text = "\(hours):0:0"
        
    }
    
    func updateTime() {
        
        if (minutes == 59 && seconds == 59) {
            
            hours -= 1
            
        }else if (minutes == 0 && seconds == 0) {
            
            hours -= 1
            minutes = 59
            seconds = 59
            
        }
        
        if seconds > 0 {
        
            displayTimeLabel.text = "\(hours):\(minutes):\(seconds)"
            seconds -= 1
            
        }else if seconds == 0 {
            
            if minutes < 1 {
                
                minutes = 0
                if hours == 0 {
                    
                    minutes = 59
                    seconds = 59
                    
                }
                
            }else {
                
                minutes -= 1
                
            }
            
            seconds = 59
            displayTimeLabel.text = "\(hours):\(minutes):\(seconds)"
            seconds -= 1
            
        }
        
        if hours == 0 && minutes == 0 && seconds == 0 {
            
            timer.invalidate()
            displayTimeLabel.text = "\(hours):\(minutes):\(seconds)"
            
        }
        
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



//    var isPaused: Bool = false
//    var timer = NSTimer()
//    var startTime = NSTimeInterval()
////    var pauseTime: NSTimeInterval = 0.0
//
//    @IBOutlet var displayTimeLabel: UILabel!
//
//    @IBAction func start(sender: AnyObject) {
//
//        if isPaused {
//            timer = NSTimer.scheduledTimerWithTimeInterval(0.11, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
//        }
//
//        if !timer.valid {
//
//            timer = NSTimer.scheduledTimerWithTimeInterval(0.11, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
//
//        }
//
//        if displayTimeLabel.text == "00:00:00:00" {
//
//            startTime = NSDate.timeIntervalSinceReferenceDate()
//
//        }
//
//    }
//
//    @IBAction func stop(sender: AnyObject) {
//        isPaused = true
//        timer.invalidate()
//
//    }
//
//    func updateTime() {
//
//        let currentTime = NSDate.timeIntervalSinceReferenceDate()
//        var elapsedTime: NSTimeInterval = currentTime - startTime
//
//        let hours = UInt8(elapsedTime / 3600)
//        elapsedTime -= (NSTimeInterval(hours) * 3600)
//
//        let minutes = UInt8(elapsedTime / 60)
//        elapsedTime -= (NSTimeInterval(minutes) * 60)
//
//        let seconds = UInt8(elapsedTime)
//        elapsedTime -= NSTimeInterval(seconds)
//
//        let fraction = UInt8(elapsedTime * 100)
//
//        let strHours = String(format: "%02i", hours)
//        let strMinutes = String(format: "%02i", minutes)
//        let strSeconds = String(format: "%02i", seconds)
//        let strFraction = String(format: "%02i", fraction)
//
//        displayTimeLabel.text = "\(strHours):\(strMinutes):\(strSeconds):\(strFraction)"
//
//    }


