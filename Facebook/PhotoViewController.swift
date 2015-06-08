//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Min Hu on 6/4/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
	@IBOutlet weak var scrollViewContent: UIView!
	@IBOutlet weak var doneButton: UIButton!
	@IBOutlet weak var scrollView: UIScrollView!
	var weddingImage: UIImageView!
	
	@IBOutlet weak var weddingImageOne: UIImageView!
	@IBOutlet weak var weddingImageTwo: UIImageView!
	@IBOutlet weak var weddingImageThree: UIImageView!
	@IBOutlet weak var weddingImageFour: UIImageView!
	@IBOutlet weak var weddingImageFive: UIImageView!
	@IBOutlet weak var imageScrollView: UIScrollView!
	
	
	var photoTransition: PhotoTransition!
	var imageView : UIImage!
	var imageNumber: Int!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		print(imageNumber)
		
//		imageScrollView.contentOffset.x = CGFloat(320 * imageNumber)
		
//		weddingImage.image = imageView.image 
		scrollView.delegate = self
		scrollView.contentSize = CGSizeMake(scrollViewContent.frame.width, scrollViewContent.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	@IBAction func didPressDoneButton(sender: AnyObject) {
		photoTransition = PhotoTransition()
		photoTransition.duration = 0.5
		
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	
	func resetPosition(scrollView: UIScrollView) {
		if abs(scrollView.contentOffset.y) < 100 {
			doneButton.alpha = 1
			scrollView.setContentOffset(CGPoint(x: scrollView.center.x, y: 0), animated: true)
		}
		else {
			delay(0.1, { () -> () in
				self.dismissViewControllerAnimated(true, completion: nil)
			})
		}
	}
	
	
	func scrollViewDidScroll(scrollView: UIScrollView) {
		var alpha = convertValue(Float(abs(scrollView.contentOffset.y)), 0, 100.0, 1.0, 0.2)
		scrollView.backgroundColor = UIColor(white: 0, alpha: CGFloat(alpha))
		var buttonalpha = convertValue(Float(abs(scrollView.contentOffset.y)), 0, 50.0, 1.0, 0)
		doneButton.alpha = CGFloat(buttonalpha)
	}
	
	
	func scrollViewWillBeginDragging(scrollView: UIScrollView) {
//		doneButton.alpha = 0
	}
	
	func scrollViewDidEndDragging(scrollView: UIScrollView,
		willDecelerate decelerate: Bool) {
			resetPosition(scrollView)
	}


	func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
		resetPosition(scrollView)
	}
	
//	func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
////		return weddingImage
//	}

	
}
