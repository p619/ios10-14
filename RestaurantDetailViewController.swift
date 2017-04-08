//
//  RestaurantDetailViewController.swift
//  ios10ch9
//
//  Created by heroshi on 2017/4/4.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit


class RestaurantDetailViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    var restaurant:Restaurant!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantDetailCellTableViewCell
        
        switch indexPath.row {
        
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
            
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
            
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        
        case 3:
            cell.fieldLabel.text = "Been heere"
            cell.valueLabel.text = (restaurant.isVisited) ? "Yes, I`ve been here before" : "no"
            
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


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
