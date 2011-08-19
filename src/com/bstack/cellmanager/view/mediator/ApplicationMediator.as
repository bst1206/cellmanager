package com.bstack.cellmanager.view.mediator
{
	import com.bstack.cellmanager.events.applicationState.UpdateAppHeightCommandEvent;
	import com.bstack.cellmanager.events.applicationState.UpdateAppWidthCommandEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view:CellManager;
		
		public function ApplicationMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			addViewListener(UpdateAppHeightCommandEvent.UPDATE_APP_HEIGHT, _onUpdateAppHeight);
			addViewListener(UpdateAppWidthCommandEvent.UPDATE_APP_WIDTH, _onUpdateAppWidth);
		}
		
		// ------- Event Handlers -------
		private function _onUpdateAppHeight(event:UpdateAppHeightCommandEvent):void
		{
			dispatch(event);
		}
		
		private function _onUpdateAppWidth(event:UpdateAppWidthCommandEvent):void
		{
			dispatch(event);
		}
	}
}