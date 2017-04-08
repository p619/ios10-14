//
//  RestaurantTableViewController.swift
//  ios10ch9
//
//  Created by heroshi on 2017/4/2.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    
     var restaurantIsVisited = Array(repeating: false, count: 21)
    //重複false 21次的array
    
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen.jpg", isVisited: false)
    ]
    
    
    
    //設定cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        

        //cell.NameLabel.text = restaurantNames[indexPath.row]
        //合併array之前
        
        
        cell.NameLabel.text = restaurants[indexPath.row].name //合併array之後
        cell.ThumbnallImage.image = UIImage(named: restaurants[indexPath.row].image)
        
        cell.LocationLabel.text = restaurants[indexPath.row].location
        cell.TypeLabel.text = restaurants[indexPath.row].type
        
        //切圓角
        cell.ThumbnallImage.layer.cornerRadius = 10
        cell.ThumbnallImage.clipsToBounds = true
        
        
        /*
        if restaurantIsVisited[indexPath.row] == true {
        cell.accessoryType = .checkmark
        }
        else {
        cell.accessoryType = . none
        }
         */
        
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none //和上面的if else一樣
        
        return cell
    }


    //ch13
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return restaurants.count
    }
    
    //砍資料
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == . delete {
            restaurants.remove(at: indexPath.row)
            
                    }
        
        tableView.deleteRows(at: [indexPath], with: .fade)
        
           }
    
    
    //編輯row的動作
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath) -> Void in
            
        let defaultText = "just checking in at" + self.restaurants[indexPath.row].name//分享到臉書的字
            
            if let imageToShare = UIImage(named:self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems:[defaultText, imageToShare], applicationActivities: nil)//分享圖到fb
                self.present(activityController, animated: true, completion: nil)
            }
            
        let activityController = UIActivityViewController(activityItems:[defaultText], applicationActivities: nil)  //UIActivityViewController是share 臉書社群的動態控制器
        self.present(activityController, animated: true, completion: nil)
        } )
    
        
    let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "delete", handler: { (action, indexPath) -> Void in  //刪除功能del
        
        self.restaurants.remove(at: indexPath.row)
    
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    })
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha:1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha:1.0)
        
    return [deleteAction, shareAction]
}
    
    //轉場後要傳的資料ch12
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
                
            }
        }
        print("prepare")
    }
    
    override var prefersStatusBarHidden: Bool{
    return true //隱藏狀態列
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


}
