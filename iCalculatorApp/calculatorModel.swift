//
//  calculatorModel.swift
//  Created by Ahmad Bin Laiq on 30/03/2020.
//  Copyright © 2020 Ahmad Bin Laiq. All rights reserved.


import Foundation

class calculatorModel {
    
    private var result : Any? // for calculating result form maths
    private var calculationString = "" // for maths expreesio
    private var displayString = "" // expression Label
    private var resultString = "" // result Label
    private var forExpresionLabelSpecialCase = ""
    
    private var operatr = "" // +,-,/,.,x
    
    
    init() {
        calculationString = ""
        result = nil
        displayString = ""
        operatr = ""
        resultString = ""
    }
    
    public func setOperator(operatr: String){
        self.operatr = operatr
    }
    
    public func setResult(result: Any?){
        self.result = result
    }
    
    public func setcalculationString(calculationString: String){
        self.calculationString = calculationString
    }
    
    public func setdisplayString(displayString: String){
        self.displayString = displayString
    }
    
    public func setresultString(resultString: String){
        self.resultString = resultString
    }
    
    
    public func getOperator() -> String{
        return self.operatr
    }
    
    public func getResult() -> Any?{
        return self.result
    }
    
    public func getcalculationString() -> String{
        return self.calculationString
    }
    
    public func getdisplayString() -> String{
        return self.displayString
    }
    
