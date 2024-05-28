//
//  CurencyDetailViewController.swift
//  TemplateProject
//
// Created by chiranjeevi on 28/05/24
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var curencyLabel: UILabel!
    @IBOutlet weak var bodylabel: UILabel!
    var userDetails: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User details"
       
        self.curencyLabel.text = "\(userDetails?.id ?? 0): \(userDetails?.title ?? "")"
        self.bodylabel.text = userDetails?.body ?? ""
    }
    

}
