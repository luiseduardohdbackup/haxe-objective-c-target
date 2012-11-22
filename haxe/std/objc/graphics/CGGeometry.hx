package objc.graphics;


/* Points. */

extern class CGPoint {
	public var x :Float;
	public var y :Float;
	public function new (x:Float=0.0, y:Float=0.0) :Void;
}


/* Sizes. */

extern class CGSize {
	public var width :Float;
	public var height :Float;
	public function new (w:Float, h:Float) :Void;
}


/* Rectangles. */

extern class CGRect {
	public var origin :CGPoint;
	public var size :CGSize;
	public function new (x:Float, y:Float, w:Float, h:Float) :Void;
}


/* Rectangle edges. */

/*enum CGRectEdge {
  CGRectMinXEdge, CGRectMinYEdge, CGRectMaxXEdge, CGRectMaxYEdge
};
typedef enum CGRectEdge CGRectEdge;*/

/* The "zero" point -- equivalent to CGPointMake(0, 0). */ 

/*CG_EXTERN const CGPoint CGPointZero*/

/* The "zero" size -- equivalent to CGSizeMake(0, 0). */ 

/*CG_EXTERN const CGSize CGSizeZero*/

/* The "zero" rectangle -- equivalent to CGRectMake(0, 0, 0, 0). */ 

/*CG_EXTERN const CGRect CGRectZero*/

/* The "empty" rect. This is the rectangle returned when, for example, we
   intersect two disjoint rectangles. Note that the null rect is not the
   same as the zero rect. */

/*CG_EXTERN const CGRect CGRectNull*/

/* The infinite rectangle. */

/*CG_EXTERN const CGRect CGRectInfinite*/

/* Make a point from `(x, y)'. */

/*CG_INLINE CGPoint CGPointMake(CGFloat x, CGFloat y);*/

/* Make a size from `(width, height)'. */

/*CG_INLINE CGSize CGSizeMake(CGFloat width, CGFloat height);*/

/* Make a rect from `(x, y; width, height)'. */

/*CG_INLINE CGRect CGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height);*/

/* Return the leftmost x-value of `rect'. */

/*CG_EXTERN CGFloat CGRectGetMinX(CGRect rect)*/

/* Return the midpoint x-value of `rect'. */

/*CG_EXTERN CGFloat CGRectGetMidX(CGRect rect)*/

/* Return the rightmost x-value of `rect'. */

/*CG_EXTERN CGFloat CGRectGetMaxX(CGRect rect)*/

/* Return the bottommost y-value of `rect'. */

/*CG_EXTERN CGFloat CGRectGetMinY(CGRect rect)*/

/* Return the midpoint y-value of `rect'. */

/*CG_EXTERN CGFloat CGRectGetMidY(CGRect rect)*/

/* Return the topmost y-value of `rect'. */

/*CG_EXTERN CGFloat CGRectGetMaxY(CGRect rect)*/

/* Return the width of `rect'. */

/*CG_EXTERN CGFloat CGRectGetWidth(CGRect rect)*/

/* Return the height of `rect'. */

/*CG_EXTERN CGFloat CGRectGetHeight(CGRect rect)*/

/* Return true if `point1' and `point2' are the same, false otherwise. */

/*CG_EXTERN bool CGPointEqualToPoint(CGPoint point1, CGPoint point2)*/

/* Return true if `size1' and `size2' are the same, false otherwise. */

/*CG_EXTERN bool CGSizeEqualToSize(CGSize size1, CGSize size2)*/

/* Return true if `rect1' and `rect2' are the same, false otherwise. */

/*CG_EXTERN bool CGRectEqualToRect(CGRect rect1, CGRect rect2)*/

/* Standardize `rect' -- i.e., convert it to an equivalent rect which has
   positive width and height. */

/*CG_EXTERN CGRect CGRectStandardize(CGRect rect)*/

/* Return true if `rect' is empty (that is, if it has zero width or height),
   false otherwise. A null rect is defined to be empty. */

/*CG_EXTERN bool CGRectIsEmpty(CGRect rect)*/

/* Return true if `rect' is the null rectangle, false otherwise. */

