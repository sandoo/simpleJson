//
//  webserviceStructure.m
//  RKTwitter
//
//  Created by tmob on 04/02/14.
//
//

#import "webserviceStructure.h"
#import "Cipher.h"
#import "mappingManager.h"
@implementation webserviceStructure

+(webserviceStructure*)sharedService
{
    static webserviceStructure *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[webserviceStructure alloc] init];
        
        NSURL *baseURL = [NSURL URLWithString:@"http://preliveapi.kliksa.com/v1"];
        AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
        
        NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
        [DateFormatter setTimeZone:timeZone];
        [DateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        
        
        NSString *dateStr = [NSString stringWithFormat:@"%@",[DateFormatter stringFromDate:[NSDate date]]];
        dateStr = [dateStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
        dateStr = [dateStr stringByReplacingOccurrencesOfString:@":" withString:@""];
        dateStr = [dateStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSString *str = [NSString stringWithFormat:@"302tmob302|http://preliveapi.kliksa.com/v1/index|%@",dateStr];

        
        [client setDefaultHeader:@"Host" value:@"preliveapi.kliksa.com"];
        [client setDefaultHeader:@"Content-Type" value:@"application/json"];
        [client setDefaultHeader:@"Accept-Encoding" value:@"gzip, deflate"];
        [client setDefaultHeader:@"Accept-Language" value:@"tr-TR,tr"];
        [client setDefaultHeader:@"User-Agent" value:@"Android-Tablet (Android; 4.1.2; GT-I9300; 359975053041578)"];
        [client setDefaultHeader:@"Authorization" value:[NSString stringWithFormat:@"tmobklksapi %@ %@",[Cipher hex_sha1:str],dateStr]];
        [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];

 
        //we want to work with JSON-Data
        [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
        
        [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/html"];

        // Initialize RestKit
        [[RKObjectManager alloc] initWithHTTPClient:client];
        
    });
    return shared;
}

-(NSString*)GetIndexWithSuccess:(void (^)(RKObjectRequestOperation *, RKMappingResult *))successBlock failure:(void (^)(RKObjectRequestOperation *, NSError *))faultBlock
{
    [mappingManager mapForUser];
    [self sendWithPath:@"/v1/index" parameters:nil success:successBlock failure:faultBlock];
    return @"/v1/index";
}


-(void)sendWithPath:(NSString*)path parameters:(NSDictionary*)params success:(void(^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))successBlock failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))faultBlock
{
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    //loader koy

    [objectManager getObjectsAtPath:path
                         parameters:params
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                
                                //loader kaldır
                                if(successBlock)
                                    successBlock(operation, mappingResult);
                            }
                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
//                                operation.isFinished
//                                [objectManager.operationQueue addOperation:operation];
//                                //loader kaldır
                                // genel error  (logout/timeout/connection lost/ vs.) codelara göre aksiyon al. (tekrar dene veya sayfa kapat gibi )
                                if(faultBlock)
                                    faultBlock(operation, error);
                            }];
}

-(void)cancelAllRequests
{
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    [objectManager.operationQueue cancelAllOperations];
}
@end
