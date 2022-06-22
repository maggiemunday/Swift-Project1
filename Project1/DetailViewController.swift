//
//  DetailViewController.swift
//  Project1
//
//  Created by Maggie Munday on 6/15/22.
//

import UIKit

class DetailViewController: UIViewController {
    //@IBOutlet tells program that there is a connection between this line of code and interface builder
    //need to reserve space for the imageView, but it will be set to nil until an image is assigned and loaded --> why we make it an implicitly unwrapped optional 
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedPictureNumber = 0
    var totalPictures = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(selectedPictureNumber) of \(totalPictures)"
        //selectedImage
        navigationItem.largeTitleDisplayMode = .never //screen configuration just for this one screen

        // Do any additional setup after loading the view.
        
        //checks if image is nil
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    //methods that make navigation bar appear/disappear when you tap on the screen
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
