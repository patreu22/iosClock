//
//  ViewController.swift
//  EggClock
//
//  Created by Patrick on 01.09.15.
//  Copyright © 2015 Patrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var time = 0.00
    var timer = NSTimer()
    var timerActive = false
    
    @IBOutlet var clock: UILabel!
    @IBAction func startClock(sender: AnyObject) {
       startTimer()
    }
    
    
    @IBAction func restart(sender: AnyObject) {
        timer.invalidate()
        time = -1.00
        timerActive = false
        startTimer()
    }
    
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
        timerActive = false
    }
    
    
    func timerResult(){
        time++
        displayNewTime()
    }
    
    func displayNewTime(){
        let seconds = Int(time % 60.0)
        let minutes = Int(floor(time/60.0))
        var displayString = ""
        if minutes<=9{
           displayString += "0\(minutes)"
        } else{
            displayString+="\(minutes)"
        }
        
        displayString+=":"
        
        if seconds<=9{
           displayString += "0\(seconds)"
        }else{
           displayString += "\(seconds)"
        }
        clock.text = displayString
    }
    
    func startTimer(){
        if !timerActive{
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerResult"), userInfo: nil, repeats: true)
        timerActive = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