    public func getresultString() -> String{
        return self.resultString
    }
    
    
    public func calculatorHandler(buttonTapped: String){
        
        switch buttonTapped {
        case "0","1","2","3","4","5","6","7","8","9":
            // Numbers
            
            if  getcalculationString().isEmpty == false && String( getcalculationString().last!) == "/100" {
                setcalculationString(calculationString: String( getcalculationString().dropLast()))
                //
                setdisplayString(displayString: String( getdisplayString().dropLast()))
                forExpresionLabelSpecialCase = getdisplayString()
                
            }
            else {
                setcalculationString(calculationString:  getcalculationString() + (buttonTapped ))
                
                setdisplayString(displayString:  getdisplayString() + (buttonTapped))
                forExpresionLabelSpecialCase = getdisplayString()
                // checking for operations
                if  getcalculationString().contains("+") ||  getcalculationString().contains("-") ||  getcalculationString().contains("*") ||  getcalculationString().contains("÷")
                {
                    if String( getcalculationString().first!) == "+"{ // +9 case
                        setcalculationString(calculationString: String( getcalculationString().dropFirst()))
                        setdisplayString(displayString:  getcalculationString())
                        forExpresionLabelSpecialCase = getdisplayString()
                        
                    }
                    else {
                        let expression = NSExpression(format:  "1.0*" +   getcalculationString()) //
                        setResult(result: expression.expressionValue(with: nil, context: nil))
                        setresultString(resultString: "\(getResult() ?? "0")")
                        
                    }
                }
                
            }
        case "+":
            // Add
            // expression +9*1 gives error
            CheckDoubleCharactersFromDisplayString(seqToRemove: "++", toReplace: "+",signal: 3)
            if  getcalculationString().isEmpty == true {
                setcalculationString(calculationString:  forExpresionLabelSpecialCase + "+" )// latest
                setdisplayString(displayString:  getcalculationString())
                forExpresionLabelSpecialCase = getdisplayString()
                
                setOperator(operatr: "+")
            }
            else if (String( getcalculationString().last!) ==  getOperator()){
                setcalculationString(calculationString: String( getcalculationString().dropLast()))
                setcalculationString(calculationString:  getcalculationString() + "+" )
                setdisplayString(displayString: String( getdisplayString().dropLast()))
                
                setdisplayString(displayString:  getdisplayString() + "+")
                forExpresionLabelSpecialCase = getdisplayString()
                
                setOperator(operatr: "+")
            }
            else {
                
                setdisplayString(displayString:  forExpresionLabelSpecialCase + "+")
                setcalculationString(calculationString:  getcalculationString() + "+" )
            }
        case "-":
            
            CheckDoubleCharactersFromDisplayString(seqToRemove: "--", toReplace: "-",signal: 3)
            // Subtract
            if  getcalculationString().isEmpty == true {
                setcalculationString(calculationString:  forExpresionLabelSpecialCase + "-" )
                setdisplayString(displayString:  getcalculationString())
                forExpresionLabelSpecialCase = getdisplayString()
                
                setOperator(operatr: "-")//operatr = "-"
            }
            else if (String( getcalculationString().last!) ==  getOperator()){
                setcalculationString(calculationString: String( getcalculationString().dropLast()))
                setcalculationString(calculationString:  getcalculationString() + "-" )
                setdisplayString(displayString: String( getdisplayString().dropLast()))
                setdisplayString(displayString:  getdisplayString() + "-")
                forExpresionLabelSpecialCase = getdisplayString()
                setOperator(operatr: "-")
            }
            else {
                setOperator(operatr: "-")//operatr = "-"
                setdisplayString(displayString:  forExpresionLabelSpecialCase + "-")//
                setcalculationString(calculationString:  getcalculationString() + "-" )
            }
        case "x":
            
            CheckDoubleCharactersFromDisplayString(seqToRemove: "xx", toReplace: "x",signal: 1)
            if  getcalculationString().isEmpty == true {
                setcalculationString(calculationString:  forExpresionLabelSpecialCase + "" )
                setdisplayString(displayString:  getcalculationString())
                
                setOperator(operatr: "*")//operatr = "*"
            }
            else if (String( getcalculationString().last!) ==  getOperator()){
                setcalculationString(calculationString: String( getcalculationString().dropLast()))
                setcalculationString(calculationString:  getcalculationString() + "*" )//calculationString.append("*")
                setdisplayString(displayString: String( getdisplayString().dropLast()))
                setdisplayString(displayString:  getdisplayString() + "x")//displayString.append("x")
                
                setOperator(operatr: "*")
                //
            }
            else {
                setOperator(operatr: "*")//operatr = "*"
                // Multiply
                forExpresionLabelSpecialCase = getdisplayString()
                setdisplayString(displayString:  getdisplayString() + "x")
                setcalculationString(calculationString:  getcalculationString() + "*" )
            }
        case "÷":
            
            CheckDoubleCharactersFromDisplayString(seqToRemove: "÷÷", toReplace: "÷",signal: 2)
            if  getcalculationString().isEmpty == true {
                setcalculationString(calculationString:  forExpresionLabelSpecialCase + " " )//calculationString.append(" ")
                setdisplayString(displayString:  getcalculationString())
                //
                setOperator(operatr: "/")//operatr = "/"
            }
            else if (String( getcalculationString().last!) ==  getOperator()){
                setcalculationString(calculationString: String( getcalculationString().dropLast()))
                setcalculationString(calculationString:  getcalculationString() + "/" )//calculationString.append("/")
                setdisplayString(displayString: String( getdisplayString().dropLast()))
                setdisplayString(displayString:  getdisplayString() + "÷")//displayString.append("÷")
                
                setOperator(operatr: "/")
            }
            else {
                setOperator(operatr: "/")//operatr = "/"
                // Divide
                forExpresionLabelSpecialCase = getdisplayString()
                setdisplayString(displayString:  getdisplayString() + "÷")
                setcalculationString(calculationString:  getcalculationString() + "*1.0" )
                setcalculationString(calculationString:  getcalculationString() + "/" )
            }
            
        case "%":
            // modulo check yet to do
            CheckDoubleCharactersFromDisplayString(seqToRemove: "%%", toReplace: "%", signal: 0)
            if  getcalculationString().isEmpty == true {
                //calculationString.append(" ")
                setdisplayString(displayString:  forExpresionLabelSpecialCase)
                forExpresionLabelSpecialCase = getdisplayString()
                //
            }
            else if String( getcalculationString().last!).isInt {
                forExpresionLabelSpecialCase = getdisplayString()
                setdisplayString(displayString:  getdisplayString() + "%")//displayString.append("%")
                setOperator(operatr: "/100")//operatr = "/100"
                setcalculationString(calculationString:  getcalculationString() + "/100" )
                let expression = NSExpression(format: "1.0*" +  getcalculationString())
                //  1.0 * added to make the operand floor
                CheckDoubleCharactersFromDisplayString(seqToRemove: "1.0*1.0*", toReplace: "1.0*",signal: 0)
                setResult(result: expression.expressionValue(with: nil, context: nil))
                resultString = "\( getResult() ?? "0")" //recent update 1:56
                
            }
            else if (String( getcalculationString().last!) ==  getOperator()){
                setcalculationString(calculationString: String( getcalculationString().dropLast()))
                if  getcalculationString() != ""{
                    setcalculationString(calculationString:  getcalculationString() + "/100" )//calculationString.append("/100")
                    setdisplayString(displayString: String( getdisplayString().dropLast()))
                    setdisplayString(displayString:  getdisplayString() + "%")
                    
                    setOperator(operatr: "/100")
                }
                else {
                    // rola // corretion
                    setcalculationString(calculationString:  getcalculationString() + "/100" )//calculationString.append("/100")
                    setdisplayString(displayString: String( getdisplayString().dropLast()))
                    setdisplayString(displayString:  getdisplayString() + "%")
                    
                    //
                }
            }
            
        case ".":
            // Decimal
            
            CheckDoubleCharactersFromDisplayString(seqToRemove: "..", toReplace: ".",signal: 5)
            if  getcalculationString().isEmpty == true {
                setcalculationString(calculationString:  forExpresionLabelSpecialCase + "." )
                setdisplayString(displayString:  getcalculationString())
                //
                setOperator(operatr: ".")//operatr = "."
            }
            else if (String( getcalculationString().last!) ==  getOperator()){
                setcalculationString(calculationString: String( getcalculationString().dropLast()))
                setcalculationString(calculationString:  getcalculationString() + "." )
                setdisplayString(displayString: String( getdisplayString().dropLast()))
                setdisplayString(displayString:  getdisplayString() + ".")//displayString.append(".")
                
                setOperator(operatr: ".")//operatr = "."
                //
            }
            else if  getcalculationString().contains(".") {
                setcalculationString(calculationString: String( getcalculationString().dropLast()))
                setdisplayString(displayString:  getcalculationString())
                //
            }
            else {
                setOperator(operatr: ".")//operatr = "."
                setcalculationString(calculationString:  getcalculationString() + "." )
                setdisplayString(displayString:  getdisplayString() + ".")//displayString.append(".")
                //
            }
        case "C":
            
            setcalculationString(calculationString: "")
            forExpresionLabelSpecialCase = ""
            setresultString(resultString: "")
            setdisplayString(displayString: "")
            setResult(result: nil)
        case "+/-":
            
            //            print(calculationString)
            if  getcalculationString().isEmpty {
                setcalculationString(calculationString: "-" + forExpresionLabelSpecialCase  )//calculationString.append("-")
                setdisplayString(displayString:  getcalculationString())
                forExpresionLabelSpecialCase = getdisplayString()
                
                setOperator(operatr: "-")//operatr = "-"
            }
            else if (String( getcalculationString().last!) ==  getOperator()){
                setcalculationString(calculationString: String( getcalculationString().dropLast()))
                setcalculationString(calculationString:  "-" + getcalculationString() )
                setdisplayString(displayString: String( getdisplayString().dropLast()))
                setdisplayString(displayString:  "-" + getdisplayString())//displayString.append("-")
                forExpresionLabelSpecialCase = getdisplayString()
                setOperator(operatr: "-")
                //
              //  setOperator(operatr: "-")
            }
            else if (( getcalculationString().contains("+") == false) && ( getcalculationString().contains("-") == false) && ( getcalculationString().contains("*") == false) && ( getcalculationString().contains("/") == false)) || getresultString() != "" // recently added
            {
                setOperator(operatr: "-")
                setcalculationString(calculationString: "-" +  getcalculationString())
                if getresultString() == ""{
                    setresultString(resultString: "-" + getresultString())
                }
                else {
                    setresultString(resultString: "-" + getdisplayString())
                }
                setdisplayString(displayString:  "-" +  getdisplayString())
                forExpresionLabelSpecialCase = getdisplayString()
                CheckDoubleCharactersFromDisplayString(seqToRemove: "--", toReplace: "",signal: 3)
            }
            else if  getResult() != nil  {
                setOperator(operatr: "-")//operatr = "-"
                displayString = ["-", getResult() as? String].compactMap{$0}.joined()
                forExpresionLabelSpecialCase = getdisplayString()
                resultString = displayString
                //
                setcalculationString(calculationString: ["-","\( getResult() ?? "0")"].compactMap{$0}.joined())
                setdisplayString(displayString: ["-","\( getResult() ?? "0")"].compactMap{$0}.joined())
                forExpresionLabelSpecialCase = getdisplayString()
                //
                CheckDoubleCharactersFromDisplayString(seqToRemove: "--", toReplace: "",signal: 3)
            }
            else {
                setOperator(operatr: "-")//operatr = "-"
                calculationString = "-" + calculationString
                //
            }
            
        case "=":
            handleExpression()
            
        default:
            setresultString(resultString: "Wrong key Entered")
        }
        
    }
    
