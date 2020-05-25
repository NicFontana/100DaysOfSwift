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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picturesNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = picturesNames[indexPath.row]
        return cell
    }

}

