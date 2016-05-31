//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Paul Lefebvre on 5/31/16.
//  Copyright © 2016 Paul Lefebvre. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [NSMutableArray new];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor greenColor];
    
}
- (IBAction)onRowItemSwiped:(UISwipeGestureRecognizer *)sender {
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (IBAction)onAddButtonPressed:(id)sender {
    [self.items addObject:self.textField.text];
    [self.tableView reloadData];
    self.textField.text = @"";
    [self.textField resignFirstResponder];
}
- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender {

    if (self.editing) {
        self.editing = false;
        [self.tableView setEditing:false animated:true];
        [sender setStyle:UIBarButtonItemStylePlain];
        [sender setTitle:@"Edit"];
    } else {
        self.editing = true;
        [self.tableView setEditing:true animated:true];
        [sender setStyle:UIBarButtonItemStyleDone];
        [sender setTitle:@"Done"];
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.items removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}

@end
