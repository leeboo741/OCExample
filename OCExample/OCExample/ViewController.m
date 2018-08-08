//
//  ViewController.m
//  OCExample
//
//  Created by YWKJ on 2018/8/8.
//  Copyright © 2018年 YWKJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSDictionary * dataSourceDict;
@end

static NSInteger sSectionNumber = 1;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initView{
    self.title = @"目录";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 40;
}
#pragma mark - Set/Get
-(NSDictionary *)dataSourceDict{
    return @{
             @"评论回复":@[@"Cell+HeadView解决方案"]
             };
}
#pragma mark - Table View
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSourceDict.allKeys.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * dataArray = [self.dataSourceDict objectForKey:[self.dataSourceDict.allKeys objectAtIndex:section]];
    return dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    [self configCell:cell indexPath:indexPath];
    return cell;
}
-(void)configCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    NSArray * dataArray = [self.dataSourceDict objectForKey:[self.dataSourceDict.allKeys objectAtIndex:indexPath.section]];
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * headLabel = [[UILabel alloc]init];
    headLabel.text = [self.dataSourceDict.allKeys objectAtIndex: section];
    headLabel.textAlignment = NSTextAlignmentCenter;
    headLabel.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    return headLabel;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            
        }
            break;
        default:
            break;
    }
}


@end
