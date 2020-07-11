//
//  TimelineViewController.m
//  instagram
//
//  Created by Angel Gutierrez on 7/9/20.
//  Copyright © 2020 Angel Gutierrez. All rights reserved.
//

#import "TimelineViewController.h"
#import "LoginViewController.h"
#import "DetailsViewController.h"
#import "PostCell.h"
#import "Post.h"
#import "SceneDelegate.h"
#import "Parse/Parse.h"

@interface TimelineViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *posts;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.rowHeight = 450;
	
    self.refreshControl = [[UIRefreshControl alloc] init];
	[self.refreshControl addTarget:self action:@selector(fetchPosts) forControlEvents:UIControlEventValueChanged];
	[self.tableView insertSubview:self.refreshControl atIndex:0];
	
	[self fetchPosts];
}

- (void)fetchPosts {
	PFQuery *query = [PFQuery queryWithClassName:@"Post"];
	[query orderByDescending: @"createdAt"];
	query.limit = 20;
	
	[query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
		if (posts != nil) {
			NSLog(@"😎😎😎 Successfully loaded home timeline");
			self.posts = (NSMutableArray *) posts;
			
			[self.tableView reloadData];
		} else {
			NSLog(@"%@", error.localizedDescription);
		}
		[self.refreshControl endRefreshing];
	}];
}

- (IBAction)didTapLogout:(id)sender {
	NSLog(@"Logout getting called.");
	
	SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
	
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	
	LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
	
	sceneDelegate.window.rootViewController = loginViewController;
	
	[PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {}];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqual:@"detailsViewController"]) {
		UITableViewCell *tappedCell = sender;
		NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
		Post *post = self.posts[indexPath.row];
		
		DetailsViewController *detailsViewController = [segue destinationViewController];
		detailsViewController.post = post;
	}
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
	PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
	
	Post *post = self.posts[indexPath.row];
	cell.post = post;
	
	// cell.authourLabel.text = post.author;
	
	return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.posts.count;
}

@end
