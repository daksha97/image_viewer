//
//  DetailViewController.swift
//  Project1
//
//  Created by Daksha Agarwal on 12/25/16.
//  Copyright © 2016 Daksha Agarwal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        
        func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.hidesBarsOnTap = true
        }
        func viewWillDisappear(_ animated: Bool){
            super.viewDidDisappear(animated)
            navigationController?.hidesBarsOnTap = false
        }
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad
            )
        }
    }
    
    func shareTapped() {
        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
    
}
