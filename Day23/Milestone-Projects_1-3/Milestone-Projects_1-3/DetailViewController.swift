//
//  DetailViewController.swift
//  Milestone-Projects_1-3
//
//  Created by Niccolò Fontana on 03/06/2020.
//  Copyright © 2020 Niccolò Fontana. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var flagFilename: String!
    var flag: String!
    @IBOutlet weak var flagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        title = flag
        flagImageView.image = UIImage(named: flagFilename)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionBarButtonTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    @objc func actionBarButtonTapped() {
        let imageData = flagImageView.image?.jpegData(compressionQuality: 0.8)
        
        let activityVC = UIActivityViewController(
            activityItems: [flag!, imageData!],
            applicationActivities: nil
        )
        
        activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(activityVC, animated: true)
    }
}
