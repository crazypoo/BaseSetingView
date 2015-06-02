//
//  iCocosSettingViewController.m
//  01-iCocos
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "iCocosSettingViewController.h"
#import "iCocosPushNoticeViewController.h"

@interface iCocosSettingViewController ()
@end

@implementation iCocosSettingViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.第0组：3个
    [self add0SectionItems];
    
    // 2.第1组：6个
    [self add1SectionItems];
}

#pragma mark 添加第0组的模型数据
- (void)add0SectionItems
{
    // 1.1.推送和提醒
    iCocosSettingItem *push = [iCocosSettingItem itemWithIcon:@"MorePush" title:@"推送和提醒" type:iCocosSettingItemTypeArrow];
    push.operation = ^{
        iCocosPushNoticeViewController *notice = [[iCocosPushNoticeViewController alloc] init];
        [self.navigationController pushViewController:notice animated:YES];
    };
    
    // 1.2.摇一摇机选
    iCocosSettingItem *shake = [iCocosSettingItem itemWithIcon:@"handShake" title:@"摇一摇机选" type:iCocosSettingItemTypeSwitch];
    
    // 1.3.声音效果
    iCocosSettingItem *sound = [iCocosSettingItem itemWithIcon:@"sound_Effect" title:@"声音效果" type:iCocosSettingItemTypeSwitch];
    
    iCocosSettingGroup *group = [[iCocosSettingGroup alloc] init];
    group.header = @"基本设置";
    group.items = @[push, shake, sound];
    [_allGroups addObject:group];
}

#pragma mark 添加第1组的模型数据
- (void)add1SectionItems
{
    // 2.1.检查新版本
    iCocosSettingItem *update = [iCocosSettingItem itemWithIcon:@"MoreUpdate" title:@"检查新版本" type:iCocosSettingItemTypeArrow];
    update.operation = ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"暂时没有新版本" delegate:niCocos cancelButtonTitle:@"好的" otherButtonTitles:niCocos, niCocos];
        [alert show];
    };
    
    // 2.2.帮助
    iCocosSettingItem *help = [iCocosSettingItem itemWithIcon:@"MoreHelp" title:@"帮助" type:iCocosSettingItemTypeArrow];
    help.operation = ^{
        UIViewController *helpVc = [[UIViewController alloc] init];
        helpVc.view.backgroundColor = [UIColor brownColor];
        helpVc.title = @"帮助";
        [self.navigationController pushViewController:helpVc animated:YES];
    };
    
    // 2.3.分享
    iCocosSettingItem *share = [iCocosSettingItem itemWithIcon:@"MoreShare" title:@"分享" type:iCocosSettingItemTypeArrow];
    
    // 2.4.查看消息
    iCocosSettingItem *msg = [iCocosSettingItem itemWithIcon:@"MoreMessage" title:@"查看消息" type:iCocosSettingItemTypeArrow];
    
    // 2.5.产品推荐
    iCocosSettingItem *product = [iCocosSettingItem itemWithIcon:@"MoreNetease" title:@"产品推荐" type:iCocosSettingItemTypeArrow];
    
    // 2.6.关于
    iCocosSettingItem *about = [iCocosSettingItem itemWithIcon:@"MoreAbout" title:@"关于" type:iCocosSettingItemTypeArrow];
    
    iCocosSettingGroup *group = [[iCocosSettingGroup alloc] init];
    group.header = @"高级设置";
    group.footer = @"这的确是高级设置！！！";
    group.items = @[update, help, share, msg, product, about];
    [_allGroups addObject:group];
}
@end