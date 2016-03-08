//
//  XQFLiteralLiveCell.m
//  LabelSizeTest
//
//  Created by Xunqf on 16/3/7.
//  Copyright © 2016年 New Sense Networks Technology Co., Ltd.. All rights reserved.
//

#import "XQFLiteralLiveCell.h"

@interface XQFLiteralLiveCell()

@property (nonatomic, strong) UILabel     *narratorLabel;
@property (nonatomic, strong) UILabel     *contentLabel;
@property (nonatomic, strong) UILabel     *timeLabel;
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *picImageView;
@property (nonatomic, strong) UIImageView *headerImageView;

@end

@implementation XQFLiteralLiveCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.narratorLabel];
        [self.contentView addSubview:self.bgImageView];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.picImageView];
        [self.contentView addSubview:self.headerImageView];
        
    }
    return self;
}

- (UILabel *)narratorLabel{
    
    if (!_narratorLabel) {
        _narratorLabel = [[UILabel alloc] init];
        _narratorLabel.font = [UIFont systemFontOfSize:12.0];
        _narratorLabel.textColor = [UIColor colorWithWhite:0.467 alpha:1.000];
        _narratorLabel.textAlignment = NSTextAlignmentCenter;
        _narratorLabel.backgroundColor = [UIColor clearColor];
        
        CGSize size = [self caculateSingleLineStringSize:@"直播员" fontSize:12.0];
        _narratorLabel.frame = CGRectMake(0.0, 10.0, size.width, size.height);
        CGPoint center = _narratorLabel.center;
        _narratorLabel.center = CGPointMake(self.headerImageView.center.x, center.y);
    }
    return _narratorLabel;
}

- (UILabel *)timeLabel{
    
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.font = [UIFont systemFontOfSize:8.0];
        _timeLabel.textColor = [UIColor colorWithWhite:0.467 alpha:1.000];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        
        CGSize size = [self caculateSingleLineStringSize:@"12:30" fontSize:8.0];
        _timeLabel.frame = CGRectMake(0.0, 0.0, size.width, size.height);
        _timeLabel.center = CGPointMake(self.headerImageView.center.x, 0.0);
        
    }
    return _timeLabel;
}

- (UILabel *)contentLabel{
    
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14.0];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.numberOfLines = 0;
        
        CGFloat orignX = self.narratorLabel.frame.origin.x + self.narratorLabel.bounds.size.width + 30.0;
        CGFloat width = [UIScreen mainScreen].bounds.size.width - 24.0 - orignX;
        _contentLabel.frame = CGRectMake(orignX, 15.0, width, 0.0);
        
    }
    return _contentLabel;
}

- (UIImageView *)bgImageView{
    
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.backgroundColor = [UIColor clearColor];
        
        CGFloat orignX = self.narratorLabel.frame.origin.x + self.narratorLabel.bounds.size.width + 10.0;
        CGFloat width = [UIScreen mainScreen].bounds.size.width - 12.0 - orignX;
        _bgImageView.frame = CGRectMake(orignX, 5.0, width, 0.0);
        
    }
    return _bgImageView;
}

- (UIImageView *)picImageView{
    
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.backgroundColor = [UIColor blueColor];
        
        CGFloat orignX = self.contentLabel.frame.origin.x;
        _picImageView.frame = CGRectMake(orignX, 0.0, 134.0, 80.0);
    }
    return _picImageView;
}

- (UIImageView *)headerImageView{
    
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] init];
        _headerImageView.frame = CGRectMake(13.0, 4.0, 35.0, 35.0);
        _headerImageView.backgroundColor = [UIColor redColor];
        _headerImageView.layer.cornerRadius = 17.5;
        _headerImageView.clipsToBounds = YES;
    }
    return _headerImageView;
}

- (CGFloat)setData:(id)data indexPath:(NSIndexPath *)indexPath{
    [self initCellStyle:data indexPath:indexPath];
    
    
    
    self.narratorLabel.text = @"直播员";
    self.timeLabel.text = @"12:30";
    
    CGFloat height = self.bgImageView.frame.size.height + 10.0;
    return height;
}

