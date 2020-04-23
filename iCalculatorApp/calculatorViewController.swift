//
//  calculatorViewController.swift
//  Created by Ahmad Bin Laiq on 27/03/2020.
//  Copyright © 2020 Ahmad Bin Laiq. All rights reserved.
//

import UIKit

class calculatorViewController: UIViewController{
    
    
    @IBOutlet weak var themeButton: UIButton!
    var appThemeDay : Bool = true
    @IBAction func themeButtonAction(_ sender: Any) {
        changeThemeOnSignal()
    }
   
    
    var calculator = calculatorModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var width: CGFloat = 0
        // Do any additional setup after loading the view.
        expressionLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        resultLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        for button in calButtons {
            button.layer.cornerRadius = 30
            button.clipsToBounds = true
            if button.title(for: .normal) == "7" {
                width = button.frame.size.width
                print("Width 1: ",button.frame.size.width)
                print("Width 2: ",button.frame.size.width)
            }
            if button.title(for: .normal) == "0" {
                button.widthAnchor.constraint(equalToConstant: width * 2).isActive = true
                print("Width 1a: ",button.frame.size.width)
                print("Width 2a: ",button.frame.size.width)
            }
            if button.title(for: .normal) == "=" {
                
                button.widthAnchor.constraint(equalToConstant: width).isActive = true
                print(button.frame.width)
            }
            if button.title(for: .normal) == "." {
                
                button.widthAnchor.constraint(equalToConstant: width).isActive = true
            }
        }
        changeTheme()
    }
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var expressionLabel: UILabel?
    
    @IBOutlet private var calButtons: [UIButton]!
    
    
    @IBAction private func touchButton(sender: UIButton){
        
        calculator.calculatorHandler(buttonTapped: (sender.titleLabel?.text)!)
        resultLabel.text = calculator.getresultString()
        expressionLabel?.text = calculator.getdisplayString()
        
    }
    
    private func changeTheme(){
        for button in calButtons {
            button.layer.borderWidth = 1
            appThemeDay = true
            view.backgroundColor = #colorLiteral(red: 0.999905169, green: 1, blue: 0.9998704791, alpha: 1)
            
            if button.title(for: .normal) == "7" || button.title(for: .normal) ==  "8" || button.title(for: .normal) ==  "9" || button.title(for: .normal) == "4" || button.title(for: .normal) == "5" || button.title(for: .normal) == "6" || button.title(for: .normal) == "1" || button.title(for: .normal) == "2" || button.title(for: .normal) == "3" || button.title(for: .normal) == "0"  || button.title(for: .normal) == "."
            {
                button.backgroundColor = #colorLiteral(red: 0.8973513246, green: 0.8993928432, blue: 0.9168459177, alpha: 1)
                button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                button.setBackgroundColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .highlighted)
                
                
            }
            
            if button.title(for: .normal) ==  "C" || button.title(for: .normal) == "+/-" || button.title(for: .normal) == "%" || button.title(for: .normal) == "+" || button.title(for: .normal) == "x" || button.title(for: .normal) == "-" || button.title(for: .normal) == "+" || button.title(for: .normal) == "÷"
            {
                button.backgroundColor = #colorLiteral(red: 0.7411851287, green: 0.8841443062, blue: 0.8360474706, alpha: 1)
                button.layer.borderColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1), for: .normal)
                button.setBackgroundColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .highlighted)
                
            }
            
            if button.title(for: .normal) == "="
            {
                button.backgroundColor = #colorLiteral(red: 0.9008894563, green: 0.7882316709, blue: 0.8073523045, alpha: 1)
                button.layer.borderColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
                button.setBackgroundColor(#colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1), for: .highlighted)
                
            }
        }
        themeButton.setImage(UIImage(named: "night"), for: .normal)
        themeButton.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        
    }
    
    private func changeThemeOnSignal()
    {
        if appThemeDay == false{
            for button in calButtons {
                button.layer.borderWidth = 1
                appThemeDay = true
                view.backgroundColor = #colorLiteral(red: 0.999905169, green: 1, blue: 0.9998704791, alpha: 1)
                
                if button.title(for: .normal) == "7" || button.title(for: .normal) ==  "8" || button.title(for: .normal) ==  "9" || button.title(for: .normal) == "4" || button.title(for: .normal) == "5" || button.title(for: .normal) == "6" || button.title(for: .normal) == "1" || button.title(for: .normal) == "2" || button.title(for: .normal) == "3" || button.title(for: .normal) == "0"  || button.title(for: .normal) == "." {
                    button.backgroundColor = #colorLiteral(red: 0.8973513246, green: 0.8993928432, blue: 0.9168459177, alpha: 1)
                    button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                    button.setBackgroundColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .highlighted)
                }
                
                if button.title(for: .normal) ==  "C" || button.title(for: .normal) == "+/-" || button.title(for: .normal) == "%" || button.title(for: .normal) == "+" || button.title(for: .normal) == "x" || button.title(for: .normal) == "-" || button.title(for: .normal) == "+" || button.title(for: .normal) == "÷"
                {
                    button.backgroundColor = #colorLiteral(red: 0.7411851287, green: 0.8841443062, blue: 0.8360474706, alpha: 1)
                    button.layer.borderColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
                    button.setTitleColor(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1), for: .normal)
                    button.setBackgroundColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .highlighted)
                }
                
                if button.title(for: .normal) == "="
                {
                    button.backgroundColor = #colorLiteral(red: 0.9008894563, green: 0.7882316709, blue: 0.8073523045, alpha: 1)
                    button.layer.borderColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
                    button.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
                    button.setBackgroundColor(#colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1), for: .highlighted)
                }
            }
            themeButton.setImage(UIImage(named: "night"), for: .normal)
            themeButton.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            
        }
        else {
            appThemeDay = false
            resultLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            for button in calButtons {
                view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                if button.title(for: .normal) == "7" || button.title(for: .normal) ==  "8" || button.title(for: .normal) ==  "9" || button.title(for: .normal) == "4" || button.title(for: .normal) == "5" || button.title(for: .normal) == "6" || button.title(for: .normal) == "1" || button.title(for: .normal) == "2" || button.title(for: .normal) == "3" || button.title(for: .normal) == "0"  || button.title(for: .normal) == "." {
                    button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                    button.setBackgroundColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .highlighted)
                }
                
                if button.title(for: .normal) ==  "C" || button.title(for: .normal) == "+/-" || button.title(for: .normal) == "%" || button.title(for: .normal) == "+" || button.title(for: .normal) == "x" || button.title(for: .normal) == "-" || button.title(for: .normal) == "+" || button.title(for: .normal) == "÷"
                {
                    button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                    button.setBackgroundColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .highlighted)
                    
                }
                
                if button.title(for: .normal) == "="
                {
                    button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                    button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                    button.setBackgroundColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .highlighted)
                }
            }
            //            var dayIcon: String =
            themeButton.setImage(UIImage(named: "day"), for: .normal)
            themeButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        color.setFill()
        UIRectFill(rect)
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        setBackgroundImage(colorImage, for: state)
    }
}

extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.upperBound
    }
    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
        var indices: [Index] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                    indices.append(range.lowerBound)
                    startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                        index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return indices
    }
    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                    result.append(range)
                    startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                        index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}


extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}


extension Collection {
    subscript(safe index: Index) -> Element? {
        print(indices.contains(index) ? self[index] : nil)
        return indices.contains(index) ? self[index] : nil
    }
}

