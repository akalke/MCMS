//
//  CreatureDetailViewController.m
//  MCMS
//
//  Created by Amaeya Kalke on 10/7/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "CreatureDetailViewController.h"
#import "MagicalCreature.h"

@interface CreatureDetailViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *creatureName;
@property (strong, nonatomic) IBOutlet UIView *detailView;
@property (strong, nonatomic) IBOutlet UILabel *creatureLabel;
@property (strong, nonatomic) IBOutlet UILabel *specialLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *specialName;


@end

@implementation CreatureDetailViewController


-(void)viewWillAppear:(BOOL)animated{
    animated = NO;
    self.navigationItem.title = self.creature.name;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatureName.text = self.creatureLabel.text  =self.creature.name;
    self.specialName.text = self.specialLabel.text = self.creature.specialMove;


    UIImage *myImage = [UIImage imageNamed:@"unicorn@2x.png"];
    if(myImage == nil){
        NSLog(@"No Image");

    }
    self.imageView.image = myImage;

    

    [self.creatureName setHidden:YES];
    [self.specialName setHidden:YES];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onEditButtonPressed:(id)sender {
    if([[[sender titleLabel] text] isEqualToString:@"Edit"]){
        [sender setTitle:@"Done" forState: UIControlStateNormal];
        [self.creatureName setHidden:NO];
        [self.creatureLabel setHidden:YES];

        [self.specialName setHidden:NO];
        [self.specialLabel setHidden:YES];
    }
    else{
        [sender setTitle: @"Edit" forState: UIControlStateNormal];
        self.creatureLabel.text = self.creatureName.text;
        self.creature.name = self.creatureName.text;

        [self.creatureName setHidden:YES];
        [self.creatureLabel setHidden:NO];

        self.specialLabel.text = self.specialName.text;
        self.creature.specialMove = self.specialName.text;

        [self.specialName setHidden:YES];
        [self.specialLabel setHidden:NO];
    }
}


@end
