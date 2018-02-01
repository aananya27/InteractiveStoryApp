//
//  PageController.swift
//  InteractiveStory
//
//  Created by Aananya on 20/01/18.
//  Copyright © 2018 Treehouse Island. All rights reserved.
//

import UIKit

class PageController: UIViewController {
    
    var page : Page?
    required init?(coder aDecoder: NSCoder) {
  
        super.init(coder:aDecoder)
    }
    init(page: Page){
        self.page = page
        super.init(nibName: nil, bundle: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       view.backgroundColor = .blue
        // optional property therefore unwrap it:
        
        if let page = page{
            print(page.story.text)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
