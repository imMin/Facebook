//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIViewControllerTransitioningDelegate {
	
	var selectedImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
	@IBOutlet weak var weddingOneImage: UIImageView!
	@IBOutlet weak var weddingTwoImage: UIImageView!
	@IBOutlet weak var weddingThreeImage: UIImageView!
	@IBOutlet weak var weddingFourImage: UIImageView!
	@IBOutlet weak var weddingFiveImage: UIImageView!
	@IBOutlet var tapImageOne: UITapGestureRecognizer!
	@IBOutlet var tapImageTwo: UITapGestureRecognizer!
	@IBOutlet var tapImageThree: UITapGestureRecognizer!
	@IBOutlet var tapImageFour: UITapGestureRecognizer!
	@IBOutlet var tapImageFive: UITapGestureRecognizer!
	var weddingImages: [UIImageView]!
	
	var photoTransition : PhotoTransition!
	var selectedImageNumber: Int!
	var currentImageNumber: Int!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		weddingImages = [weddingOneImage, weddingTwoImage, weddingThreeImage, weddingFourImage, weddingFiveImage]

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
	
	@IBAction func didTapPhoto(sender: UITapGestureRecognizer) {
		for (var i = 0; i < 5; i++){
			if weddingImages[i] == sender.view{
				selectedImageNumber = i
				currentImageNumber = i 
			}
		}
		
		selectedImageView = sender.view as! UIImageView
		performSegueWithIdentifier("photoSegue", sender: self)
	}
	
	
	override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject?) {
		//var newsFeedViewController = segue.sourceViewController as! UIViewController
		var photoViewController = segue.destinationViewController as! PhotoViewController
		var identifier = segue.identifier
		photoViewController.imageView = selectedImageView.image
		photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
		
		photoTransition = PhotoTransition()
		photoTransition.duration = 0.5
		photoTransition.newsFeedViewController = self
		
		photoViewController.transitioningDelegate = photoTransition
		
//		toViewController.transitioningDelegate = self
	}
}
