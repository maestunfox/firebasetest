//
//  Config.h
//
//  Created by Olivier on 09/02/2016.
//

#import <RESideMenu/RESideMenu.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <ChameleonFramework/Chameleon.h>
#import "ACUtils.h"

// ==========================================================================================
// COLORS : modify these colors if needed, beware of bad taste !!!
// ==========================================================================================
#define APP_COLOR               FlatBlue
#define TEXT_COLOR_WHITE        FlatWhite
#define TEXT_COLOR_BLACK        FlatBlack
#define BACK_COLOR              FlatWhite


// ==========================================================================================
// FONTS : modify these fonts if needed, beware of the width !!!
// ==========================================================================================
#define __FONT_BASE             @"AvenirNext"
#define __FONT_REGULAR          @"-Regular"
#define __FONT_BOLD             @"-DemiBold"
#define __FONT_LITE             @"-UltraLight"
#define FONT_SZ_XLARGE          26
#define FONT_SZ_LARGE           20
#define FONT_SZ_MEDIUM          16
#define FONT_SZ_SMALL           12
#define FONT_SZ_XSMALL          10
#define FONT(sz)                [UIFont fontWithName:[NSString stringWithFormat:@"%@%@", __FONT_BASE, __FONT_REGULAR] size:(sz)]
#define FONT_BOLD(sz)           [UIFont fontWithName:[NSString stringWithFormat:@"%@%@", __FONT_BASE, __FONT_BOLD] size:(sz)]
#define FONT_LITE(sz)           [UIFont fontWithName:[NSString stringWithFormat:@"%@%@", __FONT_BASE, __FONT_LITE] size:(sz)]
