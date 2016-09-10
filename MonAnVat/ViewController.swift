//
//  ViewController.swift
//  MonAnVat
//
//  Created by Chung on 9/9/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {

    var dataManager =  Manager.sharedInstance
    var detailVC: DetailViewController!
    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        self.navigationController?.navigationBar.backgroundColor = UIColor.cyanColor()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil).first as! Cell
        
        let monAn = dataManager.data[indexPath.item] as! MonAn
        cell.selectionStyle = .None
        cell.lbNameCell.text = monAn.name
        cell.imLogoCell.layer.cornerRadius = 10
        cell.lbNameCell.layer.cornerRadius = 5
        cell.lbNameCell.layer.masksToBounds = true
        cell.imLogoCell.clipsToBounds = true
        cell.imLogoCell.image = monAn.photo
        
        
        return cell
    
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if detailVC == nil {
            detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as! DetailViewController
        }
        let monAn = dataManager.data[indexPath.row] as! MonAn
        detailVC.monAn = monAn
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            dataManager.data.removeObjectAtIndex(indexPath.item)
            myTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    

   
}

