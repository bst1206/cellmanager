package com.bstack.cellmanager.controller.application
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	public class StartupCommand extends Command
	{
		[Inject]
		public var event:ContextEvent;
		
		public function StartupCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			//on startup..
		}
	}
}