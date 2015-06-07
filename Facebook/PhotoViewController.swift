//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Min Hu on 6/4/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

	var imageView : UIImage!
	@IBOutlet weak var weddingImage: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		weddingImage.image = imageView

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	@IBAction func didPressDoneButton(sender: AnyObject) {
		dismissViewControllerAnimated(true, completion: nil)
	}

}
