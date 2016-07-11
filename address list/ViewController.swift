//
//  ViewController.swift
//  address list
//
//  Created by 吴玉倩 on 16/7/6.
//  Copyright © 2016年 吴玉倩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var db:SQLiteDB!
    
    @IBOutlet weak var txtUname: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        //如果有数据则加载
        
    }
    
    //点击保存
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    
    //保存数据到SQLite
    func saveUser() {
        let txtUname = self.txtUname.text!
        let txtMobile = self.txtMobile.text!
        let txtEmail = self.txtEmail.text!
        let txtAddress = self.txtAddress.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into user(uname,mobile,email,address) values('\(txtUname)','\(txtMobile)','\(txtEmail)','\(txtAddress)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

