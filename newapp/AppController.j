/*
 * AppController.j
 * NewApplication
 *
 * Created by You on February 22, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

// @import "PopupPanel.j"


@implementation AppController : CPObject
{
	CPTextField info;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];
		// pageView = [[PageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(bounds) / 2.0 - 200.0, CGRectGetHeight(bounds) / 2.0 - 200.0, 400.0, 400.0)];
		
	// [pageView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];

    // [contentView addSubview:pageView];

	// FIRST SCREEN BUTTONS //
	var buttonWidth = 180, buttonHeight = 24, gap = 80,
		midM = [[CPButton alloc] initWithFrame: CGRectMake(0, 0, buttonWidth, buttonHeight)];
	[midM setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	[midM setCenter:[contentView center]];
	
	var topL = [[CPButton alloc] initWithFrame:		// Audiogram
			CGRectMake( CGRectGetMinX([midM frame]) - buttonWidth - gap,
						CGRectGetMinY([midM frame]) - buttonHeight - gap,
						buttonWidth, buttonHeight)],
		topM = [[CPButton alloc] initWithFrame:		// Speech
			CGRectMake( CGRectGetMinX([midM frame]),
						CGRectGetMinY([midM frame]) - buttonHeight - gap,
						buttonWidth, buttonHeight)],
		topR = [[CPButton alloc] initWithFrame:		// Immittance
			CGRectMake( CGRectGetMaxX([midM frame]) + gap,
						CGRectGetMinY([midM frame]) - buttonHeight - gap,
						buttonWidth, buttonHeight)],
		midL = [[CPButton alloc] initWithFrame:		// Otoacoustic
			CGRectMake( CGRectGetMinX([midM frame]) - buttonWidth - gap,
						CGRectGetMinY([midM frame]),
						buttonWidth, buttonHeight)],
		midR = [[CPButton alloc] initWithFrame:		// Threshold
			CGRectMake( CGRectGetMaxX([midM frame]) + gap,
						CGRectGetMinY([midM frame]),
						buttonWidth, buttonHeight)],
		botL = [[CPButton alloc] initWithFrame:		// Decay
			CGRectMake( CGRectGetMinX([midM frame]) - buttonWidth - gap,
						CGRectGetMaxY([midM frame]) + gap,
						buttonWidth, buttonHeight)],
		botM = [[CPButton alloc] initWithFrame:		// Help
			CGRectMake( CGRectGetMinX([midM frame]),
						CGRectGetMaxY([midM frame]) + gap,
						buttonWidth, buttonHeight)],
		botR = [[CPButton alloc] initWithFrame:		// Contact
			CGRectMake( CGRectGetMaxX([midM frame]) + gap,
						CGRectGetMaxY([midM frame]) + gap,
						buttonWidth, buttonHeight)];

	// probably collapse into single method later
	
	[topL setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	[topL setTitle:"Audiogram"];
	[topL setTarget:self];
	[topL setAction:@selector(audiogram:)];
	[contentView addSubview:topL];
	//////////////////////////
	[topM setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	[topM setTitle:"Speech"];
	[topM setTarget:self];
	[topM setAction:@selector(speech:)];
	[contentView addSubview:topM];
	//////////////////////////
	[topR setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	[topR setTitle:"Immittance"];
	[topR setTarget:self];
	[topR setAction:@selector(immittance:)];
	[contentView addSubview:topR];
	//////////////////////////
	[midL setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	[midL setTitle:"Otoacoustic Emissions"];
	[midL setTarget:self];
	[midL setAction:@selector(emissions:)];
	[contentView addSubview:midL];
	//////////////////////////
	[midM setTitle:"Acoustic Reflex Threshold"];
	[midM setTarget:self];
	[midM setAction:@selector(threshold:)];
	[contentView addSubview:midM];
	//////////////////////////
	[midR setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	[midR setTitle:"Acoustic Reflex Decay"];
	[midR setTarget:self];
	[midR setAction:@selector(decay:)];
	[contentView addSubview:midR];
	//////////////////////////
	[botL setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	[botL setTitle:"Help"];
	[botL setTarget:self];
	[botL setAction:@selector(help:)];
	[contentView addSubview:botL];
	//////////////////////////
	[botM setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	[botM setTitle:"About"];
	[botM setTarget:self];
	[botM setAction:@selector(about:)];
	[contentView addSubview:botM];
	//////////////////////////
	[botR setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	[botR setTitle:"Contact Information"];
	[botR setTarget:self];
	[botR setAction:@selector(contact:)];
	[contentView addSubview:botR];
	//////////////////////////
	
	// HELLO WORLD // probably will be replaced with "hedgeform" image
	var label = [[CPTextField alloc] initWithFrame:
		// CGRectMakeZero()];
		CGRectMake( CGRectGetMinX([midM frame]) + 20,
					CGRectGetMinY([topM frame]) - 80)];
	// [label setAlignment:CPCenterTextAlignment];	// doesn't appear to actually work
	
    [label setStringValue:@"Hello World!"];
    [label setFont:[CPFont boldSystemFontOfSize:24.0]];
    [label sizeToFit];
    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [contentView addSubview:label];
	
	
	
	info = [[CPTextField alloc] initWithFrame:
		CGRectMake( CGRectGetMinX([midM frame]),	// 600)];
					CGRectGetMaxY([botM frame]) + 80)];
	// [info setAlignment:CPCenterTextAlignment];
	[info setStringValue:@""];
	[info sizeToFit];
	[info setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
	[contentView addSubview:info];
	
	
	
    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

- (void)audiogram:(id)sender
{
	[info setStringValue:"popup y u no work =("];
	[info sizeToFit];
	
	
	// [[[PopupPanel alloc] init] orderFront:nil];
	// [PopupPanel popup];
	
	[PopupPanel popup:null];
}

- (void)speech:(id)sender
{
}

- (void)immittance:(id)sender
{
}

- (void)emissions:(id)sender
{
}

- (void)threshold:(id)sender
{
}

- (void)decay:(id)sender
{
}

- (void)help:(id)sender
{
	var string = "helpful information";
	if ([info stringValue] == string) {
		[info setStringValue:null];
	} else {
		[info setStringValue:string];
	}
	[info sizeToFit];
}

- (void)about:(id)sender
{
	var string = "this app needs a name\nbut even without a name it is awesome";
	if ([info stringValue] == string) {
		[info setStringValue:null];
	} else {
		[info setStringValue:string];
	}
	[info sizeToFit];
}

- (void)contact:(id)sender
{
	var string = "Andrew Lekashman - 123.456.7890\nJohn Lekashman - 012.345.6789\nMichael Webb - 987.654.3210\nAmanda Wong 098.765.4321";
	if ([info stringValue] == string) {
		[info setStringValue:null];
	} else {
		[info setStringValue:string];
	}
	[info sizeToFit];
}

@end