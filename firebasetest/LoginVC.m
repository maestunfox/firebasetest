//
//  LoginVC.m
//  firebasetest
//
//  Created by Olivier on 05/04/2017.
//  Copyright © 2017 maestun. All rights reserved.
//

#import "LoginVC.h"
#import <FirebaseAuth/FirebaseAuth.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface LoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *tfUser;
@property (weak, nonatomic) IBOutlet UITextField *tfPass;
@property (weak, nonatomic) IBOutlet UIButton *btLogin;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#ifdef DEBUG
    
    self.tfUser.text = @"toto@toto.com";
    self.tfPass.text = @"tototo";
    
#endif
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onLoginClicked:(id)sender {
    if([self.tfUser.text isEqualToString:@""] == NO &&
       [self.tfPass.text isEqualToString:@""] == NO) {

        [[self btLogin] setEnabled:NO];
        [SVProgressHUD showProgress:-1 status:@"Connexion..."];
        
        [[FIRAuth auth] signInWithEmail:self.tfUser.text password:self.tfPass.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
            
            [SVProgressHUD dismiss];
            [[self btLogin] setEnabled:YES];
            if(error) {
                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
            }
            else {
                UIViewController * plist = [[self storyboard] instantiateViewControllerWithIdentifier:@"idProjectListVC"];
                [[self navigationController] pushViewController:plist animated:YES];
            }
        }];
    }
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
