//
//  ViewController.swift
//  Cool Stopwatch
//
//  Created by Roydon Jeffrey on 5/26/16.
//  Copyright © 2016 Italyte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Create the necessary variables for the timer
    var timer = NSTimer()
    var seconds = 59
    var minutes = 59
    var hours = 3
    
    @IBOutlet var displayTimeLabel: UILabel!
    
    @IBAction func start(sender: AnyObject) {
        
        //This prevents the timer from speeding up if the start button is clicked multiple times consecutively. Do not run if timer is active.
        if !timer.valid {
            
            //To prevent the timer from going to negative digits/numbers when timer reaches 0 for hour, minute, and second.
            if ((hours != 0) || (minutes != 0) || (seconds != 0)) {
                
                //A callback method that activates the updateTime function repeatedly every second
                timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
                
            }
            
        }
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        timer.invalidate()    //Stops the receiver in the timer from firing
        
    }
    
    @IBAction func reset(sender: AnyObject) {
        
        //Stop the timer and reset its original values but the values for minutes and seconds will be disguised until timer starts again
        
        timer.invalidate()
        seconds = 59
        minutes = 59
        hours = 3
        if hours < 10 {
            displayTimeLabel.text = "0\(hours):00:00"
        }else {
            displayTimeLabel.text = "\(hours):00:00"
        }
        
    }
    
    
    func updateTime() {
        
        //Deciding when to decrement the hours value by 1
        
        if (minutes == 59 && seconds == 59) {
            
            hours -= 1
            
        }else if (minutes == 0 && seconds == 0) {
            
            hours -= 1
            minutes = 59
            seconds = 59
            
        }
        
        //Interpolating & Extrapolating the values into the displayTimeLabel to always be double digits while seconds remain greater than 0
        if seconds > 0 {
            if hours < 10 && minutes < 10 && seconds < 10 {
                
                displayTimeLabel.text = "0\(hours):0\(minutes):0\(seconds)"
                
            }else if hours < 10 && minutes < 10 && seconds >= 10 {
                
                displayTimeLabel.text = "0\(hours):0\(minutes):\(seconds)"
                
            }else if hours < 10 && minutes >= 10 && seconds < 10 {
                
                displayTimeLabel.text = "0\(hours):\(minutes):0\(seconds)"
                
            }else if hours < 10 && minutes >= 10 && seconds >= 10 {
                
                displayTimeLabel.text = "0\(hours):\(minutes):\(seconds)"
                
            }else if hours >= 10 && minutes < 10 && seconds < 10 {
                
                displayTimeLabel.text = "\(hours):0\(minutes):0\(seconds)"
                
            }else if hours >= 10 && minutes < 10 && seconds >= 10 {
                
                displayTimeLabel.text = "\(hours):0\(minutes):\(seconds)"
                
            }else if hours >= 10 && minutes >= 10 && seconds < 10 {
                
                displayTimeLabel.text = "\(hours):\(minutes):0\(seconds)"
                
            }else {
                
                displayTimeLabel.text = "\(hours):\(minutes):\(seconds)"
                
            }
            
            //Decrement the seconds value by 1 so long as it is greater than 0
            seconds -= 1
          
        //Reorganizing the values when seconds reaches 0
        }else if seconds == 0 {
            
            if minutes < 1 {
                
                //Set minutes to 0 if its less than 1
                minutes = 0
                
                if hours == 0 {
                    
                    //Reset minutes and seconds to their original values if hours is eqaul to 0
                    minutes = 59
                    seconds = 59
                    
                }
                
            }else {
                
                //Decrement minutes by 1 so long as it is greater than 0
                minutes -= 1
                
            }
            
            //Reset seconds to its original value
            seconds = 59
            
            //Determining how hours and minutes will be displayed as double digit values once seconds is reset to 59
            if hours < 10 && minutes < 10 {
                
                displayTimeLabel.text = "0\(hours):0\(minutes):\(seconds)"
                
            }else if hours >= 10 && minutes < 10 {
                
                displayTimeLabel.text = "\(hours):0\(minutes):\(seconds)"
                
            }else if hours < 10 {
                
                displayTimeLabel.text = "0\(hours):\(minutes):\(seconds)"
                
            }else {
                
                displayTimeLabel.text = "\(hours):\(minutes):\(seconds)"
                
            }
            
            //Restart the decrementing of seconds by 1 after it has been reset to its original value of 59
            seconds -= 1
            
        }
        
        //When hours, minutes, and seconds reach 0 together, stop the timer completely and set the displayTimeLabel
        if hours == 0 && minutes == 0 && seconds == 0 {
            
            timer.invalidate()
            displayTimeLabel.text = "00:00:00"
            
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




//        if hours < 10 && minutes < 10 && seconds < 10 {
//
//            displayTimeLabel.text = "0\(hours):0\(minutes):0\(seconds)"
//
//        }else if hours < 10 && minutes < 10 && seconds >= 10 {
//
//            displayTimeLabel.text = "0\(hours):0\(minutes):\(seconds)"
//
//        }else if hours < 10 && minutes >= 10 && seconds < 10 {
//
//            displayTimeLabel.text = "0\(hours):\(minutes):0\(seconds)"
//
//        }else if hours < 10 && minutes >= 10 && seconds >= 10 {
//
//            displayTimeLabel.text = "0\(hours):\(minutes):\(seconds)"
//
//        }else if hours >= 10 && minutes < 10 && seconds < 10 {
//
//            displayTimeLabel.text = "\(hours):0\(minutes):0\(seconds)"
//
//        }else if hours >= 10 && minutes < 10 && seconds >= 10 {
//
//            displayTimeLabel.text = "\(hours):0\(minutes):\(seconds)"
//
//        }else if hours >= 10 && minutes >= 10 && seconds < 10 {
//
//            displayTimeLabel.text = "\(hours):\(minutes):0\(seconds)"
//
//        }else {
//
//            displayTimeLabel.text = "\(hours):\(minutes):\(seconds)"
//
//        }

