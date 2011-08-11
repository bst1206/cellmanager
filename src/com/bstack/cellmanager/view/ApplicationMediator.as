package com.bstack.cellmanager.view
{
	import org.robotlegs.mvcs.Mediator;
	
	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view:CellManager;
		
		public function ApplicationMediator()
		{
			super();
		}
	}
}