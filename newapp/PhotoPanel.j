@import <AppKit/CPPanel.j>

PhotoDragType = "PhotoDragType";

@implementation PhotoPanel : CPPanel
{
	CPArray images;
	CPArray titles;
}

- (id) init
{
	self = [self initWithContentRect:CGRectMake(0.0, 0.0, 250.0, 750.0)
		styleMask:CPHUDBackgroundWindowMask | CPClosableWindowMask | CPResizableWindowMask];
	
	if (self)
	{
		[self setTitle:"Forms"];
		[self setFloatingPanel:YES];
		
		var contentView = [self contentView],
			bounds = [contentView bounds];
		
		bounds.size.height -= 20.0;
		
		var photosView = [[CPCollectionView alloc] initWithFrame:bounds];
		
		[photosView setAutoresizingMask:CPViewWidthSizable];
		[photosView setMinItemSize:CGSizeMake(150.0, 150.0)];
		[photosView setMaxItemSize:CGSizeMake(200.0, 200.0)];
		[photosView setDelegate:self];
		
		var itemPrototype = [[CPCollectionViewItem alloc] init],
			photoView = [[PhotoView alloc] initWithFrame:CGRectMakeZero()];
		
		[itemPrototype setView:photoView];
		
		[photosView setItemPrototype:itemPrototype];
        
        var scrollView = [[CPScrollView alloc] initWithFrame:bounds];
        
        [scrollView setDocumentView:photosView];
        [scrollView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
        [scrollView setAutohidesScrollers:YES];

        [[scrollView contentView] setBackgroundColor:[CPColor whiteColor]];

        [contentView addSubview:scrollView];
        
		images = [  [[CPImage alloc]
                        initWithContentsOfFile:"Resources/Ipad/ARD.jpg"
                                          size:CGSizeMake(960.0, 720.0)],
                    [[CPImage alloc]
                        initWithContentsOfFile:"Resources/Ipad/ART.jpg"
                                          size:CGSizeMake(960.0, 720.0)],
                    [[CPImage alloc]
                        initWithContentsOfFile:"Resources/Ipad/Audiogram_LEFT.jpg"
                                          size:CGSizeMake(1030.0, 760.0)],
                    [[CPImage alloc]
                        initWithContentsOfFile:"Resources/Ipad/Audiogram_RIGHT.jpg"
                                          size:CGSizeMake(1030.0, 760.0)],
                    [[CPImage alloc]
                        initWithContentsOfFile:"Resources/Ipad/First_Screen.jpg"
                                          size:CGSizeMake(960.0, 720.0)],
					[[CPImage alloc]
                        initWithContentsOfFile:"Resources/Ipad/IMMITTANCE.jpg"
                                          size:CGSizeMake(960.0, 720.0)],
					[[CPImage alloc]
                        initWithContentsOfFile:"Resources/Ipad/PATIENT_INFORMATION_SHEET.jpg"
                                          size:CGSizeMake(960.0, 720.0)],
                    [[CPImage alloc]
                        initWithContentsOfFile:"Resources/Ipad/Speech.jpg"
                                          size:CGSizeMake(960.0, 720.0)]];
                    
        [photosView setContent:images];
		
		titles = [	"ARD",
					"ART",
					"Left",
					"Right",
					"First Screen",	// this will need to be removed
					"Immittance",
					"Patient Info",
					"Speech"
					];
		
		// [photosView setLabels:titles];
	}
	
	return self;
}

- (CPArray)collectionView:(CPCollectionView)aCollectionView
	dragTypesForItemsAtIndexes:(CPIndexSet)indices
{
    return [PhotoDragType];
}

- (CPData)collectionView:(CPCollectionView)aCollectionView
	dataForItemsAtIndexes:(CPIndexSet)indices
	forType:(CPString)aType
{
    var firstIndex = [indices firstIndex];
    
    return [CPKeyedArchiver archivedDataWithRootObject:images[firstIndex]];
}

@end



@implementation PhotoView : CPView
{
	CPImageView _imageView;
}

- (void)setRepresentedObject:(id)anObject
{
	if (!_imageView)
	{
		var frame = CGRectInset([self bounds], 5.0, 5.0);
		
		_imageView = [[CPImageView alloc] initWithFrame:frame];
		
		[_imageView setImageScaling:CPScaleProportionally];
		[_imageView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
		
		[self addSubview:_imageView];
	}
	
	[_imageView setImage:anObject];
}

- (void)setSelected:(BOOL)isSelected
{
	[self setBackgroundColor:isSelected ? [CPColor grayColor] : nil];
}

@end