#pragma mark - 设置cell的样式
- (void)initCellStyle:(id)data indexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        self.headerImageView.hidden = NO;
        self.narratorLabel.hidden = YES;
        self.bgImageView.image = [self stretchImage:[UIImage imageNamed:@"currentTextLive"]];
        
        CGFloat originY = self.headerImageView.bounds.size.height + self.headerImageView.frame.origin.y + 3.0;
        CGRect rect = self.timeLabel.frame;
        self.timeLabel.frame = CGRectMake(rect.origin.x, originY, rect.size.width, rect.size.height);
        
    }else{
        self.headerImageView.hidden = YES;
        self.narratorLabel.hidden = NO;
        self.bgImageView.image = [self stretchImage:[UIImage imageNamed:@"textLive"]];
        
        CGFloat originY = self.narratorLabel.bounds.size.height + self.narratorLabel.frame.origin.y + 7.0;
        CGRect rect = self.timeLabel.frame;
        self.timeLabel.frame = CGRectMake(rect.origin.x, originY, rect.size.width, rect.size.height);
    }
    
    NSString *content = @"";
    
    if (indexPath.row%3 == 0) {
        content = @"进球😊";
    }else if (indexPath.row%3 == 1){
        content = @"射门得分进啦.......😁..................";
    }else{
        content = @"    常见的一个非对称加密算法是 RSA 算法，它主要利用了“两个素数求乘积容易，但是将乘积分解为两个素数很难”这一思想。它的具体原理不在本文讨论范围，有兴趣的读者可以查看文章末尾的参考文章。在非对称加密中，利用公钥加密的数据能且只能通过私钥解密，通过私钥加密的数据能且只能通过公钥解密。对称加密的优点在于速度快，但是假设秘钥由服务器保存，如何安全的让客户端得到秘钥是需要解决的问题。因此实际的网络传输中😄，通常使用对称加密与非对称加密结合的方式，服务端通过非对称加密将对称秘钥发给客户端。此后双方使用这个对称密钥进行通信。";
    }
    
    CGSize size = [self caculateMultipleLinesStringSize:content fontSize:14.0];
    CGRect rect = self.contentLabel.frame;
    self.contentLabel.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, size.height);
    self.contentLabel.text = content;
    
    rect = self.picImageView.frame;
    CGFloat orignY = self.contentLabel.frame.origin.y + self.contentLabel.frame.size.height + 10;
    self.picImageView.frame = CGRectMake(rect.origin.x, orignY, rect.size.width, rect.size.height);
    
    
    if (indexPath.row%2 == 0) {//  有图片
        self.picImageView.hidden = NO;
        CGFloat height = self.contentLabel.frame.size.height + 20.0 + self.picImageView.frame.size.height + 10;
        rect = self.bgImageView.frame;
        self.bgImageView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
    }else{//  无图片
        self.picImageView.hidden = YES;
        CGFloat height = self.contentLabel.frame.size.height + 20.0;
        rect = self.bgImageView.frame;
        self.bgImageView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
    }
}

- (UIImage *)stretchImage:(UIImage *)image{
    CGFloat top = 25; // 顶端盖高度
    CGFloat bottom = 10 ; // 底端盖高度
    CGFloat left = 20; // 左端盖宽度
    CGFloat right = 15; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 指定为拉伸模式，伸缩后重新赋值
    return [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}

#pragma mark - 计算单行文字的高度
- (CGSize)caculateSingleLineStringSize:(NSString *)str fontSize:(CGFloat)fontSize{
    CGSize size =[str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    return size;
}
#pragma mark - 计算多行文字的高度
- (CGSize)caculateMultipleLinesStringSize:(NSString *)str fontSize:(CGFloat)fontSize{
    
    CGFloat orignX = self.narratorLabel.frame.origin.x + self.narratorLabel.bounds.size.width + 30.0;
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 26.0 - orignX;
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                    options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                                    context:nil].size;
    return size;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
