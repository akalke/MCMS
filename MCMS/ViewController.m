//
//  ViewController.m
//  MCMS
//
//  Created by Amaeya Kalke on 10/7/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureDetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *addTextField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSString *tempText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeInitialCreatures];

    [self.addTextField isFirstResponder];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"creatureCellID" forIndexPath:indexPath];

    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.tempText = cell.textLabel.text;
    NSLog(@"%@", cell.textLabel.text);
}


- (IBAction)onAddButtonPressed:(id)sender {
    [self.creatures addObject:[self createNewCreature]];
    self.addTextField.text = @"";
    [self.tableView reloadData];
}

-(MagicalCreature *)createNewCreature{
    MagicalCreature *creature = [[MagicalCreature alloc] init];
    creature.name = self.addTextField.text;
    return creature;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@", segue.identifier);

    if([segue.identifier isEqualToString:@"ShowCreatureSegue"]){
        CreatureDetailViewController *creatureDetailVC = segue.destinationViewController;
        MagicalCreature *myCreature = [self.creatures objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        creatureDetailVC.creature = myCreature;
        creatureDetailVC.creatureArray = self.creatures;
    }
}

-(void)initializeInitialCreatures{
    MagicalCreature *dragon = [[MagicalCreature alloc] init];
    dragon.name = @"Dragon";
    dragon.specialMove = @"Big ass flame";
    dragon.creatureImagePath = [[NSBundle mainBundle] pathForResource:@"3951313-2007059940-Smaug" ofType:@".jpg"];
    MagicalCreature *unicorn = [[MagicalCreature alloc] init];
    unicorn.name = @"Unicorn";
    unicorn.specialMove = @"Big ass horn";
    MagicalCreature *fairy = [[MagicalCreature alloc] init];
    fairy.name = @"Fairy";
    fairy.specialMove = @"Big ass wand attack";
    self.creatures = [NSMutableArray arrayWithObjects:dragon, unicorn, fairy, nil];
}


@end
