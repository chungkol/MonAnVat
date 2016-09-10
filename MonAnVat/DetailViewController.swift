//
//  DetailViewController.swift
//  MonAnVat
//
//  Created by Chung on 9/10/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var monAn: MonAn!
    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var detailName: UILabel!
    
    @IBOutlet weak var detailDes: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         detailImage.image = monAn.photo
        detailName.text = monAn.name
        detailDes.text = monAn.des
    }
    

    

}
