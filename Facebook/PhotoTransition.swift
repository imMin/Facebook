//
//  PhotoTransition.swift
//  Facebook
//
//  Created by Min Hu on 6/5/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotoTransition: BaseTransition {
	
	override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
		
		var newsFeedViewController = fromViewController as! NewsFeedViewController
		var photoViewController = toViewController as! PhotoViewController
		
//		toViewController.view.alpha = 0
		
		var destinationImageFrame = photoViewController.weddingImage.frame
		photoViewController.weddingImage.frame = newsFeedViewController.selectedImageView.frame
		
		UIView.animateWithDuration(duration, animations: {
//			toViewController.view.alpha = 1
			photoViewController.weddingImage.frame = destinationImageFrame
			}) { (finished: Bool) -> Void in
				self.finish()
		}
	}
	
	override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
		
		
		var newsFeedViewController = toViewController as! NewsFeedViewController
		var photoViewController = fromViewController as! PhotoViewController
		
		fromViewController.view.alpha = 1
		var destinationImageFrame = newsFeedViewController.selectedImageView.frame
		newsFeedViewController.selectedImageView.frame = photoViewController.weddingImage.frame
		print (destinationImageFrame)
		print (newsFeedViewController.selectedImageView.frame)
		
		UIView.animateWithDuration(duration, animations: {
//			fromViewController.view.alpha = 0
			newsFeedViewController.selectedImageView.frame = destinationImageFrame
			}) { (finished: Bool) -> Void in
				self.finish()
		}
	}

}
