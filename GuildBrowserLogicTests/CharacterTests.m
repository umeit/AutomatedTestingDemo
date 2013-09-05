//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by Liu Feng on 13-9-5.
//  Copyright (c) 2013年 Charlie Fulton. All rights reserved.
//

#import "CharacterTests.h"
#import "Character.h"
#import "Item.h"

@implementation CharacterTests
{
    NSDictionary *_characterDetailJson;
}

- (void)setUp
{
    NSURL *dataServerURL = [[NSBundle bundleForClass:self.class] URLForResource:@"character" withExtension:@"json"];
    
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServerURL];
    NSError *error;
    
    id json = [NSJSONSerialization JSONObjectWithData:sampleData options:kNilOptions error:&error];
    
    STAssertNotNil(json, @"invalid test data");
    
    _characterDetailJson = json;
}

- (void)tearDown
{
    _characterDetailJson = nil;
}

- (void)testCreateCharacterFromDetailJson
{
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    STAssertNotNil(testGuy1, @"Could not create character from detail json");
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    STAssertNotNil(testGuy2, @"Could not create character from nil data");}
@end
