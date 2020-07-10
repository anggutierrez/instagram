//
//  TimelineViewController.m
//  instagram
//
//  Created by Angel Gutierrez on 7/9/20.
//  Copyright © 2020 Angel Gutierrez. All rights reserved.
//

#import "TimelineViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "Parse/Parse.h"

@interface TimelineViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	// Tableview and Delegate init here

//    self.refreshControl = [[UIRefreshControl alloc] init];
//	[self.refreshControl addTarget:self action:@selector(fetchTweets) forControlEvents:UIControlEventValueChanged];
//	[self.tableView insertSubview:self.refreshControl atIndex:0];
}

- (IBAction)didTapLogout:(id)sender {
	NSLog(@"Logout getting called.");
	
	AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
	
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	
	LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
	
	appDelegate.window.rootViewController = loginViewController;
	
	[PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
		// PFUser.current() will now be nil
	}];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
}
 */

@end
