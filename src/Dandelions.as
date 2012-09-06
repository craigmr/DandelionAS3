/////////////////////////////////////////////////////////////////////////////
// 
// Copyright 2009 Craig Simpson
// Some rights reserved.Your reuse is governed by the Creative
// Commons Attribution 3.0 United States License
//
////////////////////////////////////////////////////////////////////////////////

package  {
	
import flash.display.Sprite;

import net.craigsimpson.dandelions.Dandelion;
import net.craigsimpson.dandelions.InteractiveWind;

/**
 *	Class description.
 *
 *	@langversion ActionScript 3.0
 *	@playerversion Flash 9.0
 *
 *	@author Craig Simpson
 *	@since  24.01.2009
 */
public class Dandelions extends Sprite {
	
	//--------------------------------------
	// CLASS CONSTANTS
	//--------------------------------------
	private const NUMBER_OF_SEEDS:Number = 40;
	private const MAX_WIND_SPEED:Number = 1;
	
	/**
	 *	@constructor
	 */
	public function Dandelions()
	{
		super();
		
		wind = new InteractiveWind(stage, MAX_WIND_SPEED);
		addSeeds();
	}
	
	//--------------------------------------
	//  PRIVATE VARIABLES
	//--------------------------------------
	private var wind:InteractiveWind;
	
	//--------------------------------------
	//  PRIVATE & PROTECTED INSTANCE METHODS
	//--------------------------------------
	private function addSeeds():void
	{
		for(var i:int; i < NUMBER_OF_SEEDS; i ++ )
		{
			var seed:Dandelion = new Dandelion(wind);
			addChild(seed);
		}
	}
}

}

