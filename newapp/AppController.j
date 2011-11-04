/*
 * AppController.j
 * NewApplication
 *
 * Created by You on February 22, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "PageView.j"
@import "PhotoInspector.j"
@import "PhotoPanel.j"

@implementation AppController : CPObject
{
	// make label instance variable rather than local
	// CPTextField label;
	//
}

/*
- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    //var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
	// take out var keyword
	label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label setStringValue:@"Hello World!"];
    [label setFont:[CPFont boldSystemFontOfSize:24.0]];
	[label setAlignment:CPCenterTextAlignment];

    [label sizeToFit];

    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label setCenter:[contentView center]];

    [contentView addSubview:label];
	
	// make a simple change
	
	var button = [[CPButton alloc] initWithFrame: CGRectMake(
                CGRectGetWidth([contentView bounds])/2.0 - 40,
                CGRectGetMaxY([label frame]) + 10,
                80, 24
             )];
                          
	[button setAutoresizingMask:CPViewMinXMargin | 
                            CPViewMaxXMargin | 
                            CPViewMinYMargin | 
                            CPViewMaxYMargin];

	[button setTitle:"swap"];

	[button setTarget:self];
	[button setAction:@selector(swap:)];                
              
	[contentView addSubview:button];
		
	//

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}
*/

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() 
						styleMask:CPBorderlessBridgeWindowMask],
		contentView = [theWindow contentView];

	[contentView setBackgroundColor:[CPColor blackColor]];

	[theWindow orderFront:self];
	
	var bounds = [contentView bounds],
        pageView = [[PageView alloc] initWithFrame:
            CGRectMake(CGRectGetWidth(bounds) / 2.0 - 200.0,
					  CGRectGetHeight(bounds) / 2.0 - 200.0, 400.0, 400.0)];
	
	[pageView setAutoresizingMask:
		CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	
	 [contentView addSubview:pageView];
    
    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    
    [label setTextColor:[CPColor whiteColor]];
    [label setStringValue:@"Double Click to Edit Photo"];
    
    [label sizeToFit];
    [label setFrameOrigin:
		CGPointMake(CGRectGetWidth(bounds) / 2. - CGRectGetWidth([label frame]) / 2., 
					CGRectGetMinY([pageView frame]) - CGRectGetHeight([label frame]))];
    [label setAutoresizingMask:
		CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    
    [contentView addSubview:label];
	
	// var theInspector = [[PhotoInspector alloc] init];

	// [theInspector showWindow:self];
	
	[[[PhotoPanel alloc] init] orderFront:nil];
}
/*
- (CPTextField)labelWithTitle:(CPString)aTitle
{
	var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
	
	[label setStringValue:aTitle];
	[label setTextColor:[CPColor whiteColor]];
	
	[label sizeToFit];
	
	return label;
}
*/
/*
- (void)swap:(id)sender
{
    if ([label stringValue] == "Hello World!")
        [label setStringValue:"Goodbye!"];
    else
        [label setStringValue:"Hello World!"];
}
*/

@end