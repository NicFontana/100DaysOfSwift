//
//  ViewController.swift
//  Milestone-Projects_1-3
//
//  Created by Niccolò Fontana on 02/06/2020.
//  Copyright © 2020 Niccolò Fontana. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var flagsFilename = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        let resourcePath = Bundle.main.resourcePath!
        let files = try! FileManager.default.contentsOfDirectory(atPath: resourcePath)
        
        for file in files {
            if file.hasSuffix(".png") {
                flagsFilename.append(file)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagsFilename.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
        
        let flag = flagsFilename[indexPath.row]
        cell.textLabel?.text = String(
            flag[..<flag.index(flag.endIndex, offsetBy: -4)]
        ).uppercased()
        
        cell.imageView?.image = UIImage(named: flag)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flag = flagsFilename[indexPath.row]
        
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailViewController
        
        detailVC.flagFilename = flag
        detailVC.flag = String(
            flag[..<flag.index(flag.endIndex, offsetBy: -4)]
        ).uppercased()
        
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

