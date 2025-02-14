////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2004-2007 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package spark.accessibility
{

import flash.accessibility.Accessibility;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import mx.accessibility.AccConst;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.CloseEvent;

import spark.components.Button;
import spark.components.Panel;
import spark.components.supportClasses.TextBase;
import spark.components.TitleWindow;
import spark.events.SkinPartEvent;
import spark.events.TitleWindowBoundsEvent;

use namespace mx_internal;

/**
 *  TitleWindowAccImpl is the accessibility implementation class
 *  for spark.components.TitleWindow.
 *
 *  <p>When a Spark TitleWindow is created,
 *  the <code>accessibilityImplementation</code> property
 *  of a special child Sprite is set to an instance of this class.
 *  The Flash Player then uses this class to allow MSAA clients
 *  such as screen readers to see this component.
 *  See the mx.accessibility.AccImpl and
 *  flash.accessibility.AccessibilityImplementation classes
 *  for background information about accessibility implementation
 *  classes and MSAA.</p>
 *
 *  <p><b>Children</b></p>
 *
 *  <p>A TitleWindow has no MSAA children.
 *  All children of the actual TitleWindow are siblings of the TitleWindow
 *  in the FlashPlayer's MSAA tree, because Flash Player
 *  does not support objects with accessibility implementations
 *  having children with their own accessibility implementations.</p>
 *
 *  <p>The TitleWindowAcImpl is set as the
 *  <code>accessibilityImplementation</code> of the <code>titleDisplay</code>
 *   because setting it on the TitleWindow itself would not allow the
 *  TitleWindows's children to be exposed in MSAA.
 *  Because of this an invisible rectangle is drawn in the
 *  <code>titleDisplay</code> making it the same size as the TitleWindow
 *  as a whole so that the MSAA Location is the bounding rectangle
 *  of the entire TitleWindow.
 *  Screen readers like JAWS rely on the MSAA Location to announce whether
 *  some component is in the TitleWindow since the MSAA structure is flat.</p>
 *
 *  <p><b>Role</b></p>
 *
 *  <p>The MSAA Role of a TitleWindow is ROLE_SYSTEM_PANE.</p>
 *
 *  <p><b>Name</b></p>
 *
 *  <p>The MSAA Name of a TitleWindow is, by default,
 *  the title that it displays.
 *  To override this behavior,
 *  set the TitleWindow's <code>accessibilityName</code> property.</p>
 *
 *  <p>When the Name changes,
 *  a TitleWindow dispatches the MSAA event EVENT_OBJECT_NAMECHANGE.</p>
 *
 *  <p><b>Description</b></p>
 *
 *  <p>The MSAA Description of a TitleWindow is, by default,
 *  the empty string, but you can set the TitleWindows's
 *  <code>accessibilityDescription</code> property.</p>
 *
 *  <p><b>State</b></p>
 *
 *  <p>The MSAA State of a TitleWindow is always STATE_SYSTEM_MOVEABLE.</p>
 *
 *  <p>Since the State does not change,
 *  a TitleWindow does not dispatch the MSAA event EVENT_OBJECT_STATECHANGE.</p>
 *
 *  <p><b>Value</b></p>
 *
 *  <p>The MSAA Value of a TitleWindow is always the empty string.</p>
 *
 *  <p><b>Location</b></p>
 *
 *  <p>The MSAA Location of a TitleWindow is its bounding rectangle.</p>
 *
 *  <p><b>Default Action</b></p>
 *
 *  <p>A TitleWindow does not have an MSAA DefaultAction.</p>
 *
 *  <p><b>Focus</b></p>
 *
 *  <p>A TitleWindow does not accept focus.</p>
 *
 *  <p><b>Selection</b></p>
 *
 *  <p>A TitleWindow does not support selection in the MSAA sense.</p>
 *
 *  <p><b>Other</b></p>
 *
 *  <p>A TitleWindow also dispatches the following MSAA events:
 *  <ul>
 *     <li>EVENT_OBJECT_CREATE, when it is created</li>
 *     <li>EVENT_OBJECT_DESTROY, when it is closed</li>
 *     <li>EVENT_OBJECT_LOCATIONCHANGE, when it is moved</li>
 *  </ul></p>
 *  
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 1.5
 *  @productversion Flex 4
 */
public class TitleWindowAccImpl extends PanelAccImpl
{
    include "../core/Version.as";

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    /**
     *  Enables accessibility in the TitleWindow class.
     * 
     *  <p>This method is called by application startup code
     *  that is autogenerated by the MXML compiler.
     *  Afterwards, when instances of TitleWindow are initialized,
     *  the <code>accessibilityImplementation</code> property
     *  of a special first child Sprite will be set to an instance
     *  of this class.
     *  If the TitleWindowAccImpl were attached to the TitleWindow itself
     *  the accessibility implementations of the TitleWindow's children
     *  would be ignored.</p>
     *  
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 1.5
     *  @productversion Flex 4
     */
    public static function enableAccessibility():void
    {
        TitleWindow.createAccessibilityImplementation =
            createAccessibilityImplementation;
    }

    /**
     *  @private
     *  Creates a TitleWindow's AccessibilityImplementation object.
     *  This method is called from TitleWindow's
     *  initializeAccessibility() method.
     */
    mx_internal static function createAccessibilityImplementation(
                                component:UIComponent):void
    {
        // The TitleWindowAccImpl is attached
        // not to the TitleWindow but to a special child Sprite.
        // If it were attached to the TitleWindow itself,
        // the AccessibilityImplementations of the TitleWindow's
        // children would be ignored.
        var accImpl:TitleWindowAccImpl = new TitleWindowAccImpl(component);
        var accImplSprite:Sprite = accImpl.attach();
        
        Accessibility.sendEvent(accImplSprite, 0, AccConst.EVENT_OBJECT_CREATE);
        Accessibility.updateProperties();
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *
     *  @param master The UIComponent instance that this AccImpl instance
     *  is making accessible.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 1.5
     *  @productversion Flex 4
     */
    public function TitleWindowAccImpl(master:UIComponent)
    {
        super(master);
        
        role = AccConst.ROLE_SYSTEM_PANE;
    }
    
    //--------------------------------------------------------------------------
    //
    //  Overridden properties: AccImpl
    //
    //--------------------------------------------------------------------------
    
    //----------------------------------
    //  eventsToHandle
    //----------------------------------
    
    /**
     *  @private
     *  Array of events that we should listen for from the master component.
     */
    override protected function get eventsToHandle():Array
    {
        return super.eventsToHandle.concat(
            [ TitleWindowBoundsEvent.WINDOW_MOVE_END, CloseEvent.CLOSE ]);
    }
    
    //--------------------------------------------------------------------------
    //
    //  Overridden methods: AccessibilityImplementation
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  IAccessible method for returning the state of the TitleWindow.
     *  States are predefined for all the components in MSAA.
     *  Values are assigned to each state.
     *  Depending upon the TitleWindow being Focusable, Focused and Moveable,
     *  a value is returned.
     *
     *  @param childID:uint
     *
     *  @return State:uint
     */
    override public function get_accState(childID:uint):uint
    {
        var accState:uint = getState(childID);
        
        accState |= AccConst.STATE_SYSTEM_MOVEABLE;
        
        return accState;
    }
    
    //--------------------------------------------------------------------------
    //
    //  Overridden event handlers: AccImpl
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  Override the generic event handler.
     *  All AccImpl must implement this
     *  to listen for events from its master component. 
     */
    override protected function eventHandler(event:Event):void
    {
        super.eventHandler(event);

        switch (event.type)
        {
            case TitleWindowBoundsEvent.WINDOW_MOVE_END:
            {
                Accessibility.sendEvent(accImplSprite, 0,
                    AccConst.EVENT_OBJECT_LOCATIONCHANGE, true);
                Accessibility.updateProperties();
                break;
            }
            
            case CloseEvent.CLOSE:
            {
                Accessibility.sendEvent(accImplSprite, 0,
                                        AccConst.EVENT_OBJECT_DESTROY, true);
                Accessibility.updateProperties();
                break;
            }
        }
    }
}

}