/*CG_EXTERN bool CGRectIsNull(CGRect rect)*/

/* Return true if `rect' is the infinite rectangle, false otherwise. */

/*CG_EXTERN bool CGRectIsInfinite(CGRect rect)*/

/* Inset `rect' by `(dx, dy)' -- i.e., offset its origin by `(dx, dy)', and
   decrease its size by `(2*dx, 2*dy)'. */

/*CG_EXTERN CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)*/

/* Expand `rect' to the smallest rect containing it with integral origin and
   size. */

/*CG_EXTERN CGRect CGRectIntegral(CGRect rect)*/

/* Return the union of `r1' and `r2'. */

/*CG_EXTERN CGRect CGRectUnion(CGRect r1, CGRect r2)*/

/* Return the intersection of `r1' and `r2'. This may return a null rect. */

/*CG_EXTERN CGRect CGRectIntersection(CGRect r1, CGRect r2)*/

/* Offset `rect' by `(dx, dy)'. */

/*CG_EXTERN CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)*/

/* Make two new rectangles, `slice' and `remainder', by dividing `rect' with
   a line that's parallel to one of its sides, specified by `edge' -- either
   `CGRectMinXEdge', `CGRectMinYEdge', `CGRectMaxXEdge', or
   `CGRectMaxYEdge'. The size of `slice' is determined by `amount', which
   measures the distance from the specified edge. */

/*	   CG_EXTERN void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)*/

/* Return true if `point' is contained in `rect', false otherwise. */

/*CG_EXTERN bool CGRectContainsPoint(CGRect rect, CGPoint point)*/

/* Return true if `rect2' is contained in `rect1', false otherwise. `rect2'
   is contained in `rect1' if the union of `rect1' and `rect2' is equal to
   `rect1'. */

/*CG_EXTERN bool CGRectContainsRect(CGRect rect1, CGRect rect2)*/

/* Return true if `rect1' intersects `rect2', false otherwise. `rect1'
   intersects `rect2' if the intersection of `rect1' and `rect2' is not the
   null rect. */

/*CG_EXTERN bool CGRectIntersectsRect(CGRect rect1, CGRect rect2)*/

/*** Persistent representations. ***/

/* Return a dictionary representation of `point'. */

/*CG_EXTERN CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)*/

/* Make a CGPoint from the contents of `dict' (presumably returned earlier
   from `CGPointCreateDictionaryRepresentation') and store the value in
   `point'. Returns true on success; false otherwise. */

/*CG_EXTERN bool CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point) CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);*/

/* Return a dictionary representation of `size'. */

/*CG_EXTERN CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)*/

/* Make a CGSize from the contents of `dict' (presumably returned earlier
   from `CGSizeCreateDictionaryRepresentation') and store the value in
   `size'. Returns true on success; false otherwise. */

/*CG_EXTERN bool CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size) CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);*/

/* Return a dictionary representation of `rect'. */

/*CG_EXTERN CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect)*/

/* Make a CGRect from the contents of `dict' (presumably returned earlier
   from `CGRectCreateDictionaryRepresentation') and store the value in
   `rect'. Returns true on success; false otherwise. */

/*CG_EXTERN bool CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect) CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);*/

/*** Definitions of inline functions. ***/

/*CG_INLINE CGPoint
CGPointMake(CGFloat x, CGFloat y)
{
  CGPoint p; p.x = x; p.y = y; return p;
}

CG_INLINE CGSize
CGSizeMake(CGFloat width, CGFloat height)
{
  CGSize size; size.width = width; size.height = height; return size;
}

CG_INLINE CGRect
CGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
  CGRect rect;
  rect.origin.x = x; rect.origin.y = y;
  rect.size.width = width; rect.size.height = height;
  return rect;
}

CG_INLINE bool
__CGPointEqualToPoint(CGPoint point1, CGPoint point2)
{
  return point1.x == point2.x && point1.y == point2.y;
}
#define CGPointEqualToPoint __CGPointEqualToPoint

CG_INLINE bool
__CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return size1.width == size2.width && size1.height == size2.height;
}
#define CGSizeEqualToSize __CGSizeEqualToSize*/
