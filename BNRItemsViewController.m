//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Adam Lehde on 4/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"

@interface BNRItemsViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end  

@implementation BNRItemsViewController

- (instancetype) init {
    //Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        
    }
    return self;
}

- (instancetype) initWithStyle:(UITableViewStyle)style{
    return [self init];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}

- (UIView *)headerView {
    if(!_headerView){
        [[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return _headerView;
}

- (IBAction)addNewItem:(id)sender {
    
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    NSInteger lastRow = [[[BNRItemStore sharedStore]allItems]indexOfObject:newItem];
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction)toggleEditingMode:(id)sender{
    if(self.isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[BNRItemStore sharedStore]allItems]count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    NSArray *items = [[BNRItemStore sharedStore]allItems];
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete){
        NSArray * items = [[BNRItemStore sharedStore]allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore]removeItem:item];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



@end
