package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.StartCampaignMessageComposer;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class QuestTracker implements IDisposable
   {
      
      private static const const_322:int = 0;
      
      private static const const_689:int = 1;
      
      private static const const_690:int = 2;
      
      private static const const_1057:int = 3;
      
      private static const const_1061:int = 4;
      
      private static const const_1058:int = 5;
      
      private static const const_1063:int = 6;
      
      private static const const_1062:Array = [-2,-3,-2,0,2,3,2,0,2,1,0,1];
      
      private static const const_1059:Array = [1,1,2,2,3,3,4,4,5,5,6,6,4];
      
      private static const const_1060:int = 6;
      
      private static const const_1468:int = 4;
      
      private static const const_691:int = 2;
      
      private static const const_1064:int = 200;
      
      private static const const_323:Array = ["a","b","c","d"];
      
      private static const const_1065:int = 10000;
      
      private static const const_1469:int = 0;
      
      private static const const_688:int = -1;
      
      private static const const_1473:Point = new Point(10,87);
      
      private static const const_1471:int = 162;
      
      private static const const_1470:Number = 0.01;
      
      private static const const_1472:Number = 100;
      
      private static const const_1467:int = 1000;
      
      private static const const_687:String = "quest_tracker";
      
      private static const const_1466:int = 10;
       
      
      private var var_50:HabboQuestEngine;
      
      private var var_212:QuestMessageData;
      
      private var _window:IWindowContainer;
      
      private var var_531:Timer;
      
      private var var_780:ProgressBar;
      
      private var var_239:int = 0;
      
      private var var_974:int = 0;
      
      private var var_1469:int = 0;
      
      private var var_1187:int = -1;
      
      private var var_781:int = -1;
      
      private var var_973:int = -1;
      
      private var var_1188:int;
      
      private var var_1468:int;
      
      private var var_2332:Boolean;
      
      public function QuestTracker(param1:HabboQuestEngine)
      {
         super();
         this.var_50 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_50)
         {
            this.var_50.toolbar.extensionView.detachExtension(const_687);
         }
         this.var_50 = null;
         this.var_212 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_531)
         {
            this.var_531.stop();
            this.var_531 = null;
         }
         if(this.var_780)
         {
            this.var_780.dispose();
            this.var_780 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_50 == null;
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         if(this._window)
         {
            this.clearPrompt();
            this.var_212 = param1;
            this.var_974 = 0;
            this.refreshTrackerDetails();
            this.var_1187 = 0;
            this.var_239 = const_1057;
         }
      }
      
      public function onQuestCancelled() : void
      {
         this.var_212 = null;
         if(this._window)
         {
            this.clearPrompt();
            this.var_780.refresh(0,100,-1);
            this.var_239 = const_690;
         }
      }
      
      public function onRoomEnter() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Boolean = Boolean(parseInt(this.var_50.configuration.getKey("new.identity","0")));
         var _loc2_:String = this.getDefaultCampaign();
         if(this.var_531 == null && _loc1_ && _loc2_ != "")
         {
            _loc3_ = int(this.var_50.configuration.getKey("questing.startQuestDelayInSeconds","30"));
            this.var_531 = new Timer(_loc3_ * 1000,1);
            this.var_531.addEventListener(TimerEvent.TIMER,this.onStartQuestTimer);
            this.var_531.start();
            Logger.log("Initialized start quest timer with period: " + _loc3_);
         }
      }
      
      public function onRoomExit() : void
      {
         if(this._window != null && this._window.visible)
         {
            this._window.findChildByName("more_info_txt").visible = false;
            this._window.findChildByName("more_info_region").visible = false;
         }
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         var _loc2_:Boolean = this._window && this._window.visible;
         if(param1.waitPeriodSeconds > 0)
         {
            if(_loc2_)
            {
               this.setWindowVisible(false);
            }
            return;
         }
         this.var_212 = param1;
         this.prepareTrackerWindow();
         this.refreshTrackerDetails();
         this.refreshPromptFrames();
         this.setWindowVisible(true);
         this.hideSuccessFrames();
         if(_loc2_)
         {
            if(this.var_239 == const_690)
            {
               this.var_239 = const_689;
            }
            this.setupPrompt(this.var_781,const_1468,false);
         }
         else
         {
            this._window.x = this.getOutScreenLocationX();
            this.var_239 = const_689;
            this.setupPrompt(const_1469,const_691,false);
         }
      }
      
      private function refreshPromptFrames() : void
      {
         if(!this.var_50.isQuestWithPrompts(this.var_212))
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < const_323.length)
         {
            this.var_50.setupPromptFrameImage(this._window,this.var_212,const_323[_loc1_]);
            _loc1_++;
         }
      }
      
      private function prepareTrackerWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this.var_50.getXmlWindow("QuestTracker"));
         this._window.findChildByName("more_info_region").procedure = this.onMoreInfo;
         new PendingImage(this.var_50,this._window.findChildByName("quest_tracker_bg"),"quest_tracker_with_bar");
         var _loc1_:int = 1;
         while(_loc1_ <= const_1060)
         {
            new PendingImage(this.var_50,this.getSuccessFrame(_loc1_),"checkanim" + _loc1_);
            _loc1_++;
         }
         this.hideSuccessFrames();
         this.var_780 = new ProgressBar(this.var_50,IWindowContainer(this._window.findChildByName("content_cont")),const_1471,"quests.tracker.progress",false,const_1473);
      }
      
      private function hideSuccessFrames() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ <= const_1060)
         {
            this.getSuccessFrame(_loc1_).visible = false;
            _loc1_++;
         }
      }
      
      private function hidePromptFrames() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < const_323.length)
         {
            this.getPromptFrame(const_323[_loc1_]).visible = false;
            _loc1_++;
         }
      }
      
      private function getSuccessFrame(param1:int) : IBitmapWrapperWindow
      {
         return IBitmapWrapperWindow(this._window.findChildByName("success_pic_" + param1));
      }
      
      private function getPromptFrame(param1:String) : IBitmapWrapperWindow
      {
         return IBitmapWrapperWindow(this._window.findChildByName("prompt_pic_" + param1));
      }
      
      private function refreshTrackerDetails() : void
      {
         this.var_50.localization.registerParameter("quests.tracker.caption","quest_name",this.var_50.getQuestName(this.var_212));
         this._window.findChildByName("desc_txt").caption = this.var_50.getQuestDesc(this.var_212);
         this._window.findChildByName("more_info_txt").visible = this.var_50.currentlyInRoom;
         this._window.findChildByName("more_info_region").visible = this.var_50.currentlyInRoom;
         var _loc1_:int = Math.round(100 * this.var_212.completedSteps / this.var_212.totalSteps);
         this.var_780.refresh(_loc1_,100,this.var_212.id);
         this.var_50.setupQuestImage(this._window,this.var_212);
      }
      
      private function onMoreInfo(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_50.questController.questDetails.showDetails(this.var_212);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._window == null)
         {
            return;
         }
         this.var_780.updateView();
         switch(this.var_239)
         {
            case const_689:
               _loc2_ = this.getDefaultLocationX();
               _loc3_ = this._window.x - _loc2_;
               if(_loc3_ > 0)
               {
                  _loc4_ = Math.max(1,Math.round(_loc3_ * param1 * const_1470));
                  this._window.x -= _loc4_;
               }
               else
               {
                  this.var_239 = const_322;
                  this._window.x = _loc2_;
               }
               break;
            case const_690:
               _loc2_ = this.getOutScreenLocationX();
               _loc3_ = this._window.width - this._window.x;
               if(_loc3_ > 0)
               {
                  _loc4_ = Math.max(1,Math.round(param1 * const_1472 / _loc3_));
                  this._window.x += _loc4_;
               }
               else
               {
                  this.var_239 = const_322;
                  this._window.x = _loc2_;
                  this.setWindowVisible(false);
               }
               break;
            case const_1057:
               this.hideSuccessFrames();
               this.getSuccessFrame(const_1059[this.var_1187]).visible = true;
               ++this.var_1187;
               if(this.var_1187 >= const_1059.length)
               {
                  this.var_239 = const_1058;
                  this.var_1469 = const_1467;
               }
               break;
            case const_1063:
               this.setQuestImageVisible(false);
               this.hidePromptFrames();
               this.var_1188 -= param1;
               this.getPromptFrame(const_323[this.var_973]).visible = true;
               if(this.var_1188 < 0)
               {
                  this.var_1188 = const_1064;
                  ++this.var_973;
                  if(this.var_973 >= const_323.length)
                  {
                     this.var_973 = 0;
                     --this.var_1468;
                     if(this.var_1468 < 1)
                     {
                        this.setupPrompt(const_1065,const_691,true);
                        this.var_239 = const_322;
                     }
                  }
               }
               break;
            case const_1061:
               if(this.var_974 >= -1)
               {
                  this._window.x = this.getDefaultLocationX();
                  this.var_239 = const_322;
                  this.setupPrompt(const_1065,const_691,false);
               }
               else
               {
                  this._window.x = this.getDefaultLocationX() + const_1062[this.var_974];
                  ++this.var_974;
               }
               break;
            case const_1058:
               this.var_1469 -= param1;
               if(this.var_1469 < 0)
               {
                  this.var_239 = const_322;
                  this.setWindowVisible(false);
               }
               break;
            case const_322:
               if(this.var_781 != const_688)
               {
                  this.var_781 -= param1;
                  if(this.var_781 < 0)
                  {
                     this.var_781 = const_688;
                     if(this.var_212 != null && this.var_50.isQuestWithPrompts(this.var_212))
                     {
                        if(this.var_2332)
                        {
                           this.startNudge();
                        }
                        else
                        {
                           this.var_239 = const_1063;
                           this.var_973 = 0;
                           this.var_1188 = const_1064;
                        }
                     }
                  }
               }
         }
      }
      
      private function getDefaultLocationX() : int
      {
         return 0;
      }
      
      private function getOutScreenLocationX() : int
      {
         return this._window.width + const_1466;
      }
      
      public function isVisible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      private function onStartQuestTimer(param1:TimerEvent) : void
      {
         if(this.hasBlockingWindow())
         {
            Logger.log("Quest start blocked. Waiting some more");
            this.var_531.reset();
            this.var_531.start();
         }
         else
         {
            this.var_50.questController.questDetails.openForNextQuest = this.var_50.configuration.getKey("questing.showDetailsForNextQuest") == "true";
            this.var_50.send(new StartCampaignMessageComposer(this.getDefaultCampaign(),this.var_50.configuration.getBoolean("questing.useWing",false)));
         }
      }
      
      private function getDefaultCampaign() : String
      {
         var _loc1_:String = this.var_50.configuration.getKey("questing.defaultCampaign");
         return _loc1_ == null ? "" : _loc1_;
      }
      
      private function hasBlockingWindow() : Boolean
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ <= 2)
         {
            _loc2_ = this.var_50.windowManager.getDesktop(_loc1_);
            if(_loc2_ != null && this.hasBlockingWindowInLayer(_loc2_))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      private function hasBlockingWindowInLayer(param1:IWindowContainer) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_);
            if(_loc3_ != null && _loc3_.visible)
            {
               if(_loc3_ as IFrameWindow != null)
               {
                  if(_loc3_.name != "mod_start_panel")
                  {
                     return true;
                  }
               }
               else if(_loc3_.name == "welcome_screen")
               {
                  return true;
               }
            }
            _loc2_++;
         }
         return false;
      }
      
      private function setQuestImageVisible(param1:Boolean) : void
      {
         this._window.findChildByName("quest_pic_bitmap").visible = param1;
      }
      
      private function clearPrompt() : void
      {
         this.setupPrompt(const_688,0,false);
      }
      
      private function setupPrompt(param1:int, param2:int, param3:Boolean) : void
      {
         this.setQuestImageVisible(true);
         this.hidePromptFrames();
         this.var_781 = param1;
         this.var_1468 = param2;
         this.var_2332 = param3;
      }
      
      private function startNudge() : void
      {
         this.var_974 = 0;
         this.var_239 = const_1061;
      }
      
      private function setWindowVisible(param1:Boolean) : void
      {
         this._window.visible = param1;
         if(!param1)
         {
            this.var_50.toolbar.extensionView.detachExtension(const_687);
         }
         else
         {
            this.var_50.toolbar.extensionView.attachExtension(const_687,this._window);
         }
      }
   }
}
