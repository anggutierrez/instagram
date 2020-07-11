//
//  PostCell.m
//  instagram
//
//  Created by Angel Gutierrez on 7/10/20.
//  Copyright © 2020 Angel Gutierrez. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setPost:(Post *)post {
    _post = post;
	self.photoImageView.file = post[@"image"];
	 // Set other vars / UI elements here
	self.captionLabel.text = post[@"caption"];
	
	[self.photoImageView loadInBackground];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
