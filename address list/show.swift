//
//  show.swift
//  address list
//
//  Created by 吴玉倩 on 16/7/6.
//  Copyright © 2016年 吴玉倩. All rights reserved.
//

import Foundation
import UIKit

class showController: UIViewController {
    
    
    
    var db:SQLiteDB!
    
    @IBOutlet weak var view1: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        //如果有数据则加载
        show()
    }
    
    func show()  {
        let data = db.query("select * from user")
        for var x=0;x<data.count;x++
        {
            let user = data[x]
            view1.text! += "联系人:" + String(user["uname"]!) + "\n" + "联系方式:" + String(user["mobile"]!) + "\n" + "邮箱:" + String(user["email"]!) + "\n" + "家庭住址" + String(user["address"]!) + "\n"
        }
    }
    
    @IBAction func d(sender: AnyObject) {
        let sql = "delete from user"
        let result = db.execute(sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
