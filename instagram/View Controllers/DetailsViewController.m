//
//  DetailsViewController.m
//  instagram
//
//  Created by Angel Gutierrez on 7/10/20.
//  Copyright © 2020 Angel Gutierrez. All rights reserved.
//

#import "DetailsViewController.h"
#import "PFImageView.h"
#import "DateTools.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet PFImageView  *pictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.captionLabel.text = self.post[@"caption"];
	self.pictureImageView.file = self.post[@"image"];
	
	NSDate *createdAtOriginalString = [self.post createdAt];
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	// Configure the input format to parse the date string
	formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
	[formatter setDateFormat:@"h:mm a"];
	self.timeLabel.text = [formatter stringFromDate:createdAtOriginalString];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