    public func getUpdatedValues() -> (result: Any?,calculationString: String,displayString: String,resultString: String,operator: String) {
        return (self.result,self.calculationString,self.displayString,self.resultString,self.operatr)
    }
    
    public func CheckDoubleCharactersFromDisplayString(seqToRemove: String,toReplace: String, signal: Int){
        // 1 for * , 2 for /, 3 for +/- ,5 for '.'//
        if(displayString.contains(seqToRemove))
        {
            displayString = displayString.replacingOccurrences(of: seqToRemove, with: toReplace)
            //expressionLabel?.text = displayString
            
            if signal == 1 { // for multiplication
                calculationString = calculationString.replacingOccurrences(of: "**", with: "*")
            }
            else if signal == 2 {// for division {
                calculationString = calculationString.replacingOccurrences(of: "*1.0/*1.0/", with: "*1.0/")
            }
            else if signal == 3 { // for +/-
                if result != nil {
                    let temp : String =  "\(result ?? "0")"
                    resultString = temp.replacingOccurrences(of: "-", with: "")
                }
                else {
                    //                      resultString = displayString
                }
                calculationString = displayString
            }
            else if signal == 5 { // for '.'
                calculationString = calculationString.replacingOccurrences(of: "..", with: ".")
            }
        }
    }
    
