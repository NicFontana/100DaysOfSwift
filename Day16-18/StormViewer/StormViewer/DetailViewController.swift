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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
