//
//  ViewController.swift
//  Calculator
//
//  Created by Osagie Obaze on 12/1/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var holder: UIView!
    
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label .textAlignment = .right
        label.font = UIFont(name: "Helvetica", size: 100)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        numberPad()
    }
    
    private func numberPad(){
        let buttonSize = view.frame.size.width / 4
        
        let zeroButton = UIButton(frame:CGRect(x: 0, y: holder.frame.size.height - buttonSize, width: buttonSize * 3, height: buttonSize))
        zeroButton.setTitleColor(.black, for: .normal)
        zeroButton.backgroundColor = .white
        zeroButton.setTitle("0", for: .normal)
        holder.addSubview(zeroButton)
        
        for x in 0..<3{
            let button1 = UIButton(frame:CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height - (buttonSize*2), width: buttonSize, height: buttonSize))
            button1.setTitleColor(.black, for: .normal)
            button1.backgroundColor = .white
            button1.setTitle("\(x+1)", for: .normal)
            holder.addSubview(button1)
        }
        
        for x in 0..<3{
            let button2 = UIButton(frame:CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height - (buttonSize*3), width: buttonSize, height: buttonSize))
            button2.setTitleColor(.black, for: .normal)
            button2.backgroundColor = .white
            button2.setTitle("\(x+4)", for: .normal)
            holder.addSubview(button2)
        }
        
        for x in 0..<3{
            let button3 = UIButton(frame:CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height - (buttonSize*4), width: buttonSize, height: buttonSize))
            button3.setTitleColor(.black, for: .normal)
            button3.backgroundColor = .white
            button3.setTitle("\(x+7)", for: .normal)
            holder.addSubview(button3)
        }
        
        let clearButton = UIButton(frame:CGRect(x: 0, y: holder.frame.size.height - buttonSize*5, width:view.frame.size.width - buttonSize, height: buttonSize))
        clearButton.setTitleColor(.black, for: .normal)
        clearButton.backgroundColor = .white
        clearButton.setTitle("Clear", for: .normal)
        holder.addSubview(clearButton)
        
        let operations = ["=","+","-","x", "/"]
        
        for x in 0..<5{
            let button4 = UIButton(frame:CGRect(x: buttonSize * 3, y: holder.frame.size.height - (buttonSize * CGFloat(x+1)), width: buttonSize, height: buttonSize))
            button4.setTitleColor(.white, for: .normal)
            button4.backgroundColor = .orange
            button4.setTitle(operations[x], for: .normal)
            holder.addSubview(button4)
        }
        
        resultLabel.frame = CGRect(x: 20, y: clearButton.frame.origin.y - 110, width: view.frame.size.width - 40, height: 100)
        holder.addSubview(resultLabel)
        
        //Actions
        clearButton.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        
        
    }
    
    //CONTINUE HERE
    @objc func clearResult(){
        resultLabel.text = "0"
    }
    
    @objc func numberPressed(_ sender: UIButton){
        let tag = sender.tag - 1
        
        if resultLabel.text == "0"{
            resultLabel.text = "\(tag)"
        }
        else{
            resultLabel.text = "\(resultLabel.text)\(tag)"
        }
        
    }

}

