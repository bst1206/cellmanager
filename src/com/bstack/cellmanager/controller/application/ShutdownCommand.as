package com.bstack.cellmanager.controller.application
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	public class ShutdownCommand extends Command
	{
		[Inject]
		public var event:ContextEvent;
		
		public function ShutdownCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			//on shutdown..
		}
	}
}