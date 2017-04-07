//
//  ProjectListVC.h
//  firebasetest
//
//  Created by Olivier on 05/04/2017.
//  Copyright © 2017 maestun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#import "Config.h"
#import "Project.h"

@interface ProjectListVC : UITableViewController <UITableViewDelegate, UITableViewDataSource, MGSwipeTableCellDelegate> {
    UIRefreshControl *  mRefresh;
}

@end
