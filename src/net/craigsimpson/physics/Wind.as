/////////////////////////////////////////////////////////////////////////////
// 
// Copyright 2009 Craig Simpson
// Some rights reserved.Your reuse is governed by the Creative
// Commons Attribution 3.0 United States License
//
////////////////////////////////////////////////////////////////////////////////

package net.craigsimpson.physics {

import flash.events.EventDispatcher;
import flash.events.Event;

/**
 *	Class description.
 *
 *	@langversion ActionScript 3.0
 *	@playerversion Flash 9.0
 *
 *	@author Craig Simpson
 *	@since  24.01.2009
 */
public class Wind {
	
	/**
	 *	@constructor
	 */
	public function Wind(velocityX:Number, velocityY:Number)
	{
		setVelocity(velocityX, velocityY);
	}
	
	//--------------------------------------
	//  PRIVATE VARIABLES
	//--------------------------------------
	private var _velocityX:Number;
	private var _velocityY:Number;
	private var _maxVelocity:Number = 1;
	
	//--------------------------------------
	//  GETTER/SETTERS
	//--------------------------------------
	public function get velocityX():Number
	{
		return _velocityX;
	}
	
	public function get velocityY():Number
	{
		return _velocityY;
	}
	
	public function get maxVelocity():Number
	{
		return _maxVelocity;
	}
	
	public function set maxVelocity(value:Number):void
	{
		_maxVelocity = Math.abs(value);
	}

	//--------------------------------------
	//  PUBLIC METHODS
	//--------------------------------------
	
	public function setVelocity(velocityX:Number, velocityY:Number):void
	{
		_velocityX = (velocityX <= _maxVelocity)?velocityX:_maxVelocity;
		_velocityY = (velocityY <= _maxVelocity)?velocityY:_maxVelocity;
	}
	
	public function toString():String
	{
		return "Wind :: velocityX:"+ _velocityX +" velocityY:"+ _velocityY;
	}	
}

}

