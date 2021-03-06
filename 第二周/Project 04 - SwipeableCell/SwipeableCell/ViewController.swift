//
//  ViewController.swift
//  SwipeableCell
//
//  Created by Allen on 16/1/27.
//  Copyright © 2016年 AppKitchen. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var data = [
        MyCell(image: "1", name: "Pattern Building"),
        MyCell(image: "2", name: "Joe Beez"),
        MyCell(image: "3", name: "Car It's car"),
        MyCell(image: "4", name: "Floral Kaleidoscopic"),
        MyCell(image: "5", name: "Sprinkle Pattern"),
        MyCell(image: "6", name: "Palitos de queso"),
        MyCell(image: "7", name: "Ready to Go? Pattern"),
        MyCell(image: "8", name: "Sets Seamless"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatternCell", for: indexPath) as! PatternCell
        
        let pattern = data[indexPath.row]
        
        cell.patternImageView.image = UIImage(named: pattern.image)
        cell.patternNameLabel.text = pattern.name
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .normal, title: "🗑\nDelete") { action, index in
            print("Delete button tapped")
        }
        
//      let bgImage = UIImageView(image: UIImage(named: "love"))
        delete.backgroundColor = UIColor.gray
//      more.addSubview(bgImage)

        let share = UITableViewRowAction(style: .normal, title: "🤗\nShare") { (action: UITableViewRowAction!, indexPath: IndexPath) -> Void in
            
            let firstActivityItem = self.data[indexPath.row]
            
            let activityViewController = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            
            self.present(activityViewController, animated: true, completion: nil)
        }
    
        share.backgroundColor = UIColor.red
    
        let download = UITableViewRowAction(style: .normal, title: "⬇️\nDownload") { action, index in
            print("Download button tapped")
        }
        download.backgroundColor = UIColor.blue
        
        return [download, share, delete]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    }
    
}

