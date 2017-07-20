//
//  ViewController.swift
//  ex4Swift
//
//  Created by VuHongSon on 7/19/17.
//  Copyright © 2017 VuHongSon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnOutEdit: UIButton!
    @IBOutlet weak var btnOutMove: UIButton!
    @IBOutlet weak var tblView: UITableView!
    
   

    var ver : Float = 2.1
    
    
    
    var tableData = ["01" , "02" , "03" , "04" , "05" ,"06" ,"07" , "08" ,"09" ,"10" ,"11"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView.isEditing {
            return .delete
        }
        return .none
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print(editingStyle)
        if editingStyle == .delete {
            tableData.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.lblVersion.text = "AV \(ver)"
        cell.lblCount.text = "Stt : " + tableData[indexPath.row]
        cell.imgView.image = #imageLiteral(resourceName: "apple")
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        cell.lblTime.text = formatter.string(from: NSDate() as Date)
        
        return cell
    }
    
}

extension ViewController {
    
    @IBAction func btnMove(_ sender: Any) {
        if btnOutMove.currentTitle == "Done"{
            btnOutMove.setTitle("Move", for: .normal)
            self.tblView.setEditing(false, animated: false)
        }else if (tableData.count > 0 && btnOutEdit.currentTitle == "Edit"){
            if btnOutMove.currentTitle == "Move"{
                btnOutMove.setTitle("Done", for: .normal)
                self.tblView.setEditing(true, animated: true)
            }
        }
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        if btnOutEdit.currentTitle == "Done"{
            btnOutEdit.setTitle("Edit", for: .normal)
            self.tblView.setEditing(false, animated: false)
        }else if (tableData.count > 0 && btnOutMove.currentTitle == "Move"){
            if btnOutEdit.currentTitle == "Edit"{
                btnOutEdit.setTitle("Done", for: .normal)
                self.tblView.setEditing(true, animated: true)
            }
        }
    }
}

