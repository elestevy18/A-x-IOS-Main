//
//  VideoCell.swift
//  BeginnerTableView
//
//  Created by Sean Allen on 5/19/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import UIKit
//CREATE DELGATE FOR CUSTOM ACTION ON EACH CELL "ADD SET BUTTON"
protocol VideoCellDelegate {
      
      func didTapAddSet(title: String)
    
}

class VideoCell: UITableViewCell {
    
   // OUTLET TO OBJECTS IN THE CELL
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var progressText: UILabel!
    @IBOutlet weak var mavText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var videoItem: Video!
    var delegate: VideoCellDelegate?
       
    
    func setVideo(video: Video) {
        videoItem = video
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
        progressText.text    = video.progressText
        mavText.text         = video.mavText
        progressBar.progress = video.progress
        
    }
    

    
    @IBAction func addSetTapped(_ sender: Any) {
        delegate?.didTapAddSet(title: videoItem.title)
    }
    
    
}
