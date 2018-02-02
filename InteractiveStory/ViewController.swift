//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Aananya

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure"{
            //the return type is simply a UIViewcontroller object
            //as! - implies = "this might trap"
            //as? - implies = "might be nil"
            
            guard let pageController = segue.destination as? PageController else {return }
            //assigning the value to the page property
            pageController.page = Adventure.story
        }
    }


}

