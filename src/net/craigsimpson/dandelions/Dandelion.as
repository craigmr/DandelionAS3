/////////////////////////////////////////////////////////////////////////////
// 
// Copyright 2009 Craig Simpson
// Some rights reserved.Your reuse is governed by the Creative
// Commons Attribution 3.0 United States License
//
////////////////////////////////////////////////////////////////////////////////

package net.craigsimpson.dandelions {

import net.craigsimpson.animation.Float;
import net.craigsimpson.physics.Wind;
import flash.events.MouseEvent;

/**
 *	Class description.
 *
 *	@langversion ActionScript 3.0
 *	@playerversion Flash 9.0
 *
 *	@author Craig Simpson
 *	@since  24.01.2009
 */
public class Dandelion extends Float {
	
	//--------------------------------------
	// CLASS CONSTANTS
	//--------------------------------------
	public const MAX_SIZE:Number = 20;
	public const MIN_SIZE:Number = 10;
	public const MAX_ANGLE:Number = 20;
	
	//--------------------------------------
	//  CONSTRUCTOR
	//--------------------------------------
	
	/**
	 *	@constructor
	 */
	public function Dandelion(wind:Wind)
	{
		super(wind);
		sizeRatio = width/height;
		setSize();
		addEventListener(MouseEvent.CLICK, removeDandelion);
	}
	
	//--------------------------------------
	//  PRIVATE VARIABLES
	//--------------------------------------
	private var sizeRatio:Number;
	
	//--------------------------------------
	//  EVENT HANDLERS
	//--------------------------------------
	private function removeDandelion(event:MouseEvent)
	{
		remove();
		removeEventListener(MouseEvent.CLICK, removeDandelion);
	}
	//--------------------------------------
	//  PRIVATE & PROTECTED INSTANCE METHODS
	//--------------------------------------
	
	private function setSize():void 
	{
		var size:Number = Math.random() * MAX_SIZE;
		size = (size < MIN_SIZE) ? MIN_SIZE : size;
		height = size;
		width = sizeRatio*size;	
	}
	
	protected override function enterFrame():void
	{
		rotation = -1 * wind.velocityX/wind.maxVelocity * MAX_ANGLE;
	}
}
}

