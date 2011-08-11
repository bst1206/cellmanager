package com.bstack.cellmanager.controller.application
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	public class ShutdownCompleteCommand extends Command
	{
		[Inject]
		public var event:ContextEvent;
		
		public function ShutdownCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			//on shutdownComplete...
		}
	}
}