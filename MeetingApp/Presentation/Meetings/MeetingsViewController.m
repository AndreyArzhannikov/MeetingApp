//
//  MeetingsViewController.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 17.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "MeetingsViewController.h"
#import "MeetingsTableViewCell.h"

NSString * const kCellReuseIdentifier = @"MeetingsTableViewCell";

@interface MeetingsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation MeetingsViewController

- (instancetype)initWithPresenter:(MeetingListPresenter *)presenter {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _presenter = presenter;
        _presenter.view = self;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(4, 0, 0, 0);
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.tableView registerClass:MeetingsTableViewCell.class forCellReuseIdentifier:kCellReuseIdentifier];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
}

//MARK: - MeetingsListView

- (void)showMeetingsList:(NSArray *)meetings {
    [self.tableView reloadData];
}

- (void)selectMeeting:(Meeting *)meeting {
    NSInteger index = [self.presenter.meetingsList indexOfObject:meeting];
    if (index != NSNotFound) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition: UITableViewScrollPositionMiddle];
    } else {
        NSLog(@"Wrong index for meeting: %@", meeting.name);
    }
}

- (void)deselectMeeting {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)notifyDelegateMeetingDidSelect:(Meeting *)meeting {
    [self.delegate meetingsViewController:self didSelectMeeting:meeting];
}

// TODO: Refactor it, e.g extract to DataDisplayHelper
//MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.presenter.meetingsList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MeetingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier];
    if (cell == nil) {
        cell = [[MeetingsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:kCellReuseIdentifier];
    }
    Meeting *meeting = self.presenter.meetingsList[indexPath.row];
    cell.nameLabel.text = meeting.name;
    cell.organizationLabel.text = meeting.organization.name;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 112.0f;
}

//MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.presenter meetingDidSelectAt:indexPath.row];
}

@end
