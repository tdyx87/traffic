//
//  ViewController.h
//  ViewExample
//
//  Created by LT-LW-MAC on 16/4/25.
//  Copyright (c) 2016年 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetProtocol.h"


#import "MLPAutoCompleteTextFieldDataSource.h"
#import "MLPAutoCompleteTextFieldDelegate.h"

@class MLPAutoCompleteTextField;

@interface ViewController : UIViewController<UITextFieldDelegate,NetProtocol,MLPAutoCompleteTextFieldDataSource, MLPAutoCompleteTextFieldDelegate>

@property ( nonatomic) IBOutlet UIButton *Search;

@property (retain, nonatomic) IBOutlet MLPAutoCompleteTextField *linename;

- (IBAction)searchevent:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *more;
- (IBAction)more:(id)sender;


@end

