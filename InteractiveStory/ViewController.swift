//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Aananya

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure" {
            
            do{
                if let name = nameTextField.text{
                    if name == "" {
                        throw AdventureError.nameNotProvided
                    }else{
                        guard let pageController = segue.destination as? PageController else
                        { return }
                        
                        pageController.page = Adventure.story(withName: name)
                    }
                }
            }
            catch AdventureError.nameNotProvided {
                //here when user doesnt enter a name!
                let alertController = UIAlertController(title: "Name not provided", message: "Provide a name to start the story", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
                
            }
            catch let error{
                fatalError("\(error.localizedDescription)")
            }
            
            
           
        }
}
}
