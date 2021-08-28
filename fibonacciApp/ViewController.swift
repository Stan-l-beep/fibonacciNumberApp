//
//  ViewController.swift
//  fibonacciApp
//
//  Created by Stan on 27/08/2021.
//  Background by Erol Ahmed href="https://unsplash.com/@erol?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText"


import UIKit

class ViewController: UIViewController {
    
    //declarations
    var firstNum = 0
    var SecondNum = 1
    var thirdNum: Int = 0
    var lblSize: CGFloat = 17
    var timer: Timer?
    @IBOutlet weak var mainNumber: UILabel!
    @IBOutlet weak var evenLbl: UILabel!
    @IBOutlet weak var unevenLbl: UILabel!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var buttonPressForNumber: UIButton!
    @IBOutlet weak var switchState: UISwitch!
    
    //some visuals
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!).withAlphaComponent(0.5)
        mainNumber.text = "Press me"
        evenLbl.text = " "
        unevenLbl.text = " "
        
    }
    
//starts the function. beforehand checks if the state of the button.
    @IBAction func buttonPressForNumber(_ sender: Any) {
            buttonPressed()
    }
    @IBAction func switchUsed(_ sender: UISwitch) {
        if (switchState.isOn) {
            startTimer()
            buttonPressForNumber.isEnabled = false
        }
        else {
            stopTimer()
            switchState.isOn = false
            buttonPressForNumber.isEnabled = true
        }
    }
    
    //"@objc" is neded for the timer. does all the actions. animation is started before everything to check the numbers.
    //checks if the number is above a certain limit, because if there are no limits your phone will start saying that
    // the answer to everything is 42
    //takes too much memory
    //when the number exceeds the limit everything is restarted.
    @objc func buttonPressed(){
        animation()
        if thirdNum < 2584 {
            lblSize = lblSize + 1
            thirdNum = firstNum + SecondNum
            mainNumber.font = UIFont.systemFont(ofSize: lblSize)
            mainNumber.text = String(thirdNum)
            firstNum = SecondNum
            SecondNum = thirdNum
        }
        else {
            stopTimer()
            switchState.isOn = false
            firstNum = 0
            SecondNum = 1
            thirdNum = 0
        }
        
    }
    
    //starts the timer
    func startTimer()
    {
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(ViewController.buttonPressed), userInfo: nil, repeats: true)
    }
    
    //restarts the timer
    func stopTimer()
    {
        guard timer != nil else { return }
        timer!.invalidate()
        timer = nil
    }
    func animation() {
        //checks if the number is un- or even to decide on which label to assign it... just some extras
        if thirdNum % 2 == 0{
            evenLbl.text = String(thirdNum)
        } else {
            unevenLbl.text = String(thirdNum)
        }
    }
}

