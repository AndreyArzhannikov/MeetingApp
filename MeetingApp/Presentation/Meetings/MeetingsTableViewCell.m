//
//  MeetingsTableViewCell.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "MeetingsTableViewCell.h"

static const CGFloat kPadding = 8.0f;

@interface MeetingsTableViewCell ()

@property (strong, nonatomic) UIView *containerView;

@end


@implementation MeetingsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.containerView = [self makeContainerView];
        [self addSubview:self.containerView];
        
        self.nameLabel = [self makeNameLabel];
        [self.containerView addSubview:self.nameLabel];
        
        self.organizationLabel = [self makeOrganizationLabel];
        [self.containerView addSubview:self.organizationLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.containerView.frame = CGRectInset(self.bounds, kPadding, kPadding / 2.0f);
    
    CGFloat textWidth = self.bounds.size.width - 2 * kPadding;
    
    self.nameLabel.frame = CGRectMake(kPadding,
                                      kPadding,
                                      textWidth,
                                      [self heightForLabel:self.nameLabel inRect:self.bounds]);
    [self.nameLabel sizeToFit];
    
    self.organizationLabel.frame = CGRectMake(kPadding,
                                              CGRectGetMaxY(self.nameLabel.frame) + kPadding / 2.0f,
                                              textWidth,
                                              [self heightForLabel:self.organizationLabel inRect:self.bounds]);
    [self.organizationLabel sizeToFit];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.containerView.layer.borderColor = (selected) ? [[UIColor greenColor] CGColor] : [[UIColor grayColor] CGColor];
}

// MARK: Helpers

- (UIView *)makeContainerView {
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.borderColor = [[UIColor grayColor] CGColor];
    view.layer.borderWidth = 2.0f;
    
    return view;
}

- (UILabel *)makeNameLabel {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor darkTextColor];
    label.font = [UIFont systemFontOfSize:22.0f weight:UIFontWeightBold];
    label.numberOfLines = 2;
    label.lineBreakMode = NSLineBreakByTruncatingTail;

    return label;
}

- (UILabel *)makeOrganizationLabel {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor lightGrayColor];
    label.font = [UIFont systemFontOfSize:20.0f weight:UIFontWeightRegular];
    label.numberOfLines = 2;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    return label;
}

- (CGFloat)heightForLabel:(UILabel *)label inRect:(CGRect)rect {
    CGRect textRect = [label.text boundingRectWithSize:CGSizeMake(rect.size.width - 2 * kPadding, MAXFLOAT)
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName:label.font}
                                                        context:nil];
    CGFloat height = MIN(textRect.size.height, 2.0f * self.nameLabel.frame.size.height);
    return height;
}

@end
