//
//  CreatureDetailViewController.h
//  MCMS
//
//  Created by Amaeya Kalke on 10/7/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagicalCreature.h"

@interface CreatureDetailViewController : UIViewController
@property (nonatomic, strong) MagicalCreature *creature;
@property (nonatomic, strong) NSMutableArray *creatureArray;
@end
