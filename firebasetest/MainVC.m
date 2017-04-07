//
//  ViewController.m
//  firebasetest
//
//  Created by Olivier on 03/04/2017.
//  Copyright © 2017 maestun. All rights reserved.
//

#import "MainVC.h"
@import FirebaseDatabase;
@import FirebaseAuth;

@interface MainVC ()
@property (strong, nonatomic) FIRDatabaseReference *dbRef;
@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)uploadFromCSV {
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"csv"];
    NSData * data = [NSData dataWithContentsOfFile:path];
    NSString * str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray * lines = [str componentsSeparatedByString:@"\n"];
    for(NSString * line in lines) {
        NSArray * fields = [line componentsSeparatedByString:@","];
        if([fields count] >= 4) {
            NSString * email = fields[0];
            NSString * fname = fields[1];
            NSString * lname = fields[2];
            NSString * dname = fields[3];
            
            FIRDatabaseReference * db = [[FIRDatabase database] reference];
            FIRDatabaseReference * player = [[db child:@"players"] childByAutoId];
            [player setValue:@{@"email": email, @"fname": fname, @"lname": lname, @"dname": dname, @"nfcid": @""}];
            
            // change a single prop
//            [[player child:@"email"] setValue:@"other_email"];
        }
    }
}


- (IBAction)onBLEClicked:(id)sender {
}
- (IBAction)onImportClicked:(id)sender {
    [self uploadFromCSV];
}
- (IBAction)onUploadClicked:(id)sender {
}
- (IBAction)onPairingClicked:(id)sender {
    UIViewController * vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"idNFCPairingVC"];
    [[self navigationController] pushViewController:vc animated:YES];
}


@end
