//
//  webserviceStructure.h
//  RKTwitter
//
//  Created by tmob on 04/02/14.
//
//

#import <Foundation/Foundation.h>
#import "RKTUser.h"
#import <RestKit/RestKit.h>
#import "DataModels.h"
@interface webserviceStructure : NSObject
{}

+(webserviceStructure*)sharedService;


-(NSString*)GetIndexWithSuccess:(void(^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))successBlock failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))faultBlock;

-(void)cancelAllRequests;
@end
