//
//  HabitDataTableViewCell.swift
//  TimeManger
//
//  Created by 冯奕琦 on 2019/5/8.
//  Copyright © 2019 冯奕琦. All rights reserved.
//

import UIKit

class HabitDataTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var habitTitle: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    
    var data:HabitData!
    func setDataIn(data:HabitData,isHaventDoneCell:Bool){
        self.data = data
        //设置数据
        if isHaventDoneCell {
            habitTitle.text = data.name
            background.backgroundColor = UIColor.red
            hourLabel.text = data.lastWeekHaventDoneTime.changeToString()
            daysLabel.text = "\(data.lastWeekHaventDoneFrequancy)天"
        }else{
            habitTitle.text = data.name
            background.backgroundColor = data.colorInt.changeToAColor()
            hourLabel.text = ""
            daysLabel.text = "\(data.totalExecuteDays)天"
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //Segue
        print("select this view \(data.name) \(selected)")
        if selected == true {
            UIApplication.topViewController()!.performSegue(withIdentifier: "segueToHabitDetailVC", sender: data)
        }
    }

}