    public func handleExpression(){
        if calculationString.isEmpty == false {
            while calculationString.last == "+" || calculationString.last == "-" || calculationString.last == "/" ||  calculationString.last == "*" ||  calculationString.last == "%"
            {
                calculationString = String(calculationString.dropLast())
                displayString = String(displayString.dropLast())
            }
            if calculationString.isEmpty {
                //                   expressionLabel?.text = calculationString
                resultString = calculationString
                displayString = calculationString
                result = calculationString
            }
            else
            {
                if String(calculationString.last!).isInt == false &&  String(calculationString.last!) != "." { //added at 1:00 AM
                    calculationString = String(calculationString.dropLast())
                    displayString = calculationString
                    resultString = displayString
                }
                else if calculationString.contains(".") &&  result == nil {
                    if calculationString.last! == "."{
                        displayString = calculationString
                        resultString = displayString
                        displayString = " "
                    }
                    else {
                        calculationString = displayString
                        resultString = displayString
                    }
                    
                }
                else if result != nil {
                    //forExpresionLabelSpecialCase = displayString
                    forExpresionLabelSpecialCase = resultString
                    displayString = "" // recent update
                    calculationString = ""
                    
                }
                else {
                    let expression = NSExpression(format: calculationString)
                    result = expression.expressionValue(with: nil, context: nil) ?? nil
                    displayString = ""
                    calculationString = ["","\(result ?? "0")"].compactMap{$0}.joined()
                  
                    resultString =  "\(result ?? "0")"
                }
            }
        }
        else {
            displayString = ""
            resultString = displayString
            
        }
    }
    
    
}
