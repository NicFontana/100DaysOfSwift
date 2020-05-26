//
//  ViewController.swift
//  StormViewer
//
//  Created by Niccolò Fontana on 25/05/2020.
//  Copyright © 2020 Niccolò Fontana. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var picturesNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // File System interaction
        let fileManager = FileManager.default
        
        // Get the app's main bundle: by using a bundle object, you can access a bundle's resources without knowing the structure of the bundle.
        // The main bundle object gives you access to the resources that shipped with your app: our compiled program and all our assets
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        // It's perfectly fine to use ! here: if this code fails it means our app can't read its own data so something must be seriously wrong
         
        for item in items {
            if item.hasPrefix("nssl") {
                picturesNames.append(item)
            }
        }
    }
    
    // This code will be triggered when iOS wnats to know how many rows are in the TableView at the specified section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picturesNames.count
    }

    // Triggered when iOS wants the cell at the specified IndexPath, IndexPath is a data type that contains both a section and a row number
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = picturesNames[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        let detailVC = storyboard?.instantiateViewController(identifier: "Detail") as! DetailViewController
        
        // 2: success! Set its selectedImage property
        detailVC.selectedImage = picturesNames[indexPath.row]
        
        // 3: now push it onto the navigation controller
        navigationController?.pushViewController(detailVC, animated: true)
        // each new view controller that pushed onto the navigation controller stack inherits the style of its predecessor.
    }

}

