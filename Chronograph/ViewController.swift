//
//  ViewController.swift
//  Chronograph
//
//  Created by wwk on 2017/11/27.
//  Copyright © 2017年 wwk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 计时器对象(Timer())代表创建一个计时器, 并安排它在一定时间内执行一个固定循环动作
    var mainTimer = Timer()
    var defaultTime: Int = 0
    // 创建一个符号来确认是否开始计时
    var isStartFlag: Bool = false
    @IBOutlet weak var displayTimeLabel: UILabel!
    
    // 停止计时的按钮
    @IBAction func stopTime(_ sender: UIBarButtonItem) {
        // 按下按钮后, 停止计时
        mainTimer.invalidate()
        isStartFlag = false
    }
    
    // 开始计时的按钮
    @IBAction func startTime(_ sender: UIBarButtonItem) {
        // 按下此按钮后开始计时
        // 判断是否已经开始计时
        if !isStartFlag {
            // timeInterval: 代表计时的间隔(每秒)
            // target: 接收计时器发出信息的对象(整个ViewController类)
            // selector: 代表要被计时器重复操作的动作(方法)
            // userInfo: 代表要发给用户的信息(nil)
            // repeats: 代表是否执行循环(true or false)
            mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(doSomethingInTimer), userInfo: nil, repeats: true)
            mainTimer.fire() // 解决再次按下按钮暂停时的延迟问题, fire()立即发送信息给target, 及时响应时间变化
            isStartFlag = true
        } else {
            mainTimer.invalidate()
            isStartFlag = false
        }
    }
    
    // 重置计时的按钮
    @IBAction func timeReset(_ sender: UIBarButtonItem) {
        // 按下按钮后先暂停计时, 重置计时, 回归到0
        mainTimer.invalidate()
        defaultTime = 0
        isStartFlag = false
        displayTimeLabel.text = String(defaultTime)
    }
    
    // selector: 要被计时器重复操作的动作(方法)
    // 每一秒都需要执行的动作
    @objc func doSomethingInTimer() {
        defaultTime += 1
        // 将每秒的计算结果放到Label中, 使其实时显示在屏幕上
        displayTimeLabel.text = String(defaultTime)
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

