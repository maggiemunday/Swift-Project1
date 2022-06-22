//
//  ViewController.swift
//  Project1
//
//  Created by Maggie Munday on 6/15/22.
//

//UIKit = kit for iOS UI
import UIKit

//UIViewController = Apple's default screen (plain white until you change it)
//change to UITableViewController
class ViewController: UITableViewController {
    var pictures = [String()]
    
    
    //overrides viewDidLoad() method from the parent class, UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer" //title also automatically used as the back button
        navigationController?.navigationBar.prefersLargeTitles = true //enables large title
        
        //* remember!! fm, path, and items will terminate when the viewDidLoad() method does. we want to keep variables for as long as the screen is shown
        
        
        //FileManager = built in system type that lets us work with the file system
        let fm = FileManager.default
        
        //Bundle = directory containing our entire program and all our assets --> this tells us where we can find all the images you added to the app
        //'!' force unwraps an optional --> some other app Bundles don't have resource paths, but iOS always does, so okay to use ! here
        let path = Bundle.main.resourcePath!
        
        //array of Strings containing file names found in the path above
        //try! --> tries to read content of our resourcePath, and if we can't read the app Bundle, something id fundamentally wrong with the app, so we can use try!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        for item in items {
            if item.hasPrefix("nssl") {
                //this is a picture to load!
                pictures.append(item);
            }
        }
        pictures.sort()
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    //creates DetailViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

