package objc.quartz;

extern class CAEmitterLayer extends CALayer {

/* The array of emitter cells attached to the layer. Each object must
 * have the CAEmitterCell class. */

	public var emitterCells :Array<CAEmitterCell>;

/* The birth rate of each cell is multiplied by this number to give the
 * actual number of particles created every second. Default value is one.
 * Animatable. */

	public var  float birthRate;

/* The cell lifetime range is multiplied by this value when particles are
 * created. Defaults to one. Animatable. */

	public var  float lifetime;

/* The center of the emission shape. Defaults to (0, 0, 0). Animatable. */

	public var  CGPoint emitterPosition;
	public var  Float emitterZPosition;

/* The size of the emission shape. Defaults to (0, 0, 0). Animatable.
 * Depending on the `emitterShape' property some of the values may be
 * ignored. */

	public var  CGSize emitterSize;
	public var  Float emitterDepth;

/* A string defining the type of emission shape used. Current options are:
 * `point' (the default), `line', `rectangle', `circle', `cuboid' and
 * `sphere'. */

	public var NSString *emitterShape;

/* A string defining how particles are created relative to the emission
 * shape. Current options are `points', `outline', `surface' and
 * `volume' (the default). */

	public var NSString *emitterMode;

/* A string defining how particles are composited into the layer's
 * image. Current options are `unordered' (the default), `oldestFirst',
 * `oldestLast', `backToFront' (i.e. sorted into Z order) and
 * `additive'. The first four use source-over compositing, the last
 * uses additive compositing. */

	public var NSString *renderMode;

/* When true the particles are rendered as if they directly inhabit the
 * three dimensional coordinate space of the layer's superlayer, rather
 * than being flattened into the layer's plane first. Defaults to NO.
 * If true, the effect of the `filters', `backgroundFilters' and shadow-
 * related properties of the layer is undefined. */

	public var  BOOL preservesDepth;

/* Multiplies the cell-defined particle velocity. Defaults to one.
 * Animatable. */

	public var  float velocity;

/* Multiplies the cell-defined particle scale. Defaults to one. Animatable. */

	public var  float scale;

/* Multiplies the cell-defined particle spin. Defaults to one. Animatable. */

	public var  float spin;

/* The seed used to initialize the random number generator. Defaults to
 * zero. Each layer has its own RNG state. For properties with a mean M
 * and a range R, random values of the properties are uniformly
 * distributed in the interval [M - R/2, M + R/2]. */

	public var  unsigned int seed;

}

/** `emitterShape' values. **/

CA_EXTERN NSString * const kCAEmitterLayerPoint
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerLine
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerRectangle
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerCuboid
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerCircle
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerSphere
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);

/** `emitterMode' values. **/

CA_EXTERN NSString * const kCAEmitterLayerPoints
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerOutline
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerSurface
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerVolume
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);

/** `renderOrder' values. **/

CA_EXTERN NSString * const kCAEmitterLayerUnordered
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerOldestFirst
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerOldestLast
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerBackToFront
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerAdditive
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
