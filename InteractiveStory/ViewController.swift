//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Aananya

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var textFieldBotoomContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)),   name: Notification.Name.UIKeyboardWillShow, object: nil)
        
          NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)),   name: .UIKeyboardWillHide, object: nil)
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
    
    
    
    func keyboardWillShow(_ notification : Notification){
        if let info = notification.userInfo , let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let frame = keyboardFrame.cgRectValue
            textFieldBotoomContraint.constant = frame.size.height + 10
            UIView.animate(withDuration: 0.8){
                self.view.layoutIfNeeded()
            }
            
    
            
            
        }
        
        
        
    }
    func keyboardWillHide(_ notification : Notification){
        
        textFieldBotoomContraint.constant = 40
        UIView.animate(withDuration: 0.8){
            
            self.view.layoutIfNeeded()
        }
        
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ViewController:UITextFieldDelegate {
    //called when done button is pressd
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

























