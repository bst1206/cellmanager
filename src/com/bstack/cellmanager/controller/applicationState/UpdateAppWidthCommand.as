package com.bstack.cellmanager.controller.applicationState
{
	import com.bstack.cellmanager.events.applicationState.UpdateAppWidthCommandEvent;
	import com.bstack.cellmanager.model.ApplicationStateModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class UpdateAppWidthCommand extends Command
	{
		[Inject]
		public var event:UpdateAppWidthCommandEvent;
		
		[Inject]
		public var model:ApplicationStateModel;
		
		public function UpdateAppWidthCommand()
		{
			super();
		}
		
		// ------ Command Overrides -------
		override public function execute():void
		{
			model.setAppWidth(event.appWidth);
		}
	}
}