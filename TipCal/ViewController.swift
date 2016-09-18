//
//  ViewController.swift
//  TipCal
//
//  Created by Juan M Franco on 8/9/16.
//  Copyright © 2016 Juan M Franco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipRawLabel: UILabel!
    @IBOutlet weak var tipTotalLabel: UILabel!
    @IBOutlet weak var billTotalText: UITextField!
    @IBOutlet weak var tipPercentage: UISegmentedControl!
    @IBOutlet weak var oneStar: UIButton!
    @IBOutlet weak var ratePercentage: UILabel!
    @IBOutlet weak var twoStar: UIButton!
    @IBOutlet weak var treeStar: UIButton!
    @IBOutlet weak var fourStar: UIButton!
    @IBOutlet weak var fiveStar: UIButton!
    @IBOutlet weak var feedMsgLabel: UILabel!
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var resultView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnTabCalc(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func billChangeLabel(sender: AnyObject) {
        
        let billTotal = Double(billTotalText.text!) ?? 0.00
        let tipPercentage = Double(ratePercentage.text ?? "0" ) ?? 0.00
        
        let tipRaw = billTotal * (tipPercentage/100.00)
        let tipTotal = tipRaw + billTotal
        
        tipRawLabel.text = String(format:"$%.2f", tipRaw )
        
        tipTotalLabel.text = String(format:"$%.2f", tipTotal )
        
        if (billTotal > 0.0){
            UIView.animateWithDuration(0.5,animations: {
                self.resultView.alpha = 1
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
                self.resultView.alpha = 0
            })
        }
        
        
    }
    
    @IBAction func oneStarAction(sender: UIButton) {
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipPercentage = 0.00
        if let svStarPercentage = defaults.objectForKey("StarPercentage" + sender.titleLabel!.text!) as? String {
            tipPercentage =  Double(svStarPercentage)!
        } else {
            tipPercentage = (Double(sender.titleLabel!.text!) ?? 1.00) * 5.0
        }
        
        if let svStarMessage = defaults.objectForKey("StarMessage" + sender.titleLabel!.text!) as? String {
            feedMsgLabel.text =  svStarMessage
        } else {
            feedMsgLabel.text = nil
        }
        
        ratePercentage.text = String(format:"%.2f", tipPercentage)
        let sentValue = Double(sender.titleLabel?.text ?? " ") ?? 0
        //billView.alpha = 0
        UIView.animateWithDuration(0.5, animations: {
            //self.billView.hidden = false
            self.billView.alpha = 1
        })

        if (sentValue >= 1.0) {
            if let image = UIImage(named: "selectedStar.png") {                
                oneStar.setImage(image, forState: .Selected)
            }
            if(sentValue == 1.0) {
                feedMsgLabel.text = feedMsgLabel.text ?? " Horrible! "
            }
            tipRawLabel.textColor = UIColor.redColor()
        } else {
            if let image = UIImage(named: "placeHolderStar.png") {
                    oneStar.setImage(image, forState: .Selected)
            }
        }
        
        if (sentValue >= 2.0) {
            if let image = UIImage(named: "selectedStar.png") {
                twoStar.setImage(image, forState: .Selected)
            }
            if(sentValue == 2.0) {
                feedMsgLabel.text = feedMsgLabel.text ?? " Not coming back :( "
            }
            tipRawLabel.textColor = UIColor.redColor()
        } else {
            if let image = UIImage(named: "placeHolderStar.png") {
                twoStar.setImage(image, forState: .Selected)
            }
        }
        if (sentValue >= 3.0) {
            if let image = UIImage(named: "selectedStar.png") {
                self.treeStar.setImage(image, forState: .Selected)
            }
            if(sentValue == 3.0) {
                feedMsgLabel.text = feedMsgLabel.text ?? " It was OK, I guess :|"
            }
            tipRawLabel.textColor = UIColor.blackColor()
        } else {
            if let image = UIImage(named: "placeHolderStar.png") {
                treeStar.setImage(image, forState: .Selected)
            }
        }
        if (sentValue >= 4.0) {
            if let image = UIImage(named: "selectedStar.png") {
                fourStar.setImage(image, forState: .Selected)
            }
            if(sentValue == 4.0) {
                feedMsgLabel.text = feedMsgLabel.text ?? " Great food and service "
            }
            tipRawLabel.textColor = UIColor.blueColor()
        } else {
            if let image = UIImage(named: "placeHolderStar.png") {
                fourStar.setImage(image, forState: .Selected)
            }
        }
        if (sentValue >= 5.0) {
            if let image = UIImage(named: "selectedStar.png") {
                fiveStar.setImage(image, forState: .Selected)
            }
            if(sentValue == 5.0) {
                feedMsgLabel.text = feedMsgLabel.text ?? " Truely Amazing!! "
            }
            tipRawLabel.textColor = UIColor.blueColor()
        } else {
            if let image = UIImage(named: "placeHolderStar.png") {
                fiveStar.setImage(image, forState: .Selected)
            }
        }
    }
}

