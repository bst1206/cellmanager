package com.bstack.cellmanager.controller.applicationState
{
	import com.bstack.cellmanager.events.applicationState.UpdateAppHeightCommandEvent;
	import com.bstack.cellmanager.model.ApplicationStateModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class UpdateAppHeightCommand extends Command
	{
		[Inject]
		public var event:UpdateAppHeightCommandEvent;
		
		[Inject]
		public var model:ApplicationStateModel;
		
		public function UpdateAppHeightCommand()
		{
			super();
		}
		
		// ------- Command Overrides -------
		override public function execute():void
		{
			model.setAppHeight(event.appHeight);
		}
	}
}