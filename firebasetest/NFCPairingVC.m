//
//  NFCPairingVC.m
//  firebasetest
//
//  Created by Olivier on 03/04/2017.
//  Copyright © 2017 maestun. All rights reserved.
//

#import "NFCPairingVC.h"
@import FirebaseDatabase;

@interface NFCPairingVC ()
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbNFCID;
@property (strong, nonatomic) FIRDatabaseReference *dbRef;
@end

@implementation NFCPairingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dbRef = [[FIRDatabase database] reference];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onSkipClicked:(id)sender {
}
- (IBAction)onBeginClicked:(id)sender {
    FIRDatabaseReference * players = [[[FIRDatabase database] reference] child:@"players"];
 
    
    
    
    
    
    
}


@end
