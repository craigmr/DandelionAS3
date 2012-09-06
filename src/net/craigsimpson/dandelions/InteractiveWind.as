/////////////////////////////////////////////////////////////////////////////
// 
// Copyright 2009 Craig Simpson
// Some rights reserved.Your reuse is governed by the Creative
// Commons Attribution 3.0 United States License
//
////////////////////////////////////////////////////////////////////////////////

package net.craigsimpson.dandelions {

import flash.display.Stage;
import flash.events.MouseEvent;
import flash.events.Event;

import net.craigsimpson.physics.Wind;

/**
 *	Class description.
 *
 *	@langversion ActionScript 3.0
 *	@playerversion Flash 9.0
 *
 *	@author Craig Simpson
 *	@since  24.01.2009
 */
public class InteractiveWind extends Wind {

	/**
	 *	@constructor
	 */
	public function InteractiveWind(stage:Stage, maxVelocity:Number = 1)
	{
		super(0,0.5);
		_stage = stage;
		this.maxVelocity = maxVelocity;
		init();
	}
	
	//--------------------------------------
	//  PRIVATE VARIABLES
	//--------------------------------------
	private var _mouseX:Number;
	private var _mouseY:Number;
	
	private var _stage:Stage;
	
	private var _height:Number;
	private var _width:Number;
	
	//--------------------------------------
	//  EVENT HANDLERS
	//--------------------------------------
	private function changeVelocity(event:MouseEvent):void
	{
		setVelocity(getNewXVelocity(event.stageX), getNewYVelocity(event.stageY));
	}
	
	private function lossFocusHandler(event:Event):void
	{
		_stage.removeEventListener(MouseEvent.MOUSE_MOVE, changeVelocity);
	}
	
	private function focusHandler(event:Event):void
	{
		_stage.addEventListener(MouseEvent.MOUSE_MOVE, changeVelocity);
	}	
	//--------------------------------------
	//  PRIVATE & PROTECTED INSTANCE METHODS
	//--------------------------------------
	private function init():void
	{	
		_height = _stage.stageHeight;
		_width = _stage.stageWidth;
		_stage.addEventListener(Event.DEACTIVATE, lossFocusHandler);
		_stage.addEventListener(Event.ACTIVATE, focusHandler);
	}
	
	private function getNewXVelocity(mousePosition:Number):Number
	{	
		return maxVelocity * (mousePosition/_width*0.5 - 1) ;
	}
	
	private function getNewYVelocity(mousePosition:Number):Number
	{
		return -1 * maxVelocity * (mousePosition/_height*0.5 - 1) ;
	}
}
}

