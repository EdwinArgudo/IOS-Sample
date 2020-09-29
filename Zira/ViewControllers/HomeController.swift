//
//  ViewController.swift
//  Zira
//
//  Created by Vienna Zhang on 9/28/20.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var UIbalance: UITextField!
    @IBOutlet weak var UItimeLeft: UITextField!
    @IBOutlet weak var UIstartTime: UITextField!
    @IBOutlet weak var UIendTime: UITextField!
    
    
    var startTimeString = "2020-09-30 09:30:00"
    var startTime: NSDate?
    var endTimeString = "2020-09-30 17:30:00"
    var endTime: NSDate?
    var formatter = DateFormatter()
    
    func setTimeInterval() {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        startTime = formatter.date(from: startTimeString)! as NSDate
        endTime = formatter.date(from: endTimeString)! as NSDate
        formatter.dateFormat = "hh:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        UIstartTime.text = formatter.string(from: startTime! as Date)
        UIendTime.text = formatter.string(from: endTime! as Date)
    }

    func startTimer() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        let currentDate = Date()
        let calendar = Calendar.current

        let diffDateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: startTime! as Date)
        
        let countdown = "In \(diffDateComponents.hour ?? 0)h : \(diffDateComponents.minute ?? 0)m"
        UItimeLeft.text = countdown
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIbalance.text = "$145"
        setTimeInterval()
        startTimer()
    }
}

