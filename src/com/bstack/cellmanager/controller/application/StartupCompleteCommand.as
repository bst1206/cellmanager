package com.bstack.cellmanager.controller.application
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.Context;
	
	public class StartupCompleteCommand extends Command
	{
		[Inject]
		public var event:ContextEvent;
		
		public function StartupCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			//on startupComplete
		}
	}
}