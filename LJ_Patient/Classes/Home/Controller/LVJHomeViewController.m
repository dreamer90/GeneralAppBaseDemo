//
//  LVJHomeViewController.m
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/27.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#import "LVJHomeViewController.h"
#import "LVJCarouselView.h"
#import "LVJTableViewProtocol.h"
#import "LVJTableViewModel.h"

@interface LVJHomeViewController ()<LVJCarouselViewDelegate,ScrollViewContentSizeDelegate>
{
    MJRefreshGifHeader * gifHeader;
    LVJTableViewModel * tableViewModel;
}
@property (nonatomic, strong) LVJCarouselView *carouselView;
@property (nonatomic , strong) UITableView * tableView;
@property (nonatomic , strong) LVJTableViewProtocol * tableViewData;
/*** 状态栏底图 ***/
@property (nonatomic , weak) UIView * statusbar;

@end

@implementation LVJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LVJGray;
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    tableViewModel = [[LVJTableViewModel alloc] init];
    [self.view addSubview:self.tableView];
    [self setupCarouselView];
}

#pragma mark - headerRefreshAction
-(void)setupGifHeader
{

    gifHeader = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshAction)];
    gifHeader.stateLabel.hidden = YES;
    gifHeader.lastUpdatedTimeLabel.hidden = YES;
    
    NSMutableArray * gifArr = [NSMutableArray array];
    for (int i = 0; i <= 10; i++) {
        
        NSString * imgPath = [NSString stringWithFormat:@"%d.png",i];
        UIImage * image = [UIImage imageNamed:imgPath];
        [gifArr addObject:image];
    }
    
    // 设置普通状态的动画图片
    [gifHeader setImages:@[gifArr.firstObject] forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [gifHeader setImages:@[gifArr.lastObject] forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [gifHeader setImages:gifArr forState:MJRefreshStateRefreshing];
    
    self.tableView.mj_header = gifHeader;
}

-(void)headerRefreshAction
{
    [tableViewModel headerRefreshRequestWithCallback:^(NSArray *array) {
        
        [gifHeader endRefreshing];
    }];
}

#pragma mark - lazy
-(UITableView *)tableView{
    
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - TabBarHeight) style:UITableViewStyleGrouped];
        tableView.showsVerticalScrollIndicator = NO;
        tableView.showsHorizontalScrollIndicator = NO;
        
        _tableViewData = [[LVJTableViewProtocol alloc] init];
        tableView.dataSource = _tableViewData;
        tableView.delegate = _tableViewData;
        _tableViewData.delegate = self;
        tableView.contentInset = UIEdgeInsetsMake(CarouselHeight, 0, 0, 0);
        
        _tableView = tableView;
        [self setupGifHeader];
    }
    return _tableView;
}

-(UIView *)statusbar{

    if (!_statusbar) {
        UIView * statusBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, StatusBarHeihgt)];
        statusBar.backgroundColor = LVJGray;
        _statusbar = statusBar;
        
        [self.view insertSubview:statusBar aboveSubview:_carouselView];
    }
    return _statusbar;
}
#pragma mark - scrollViewDelegate
- (void)scrollViewDidChangeScroll:(UIScrollView *)scrollView{
    
    NSInteger instant = -scrollView.contentOffset.y - CarouselHeight;
    if (instant > 0) {
        _carouselView.lvj_y = 0;
    }else{
        _carouselView.lvj_y = instant;
    }
    
    if ( instant < - CarouselHeight) {
        self.statusbar.hidden = NO;
    }else{
        self.statusbar.hidden = YES;
    }
   
}

#pragma mark - 轮播图片
-(void)setupCarouselView
{
        NSArray *arr = @[
                         @"http://pic39.nipic.com/20140226/18071023_162553457000_2.jpg",//网络图片
                         [UIImage imageNamed:@"1.jpg"],//本地图片，传image，不能传名称
                         @"http://photo.l99.com/source/11/1330351552722_cxn26e.gif",//网络gif图片
                         gifImageNamed(@"2.gif")//本地gif使用gifImageNamed(name)函数创建
                         ];
        
        NSArray *describeArray = @[@"网络图片", @"本地图片", @"网络动态图", @"本地动态图"];
        
        /**
         *  通过代码创建
         */
        self.carouselView = [[LVJCarouselView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CarouselHeight)];
        
        
        //设置占位图片,须在设置图片数组之前设置,不设置则为默认占位图
        _carouselView.placeholderImage = [UIImage imageNamed:@"placeholderImage.jpg"];
        
        //设置图片数组及图片描述文字
        _carouselView.imageArray = arr;
        _carouselView.describeArray = describeArray;
        
        //用代理处理图片点击
        _carouselView.delegate = self;
        
        //设置每张图片的停留时间，默认值为5s，最少为2s
        _carouselView.time = 2;
        
        //设置分页控件的图片,不设置则为系统默认
        [_carouselView setPageImage:[UIImage imageNamed:@"other"] andCurrentPageImage:[UIImage imageNamed:@"current"]];
        
        //设置分页控件的位置，默认为PositionBottomCenter
        _carouselView.pagePosition = PositionBottomRight;
        
        /**
         *  修改图片描述控件的外观，不需要修改的传nil
         *
         *  参数一 字体颜色，默认为白色
         *  参数二 字体，默认为13号字体
         *  参数三 背景颜色，默认为黑色半透明
         */
        UIColor *bgColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        UIFont *font = [UIFont systemFontOfSize:15];
        UIColor *textColor = [UIColor greenColor];
        [_carouselView setDescribeTextColor:textColor font:font bgColor:bgColor];

        [self.view addSubview:_carouselView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //清除缓存
    [LVJCarouselView clearDiskCache];
    
}


#pragma mark XRCarouselViewDelegate
- (void)carouselView:(LVJCarouselView *)carouselView clickImageAtIndex:(NSInteger)index {
    NSLog(@"点击了第%ld张图片", index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
