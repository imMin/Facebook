//
//  PhotoTransition.swift
//  Facebook
//
//  Created by Min Hu on 6/5/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotoTransition: BaseTransition {
	var newsFeedViewController: NewsFeedViewController!
	var window = UIApplication.sharedApplication().keyWindow
	
	override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
		var imageView: UIImageView!
		
		//var newsFeedViewController = fromViewController as! NewsFeedViewController
		var photoViewController = toViewController as! PhotoViewController
		
		imageView = UIImageView()
		imageView.contentMode = .ScaleAspectFill
		imageView.clipsToBounds = true
		imageView.image = newsFeedViewController.selectedImageView.image
		imageView.frame = window!.convertRect(newsFeedViewController.selectedImageView.frame, fromView: newsFeedViewController.scrollView)
		window!.addSubview(imageView)

		
		toViewController.view.alpha = 0
		var destinationImageFrame = photoViewController.weddingImage.frame
		photoViewController.selectedImageNumber = newsFeedViewController.selectedImageNumber
		photoViewController.currentImageNumber = newsFeedViewController.selectedImageNumber

		
		UIView.animateWithDuration(duration, animations: {
//			photoViewController.weddingImage.frame = destinationImageFrame
			imageView.frame = destinationImageFrame
			}) { (finished: Bool) -> Void in
				imageView.removeFromSuperview()
				toViewController.view.alpha = 1
				self.finish()
		}
	}
	
	override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
		var imageView: UIImageView!
		var destinationImage: UIImageView!
		destinationImage = UIImageView()
		imageView = UIImageView()
		
		//var newsFeedViewController = toViewController as! NewsFeedViewController
		var photoViewController = fromViewController as! PhotoViewController
		newsFeedViewController.currentImageNumber = photoViewController.currentImageNumber
		
		destinationImage.frame = window!.convertRect(newsFeedViewController.weddingImages[newsFeedViewController.currentImageNumber].frame, fromView: newsFeedViewController.scrollView)
		
		var photoFrame = window!.convertRect(photoViewController.weddingImage.frame, fromView: photoViewController.scrollView)
		
		imageView.frame = photoFrame
		imageView.image = photoViewController.weddingImage.image
		imageView.contentMode = .ScaleAspectFill
		imageView.clipsToBounds = true
		window?.addSubview(imageView)
		
		fromViewController.view.alpha = 0
		
		
		UIView.animateWithDuration(duration, animations: {
			imageView.frame = destinationImage.frame
			}) { (finished: Bool) -> Void in
				imageView.removeFromSuperview()
				self.finish()
		}
	}

}
