//
//  WebService.h
//  SponsorPayJson
//
//  Created by davut on 3.04.2014.
//  Copyright (c) 2014 davut. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WebService : NSObject
{}
-(NSString*)GetDataWithsuccess:(void (^)(RKObjectRequestOperation *, RKMappingResult *))successBlock failure:(void (^)(RKObjectRequestOperation *, NSError *))faultBlock;
@end
