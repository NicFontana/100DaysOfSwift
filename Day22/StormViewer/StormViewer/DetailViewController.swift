//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Niccolò Fontana on 26/05/2020.
//  Copyright © 2020 Niccolò Fontana. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // When the basic stuff of DetailViewController's initialization
    // has been done (allocating enough memory to hold it
    // all, for example), iOS goes ahead and loads the layout from the
    // storyboard, then connects all the outlets from the storyboard to the
    // code.
    // When the DetailViewController is first made, the UIImageView doesn't
    // exist because it hasn't been created yet – but we still need to have
    // some space for it in memory. At this point, the property is nil, or
    // just some empty memory. But when the view gets loaded and the outlet
    // gets connected, the UIImageView will point to a real UIImageView, not
    // to nil, so we can start using it.
    @IBOutlet weak var imageView: UIImageView!
    
    var numberOfImages: Int?
    var selectedImageNumber: Int?
    var selectedImageName: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let n = selectedImageNumber, let total = numberOfImages {
            title = "Picture \(n) of \(total)"
        }
        
        // this is the configuration of the navigation bar only for this screen
        navigationItem.largeTitleDisplayMode = .never
        
        // give users a way to trigger sharing
        // The action parameter is saying "when you're tapped, call the shareTapped() method,"
        // and the target parameter tells the button that the method belongs to the current view controller – self
        // Selectors are a simple way of saying "here's the function I want you to run". They pre-date Swift.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImageName {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let imageData = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image is available")
            return
        }
        
        // UIActivityViewController is the iOS method of sharing content with other apps and services
        // We tell it what kind of data we want to share, and it figures out how best to share it
        // We pass in two items: an array of items we want to share, and an array of any of our own app's services we want to make sure are in the list. For example: "Other pictures like this" functionality
        let activityVC = UIActivityViewController(activityItems: [imageData, selectedImageName!], applicationActivities: [])
        
        // To make it works on iPad: we tell iOS where the activity view controller should be anchored – where it should appear from.
        // On iPhone, activity view controllers automatically take up the full screen, so this is ignored.
        activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(activityVC, animated: true)
        // Remember to edit Info.plist adding the key "Privacy - Photo Library Additions Usage Description" with a message, otherwise the user won't be able to save the image.
        // This file is there to describe things like the name going under our icon, any special URLs we want to handle, or system messages we want to show to users.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
