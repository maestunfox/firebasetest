//
//  ProjectListVC.m
//  firebasetest
//
//  Created by Olivier on 05/04/2017.
//  Copyright © 2017 maestun. All rights reserved.
//

#import "ProjectListVC.h"
#import <RESideMenu/RESideMenu.h>

@import FirebaseDatabase;

@interface ProjectListVC ()

@end

@implementation ProjectListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self tableView] setDelegate:self];
    [[self tableView] setDataSource:self];
    
    
    UIButton * add  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    UIImage * add_img = [ACUtils tintedImageWithColor:[UIColor whiteColor] image:[UIImage imageNamed:@"icon_add"]];
    [add setBackgroundImage:add_img forState:UIControlStateNormal];
    [add addTarget:self action:@selector(onAddClicked:) forControlEvents:UIControlEventTouchUpInside];
    [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:add]];

    
    mRefresh = [[UIRefreshControl alloc] init];
    [[self tableView] addSubview:mRefresh];
    [mRefresh addTarget:self action:@selector(onSyncClicked:) forControlEvents:UIControlEventValueChanged];

    
    [[[self navigationController] navigationBar] setBarTintColor:FlatBlue]; // change la couleur de fond de la barre
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]]; // change la teinte du bouton "< Back"
    [[[self navigationController] navigationBar] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                         [UIColor whiteColor], NSForegroundColorAttributeName,
                                                                         FONT_BOLD(FONT_SZ_MEDIUM), NSFontAttributeName,
                                                                         nil]];
    
    [[self navigationItem] setTitle:@"Mes Projets"]; // change le titre de la barre
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)onSyncClicked:(id)aSender {
//    [Project load:mProjectStore withDelegate:self];
    // TODO:
}


- (void)onAddClicked:(id)aSender {
    UIAlertController * ac = [UIAlertController alertControllerWithTitle:@"Nouveau Projet" message:@"Veuillez entrer un nom pour ce projet:" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSString * name = [[[ac textFields] objectAtIndex:0] text];
        if(name && [name isEqualToString:@""] == NO) {
            
            
            FIRDatabaseReference * db = [[FIRDatabase database] reference];
            FIRDatabaseReference * project = [[db child:@"projects"] childByAutoId];
            [project setValue:@{@"name": name}];

            [[self tableView] reloadData];
            
//            [project save:mProjectStore withDelegate:self];
        }
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"Annuler" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    
    [ac addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        [textField setPlaceholder: @"Nom du projet"];
        [textField setAutocapitalizationType:UITextAutocapitalizationTypeSentences];
    }];
    [ac addAction:ok];
    [ac addAction:cancel];
    [self presentViewController:ac animated:YES completion:nil];
}


// ============================================================================
#pragma mark - UITableViewDelegate
// ============================================================================

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [[self tableView] deselectRowAtIndexPath:indexPath animated:YES];
    
    
    UIViewController * main = [[self storyboard] instantiateViewControllerWithIdentifier:@"idMainVC"];
    UIViewController * menu = [[self storyboard] instantiateViewControllerWithIdentifier:@"idMenuVC"];
    RESideMenu * sm = [[RESideMenu alloc] initWithContentViewController:main leftMenuViewController:menu rightMenuViewController:nil];

    
}

// ============================================================================
#pragma mark - UITableViewDataSource
// ============================================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[Project getAllProjects] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Project * project = [[Project getAllProjects] objectAtIndex:indexPath.row];
    
    static NSString * cellID = @"projectCellID";
    
    MGSwipeTableCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil) {
        cell = [[MGSwipeTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        MGSwipeButton * options = [MGSwipeButton buttonWithTitle:@"Options" backgroundColor:FlatGreen callback:^BOOL(MGSwipeTableCell *sender) {
//            UIAlertController * ac = [UIAlertController alertControllerWithTitle:[project name] message:@"Choisissez le format d'export:" preferredStyle:UIAlertControllerStyleActionSheet];
//            UIAlertAction *pdf = [UIAlertAction actionWithTitle:@"PDF" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            }];
//            UIAlertAction *xls = [UIAlertAction actionWithTitle:@"Excel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            }];
//            UIAlertAction *csv = [UIAlertAction actionWithTitle:@"CSV" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            }];
//            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Annuler" style:UIAlertActionStyleCancel handler:nil];
//            [ac addAction:pdf];
//            [ac addAction:xls];
//            [ac addAction:csv];
//            [ac addAction:cancel];
//            [self presentViewController:ac animated:YES completion:nil];
            return NO;
        }];
        MGSwipeButton * delete = [MGSwipeButton buttonWithTitle:@"Supprimer" backgroundColor:FlatRed callback:^BOOL(MGSwipeTableCell *sender) {
            UIAlertController * ac = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Supprimer ce projet ?"] message:@"Ce projet sera définitivement effacé !" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *delete = [UIAlertAction actionWithTitle:@"Supprimer" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
//                [project destroy:mProjectStore withDelegate:self];
                // TODO:
            }];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Annuler" style:UIAlertActionStyleDefault handler:nil];
            [ac addAction:delete];
            [ac addAction:cancel];
            [self presentViewController:ac animated:YES completion:nil];
            return YES;
        }];
        
//        [[export titleLabel] setFont:FONT_BOLD(FONT_SZ_MEDIUM)];
        [[delete titleLabel] setFont:FONT_BOLD(FONT_SZ_MEDIUM)];
        
        
//        [cell setRightButtons:@[export]];
        [cell setLeftButtons:@[delete]];
        
        
        [[cell textLabel] setFont:FONT_BOLD(FONT_SZ_MEDIUM)];
        
        [[cell detailTextLabel] setNumberOfLines:2];
        [[cell detailTextLabel] setFont:FONT(FONT_SZ_SMALL)];
        
        CGFloat h = [self tableView:tableView heightForRowAtIndexPath:indexPath];
        UILabel * lbl = [[UILabel alloc] initWithFrame:CGRectMake(h / 4, 0, h, h / 2)];
        [lbl setText:@""];
        [lbl setTextAlignment:NSTextAlignmentCenter];
        [lbl setTextColor:FlatWhite];
        [lbl setBackgroundColor:FlatGray];
        [lbl setFont:FONT_BOLD(FONT_SZ_MEDIUM)];
        [[lbl layer] setCornerRadius:4];
        [[lbl layer] setMasksToBounds:YES];
        [cell setAccessoryView:lbl];
        
    }
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@", [project name]]];
//    [[cell detailTextLabel] setText:[NSString stringWithFormat:@"Créé par %@ le %@\nModifié par %@ le %@",
//                                     [project createdBy], [mFormatter stringFromDate:[project created]],
//                                     [project updatedBy], [mFormatter stringFromDate:[project updated]]]];
    return cell;
}




@end
