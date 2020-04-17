//
//  ViewController.swift
//  Swift5TableViewBasic
//
//  Created by km1987 on 2020/04/15.
//  Copyright © 2020 km1987. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tabelView: UITableView!
    
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "checkImage")
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        nextVC.toDoString = textArray[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height/6
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textArray.append(textField.text!)
        textField.resignFirstResponder()
        textField.text = ""
        tabelView.reloadData()
        
        return true
    }

}

