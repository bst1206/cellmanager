package com.bstack.cellmanager
{
	import com.bstack.cellmanager.controller.application.ShutdownCommand;
	import com.bstack.cellmanager.controller.application.ShutdownCompleteCommand;
	import com.bstack.cellmanager.controller.application.StartupCommand;
	import com.bstack.cellmanager.controller.application.StartupCompleteCommand;
	import com.bstack.cellmanager.controller.applicationState.UpdateAppHeightCommand;
	import com.bstack.cellmanager.controller.applicationState.UpdateAppWidthCommand;
	import com.bstack.cellmanager.events.applicationState.UpdateAppHeightCommandEvent;
	import com.bstack.cellmanager.events.applicationState.UpdateAppWidthCommandEvent;
	import com.bstack.cellmanager.model.ApplicationStateModel;
	import com.bstack.cellmanager.view.mediator.ApplicationMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	public class CellManagerContext extends Context
	{
		public function CellManagerContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			//mapping startup events;
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCompleteCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.SHUTDOWN, ShutdownCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.SHUTDOWN_COMPLETE, ShutdownCompleteCommand, ContextEvent, true);
			
			//startup
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP, contextView));
		
			//
			//register events
			//
			// update application state commands
			commandMap.mapEvent(UpdateAppWidthCommandEvent.UPDATE_APP_WIDTH, UpdateAppWidthCommand, UpdateAppWidthCommandEvent);
			commandMap.mapEvent(UpdateAppHeightCommandEvent.UPDATE_APP_HEIGHT, UpdateAppHeightCommand, UpdateAppHeightCommandEvent);
			
			
			//
			//register models
			//
			injector.mapSingleton(ApplicationStateModel);
			
			
			
			//
			//register view/mediators
			//
			mediatorMap.mapView(CellManager, ApplicationMediator);
		
			
			//
			//register component/mediators
			//
			
		}
	}
}