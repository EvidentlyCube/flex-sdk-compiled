////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2009 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package mx.automation.delegates.advancedDataGrid
{ 
	import flash.display.DisplayObject;
	import flash.events.Event;
	import mx.automation.Automation;
	
	import mx.automation.delegates.core.UITextFieldAutomationImpl;
	import mx.automation.IAutomationObjectHelper;
	import mx.automation.delegates.core.UIComponentAutomationImpl;
	import mx.controls.listClasses.ListItemRenderer; 
	import mx.controls.olapDataGridClasses.OLAPDataGridGroupRenderer;
	import mx.core.mx_internal;
	import mx.core.IUITextField;
	
	use namespace mx_internal;
	
	[Mixin]
	/**
	 * 
	 *  Defines methods and properties required to perform instrumentation for the 
	 *  OLAPDataGridGroupRenderer class.
	 *  
	 *  @see mx.controls.olapDataGridClasses.OLAPDataGridGroupRenderer 
	 *
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 9
	 *  @playerversion AIR 1.1
	 *  @productversion Flex 3
	 */ 
	public class  OLAPDataGridGroupRendererAutomationImpl extends UIComponentAutomationImpl
	{
		
		//--------------------------------------------------------------------------
		//
		//  Class methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Registers the delegate class for a component class with automation manager.
		 *  
		 *  @param root The SystemManger of the application.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		public static function init(root:DisplayObject):void
		{
			Automation.registerDelegateClass(OLAPDataGridGroupRenderer, OLAPDataGridGroupRendererAutomationImpl);
		}   
		
		//--------------------------------------------------------------------------
		// 
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/** 
		 *  Constructor.
		 * @param obj OLAPDataGridGroupRenderer object to be automated.     
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		public function OLAPDataGridGroupRendererAutomationImpl(obj:OLAPDataGridGroupRenderer)
		{
			
			super(obj);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 *  storage for the owner component
		 */
		protected function get listItemRend():OLAPDataGridGroupRenderer
		{
			return uiComponent as OLAPDataGridGroupRenderer;
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Overridden properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  automationName
		//----------------------------------
		
		/**
		 *  @private
		 */
		override public function get automationName():String
		{
			
			return ( listItemRend.listData.label ||  super.automationName);
		}
		
		//----------------------------------
		//  automationValue
		//----------------------------------
		
		/**
		 *  @private
		 */
		override public function get automationValue():Array
		{
			return [automationName];
		}
		
	}
}