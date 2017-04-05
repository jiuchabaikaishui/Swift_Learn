//
//  ViewController.swift
//  FollowMe
//
//  Created by 綦 on 17/4/3.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {
    /// 按钮颜色的枚举
    ///
    /// - Red: 红色
    /// - Green: 绿色
    /// - Blue: 蓝色
    /// - Cyan: 青色
    enum ButtonColor : Int {
        case Red = 0
        case Green = 1
        case Blue = 2
        case Cyan = 3
    }
    
    /// 操作对象的枚举
    ///
    /// - Human: 玩家
    /// - computer: 电脑
    enum WhoseTurn {
        case Human
        case computer
    }
    
    //4个按钮
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var cyanButton: UIButton!
    
    
    /// 按钮的点击方法
    ///
    /// - Parameter sender: 被点击的按钮
    @IBAction func colorButtonAction(_ sender: UIButton) {
        //判断操作对象
        if currentPlayer == .computer {
            return
        }
        
        //根据被点击的按钮获知按钮的颜色
        var senderColor: ButtonColor = .Red
        if sender == redButton {
            senderColor = .Red
        }
        if sender == greenButton {
            senderColor = .Green
        }
        if sender == blueButton {
            senderColor = .Blue
        }
        if sender == cyanButton {
            senderColor = .Cyan
        }
        
        //判断是否点击正确
        if senderColor == inputs[indexOfNexButtonTotTouch] {
            indexOfNexButtonTotTouch += 1
            if indexOfNexButtonTotTouch == inputs.count {
                //判断是否胜利
                if advanceGame() == false {
                    //胜利操作
                    playerWins()
                }
                
                //清零计数
                indexOfNexButtonTotTouch = 0
            }
            else
            {
                
            }
        }
        else
        {
            //游戏失败，清零计数
            playerLoses()
            indexOfNexButtonTotTouch = 0
        }
    }
    
    //胜利操作
    func playerWins() {
        let winner: UIAlertView = UIAlertView.init(title: "你赢啦", message: "恭喜你！", delegate: self, cancelButtonTitle: "继续")
        winner.show()
    }
    
    //失败操作
    func playerLoses() {
        let winner: UIAlertView = UIAlertView.init(title: "你输啦", message: "还得加油啊！", delegate: self, cancelButtonTitle: "继续")
        winner.show()
    }
    
    //UIAlertView代理方法
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if buttonIndex == 0 {
            startNewGame()
        }
    }
   
    //根据颜色获取按钮
    func buttonByColor(buttonColor: ButtonColor) -> UIButton {
        switch buttonColor {
        case .Red:
            return redButton
        case .Green:
            return greenButton
        case .Blue:
            return blueButton
        default:
            return cyanButton
        }
    }
    
    //胜利的条件
    var winningNumber: Int = 10
    //记录每轮的点击次序
    var indexOfNexButtonTotTouch = 0
    //记录当前操作对象
    var currentPlayer: WhoseTurn = .computer
    //记录电脑操作的顺序
    var inputs = [ButtonColor]()
    //亮灯的时间
    var lightTime: Double = 0.5

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGame()
    }
    
    //启动游戏
    func startNewGame() {
        //清空电脑操作的顺序
        inputs = [ButtonColor]()
        
        //进行游戏，开始电脑操作
        if !advanceGame() {
            print("游戏初始化出错！")
        }
    }
    
    
    /// 进行游戏，开始电脑操作
    ///
    /// - Returns: 电脑是否操作成功
    func advanceGame() -> Bool {
        //判断是否达到胜利的条件，确定操作对象
        if inputs.count >= winningNumber {
            return false
        }
        else
        {
            //随机添加一个亮灯的数据
            let buttonColor: ButtonColor = ButtonColor.init(rawValue: Int(arc4random())%4)!
            inputs += [buttonColor]
            
            //电脑开始安装inputs记录的顺序亮灯
            playSequence(index: 0, lightTime: lightTime)
        }
        
        return true
    }
    
    /// 电脑操作亮灯
    ///
    /// - Parameters:
    ///   - index: 从第几个开始亮灯
    ///   - lightTime: 亮灯时间
    func playSequence(index: Int, lightTime: Double) {
        //设置当前操作对象为电脑
        currentPlayer = .computer
        //判断是否该由电脑操作亮灯
        if index == inputs.count {
            //设置当前操作对象为玩家
            currentPlayer = .Human
            return
        }
        
        //获取需亮的按钮并记录颜色
        let button: UIButton = buttonByColor(buttonColor: inputs[index])
        let originalColor: UIColor? = button.backgroundColor
        
        //执行亮灯动画
        UIView.animate(withDuration: lightTime, animations: {
            button.backgroundColor = UIColor.white;
        }) { (finished) in
            if (finished)
            {
                button.backgroundColor = originalColor
                self.playSequence(index: index + 1, lightTime: lightTime)
            }
        }
    }


}

