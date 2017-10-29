//
//  DetailViewController.swift
//  PhoneList
//
//  Created by 张德茂 on 2017/10/28.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var headViewImage: UIImageView!
    var imageURL:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        headViewImage.image = UIImage(named: imageURL!)
        
        headViewImage?.contentMode = .scaleAspectFill
        headViewImage!.layer.cornerRadius = 45
        headViewImage!.layer.masksToBounds = true
        self.title = "Info Card"
        self.navigationController?.navigationBar.titleTextAttributes=[NSForegroundColorAttributeName:UIColor.white]
        var rightBarItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarItem
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
