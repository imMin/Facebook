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
	@IBOutlet weak var actionBar: UIImageView!
	
	
	var photoTransition: PhotoTransition!
	var imageView : UIImage!
	var selectedImageNumber: Int!
	var currentImageNumber : Int!
	var weddingImages: [UIImageView]!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		print(selectedImageNumber)
		weddingImage = UIImageView()
		weddingImage.frame = CGRectMake(0, 60, 320, 464)
//		weddingImage.image = imageView.image 
		scrollView.delegate = self
		scrollView.contentSize = CGSizeMake(scrollViewContent.frame.width, scrollViewContent.frame.height)
		imageScrollView.contentSize = CGSize(width: 1600, height: 464)
		imageScrollView.delegate = self
		weddingImages = [weddingImageOne, weddingImageTwo, weddingImageThree, weddingImageFour, weddingImageFive]
    }
	
	override func viewDidAppear(animated: Bool) {
		imageScrollView.contentOffset.x = CGFloat(320 * selectedImageNumber)
		weddingImage = weddingImages[selectedImageNumber]
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
			actionBar.alpha = 1
			scrollView.setContentOffset(CGPointZero, animated: true)
		}
		else {
			delay(0.1, { () -> () in
				self.dismissViewControllerAnimated(true, completion: nil)
			})
		}
	}
	
	
	func scrollViewDidScroll(scrollView: UIScrollView) {
		if scrollView == self.scrollView {
			var alpha = convertValue(Float(abs(scrollView.contentOffset.y)), 0, 100.0, 1.0, 0.2)
			scrollView.backgroundColor = UIColor(white: 0, alpha: CGFloat(alpha))
			var buttonalpha = convertValue(Float(abs(scrollView.contentOffset.y)), 0, 20.0, 1.0, 0)
			doneButton.alpha = CGFloat(buttonalpha)
			actionBar.alpha = CGFloat(buttonalpha)
		}
	}
	
	
	func scrollViewWillBeginDragging(scrollView: UIScrollView) {
	}
	
	func scrollViewDidEndDragging(scrollView: UIScrollView,
		willDecelerate decelerate: Bool) {
			if scrollView == self.scrollView{
				resetPosition(scrollView)
			}
	}


	func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
		if scrollView == self.scrollView{
			resetPosition(scrollView)
		}
		else if scrollView == imageScrollView {
			currentImageNumber = Int(abs(imageScrollView.contentOffset.x / 320))
			weddingImage = weddingImages[currentImageNumber]
//			println(currentImageNumber)
		}
	}
	
	func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
		if scrollView == self.scrollView {
			imageScrollView.frame = CGRectMake(0, 60, 320, 464)
//			imageScrollView.contentSize = CGSize(width: 320, height: 464)
			weddingImages[currentImageNumber].frame.origin.x = 0
		}
		
		return weddingImages[currentImageNumber]
	}
}
