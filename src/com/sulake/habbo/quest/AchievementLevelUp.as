package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.AchievementLevelUpData;
   import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.GetAchievementShareIdComposer;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   
   public class AchievementLevelUp implements IDisposable
   {
      
      private static const const_1122:int = 2000;
      
      private static const const_1614:int = 500;
      
      private static const const_1615:int = 500;
      
      private static const const_2125:int = 300;
      
      private static const const_1617:int = 1400;
      
      private static const const_1618:Number = 1;
      
      private static const const_1616:int = 3;
      
      private static const const_1123:int = 0;
      
      private static const const_1121:int = 1;
      
      private static const const_714:int = 2;
      
      private static const const_1124:int = 3;
       
      
      private var _window:IFrameWindow;
      
      private var var_50:HabboQuestEngine;
      
      private var var_69:AchievementLevelUpData;
      
      private var var_832:Array;
      
      private var var_833:int;
      
      private var var_1987:int = 0;
      
      private var var_1988:int;
      
      private var var_563:int;
      
      private var var_1583:int;
      
      private var var_1584:int = 3;
      
      private var var_834:BitmapData;
      
      private var var_2693:Point;
      
      private var var_564:Array;
      
      private var var_1986:ColorMatrixFilter;
      
      private var var_719:Animation;
      
      public function AchievementLevelUp(param1:HabboQuestEngine)
      {
         this.var_832 = new Array();
         this.var_564 = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         this.var_1986 = new ColorMatrixFilter(this.var_564);
         super();
         this.var_50 = param1;
      }
      
      public function dispose() : void
      {
         this.var_50 = null;
         this.var_832 = null;
         this.var_69 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_719)
         {
            this.var_719.dispose();
            this.var_719 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._window == null;
      }
      
      public function onLevelUp(param1:AchievementLevelUpData) : void
      {
         this.var_832.push(param1);
         this.var_50.sessionDataManager.requestBadgeImage(param1.badgeCode);
         this.var_50.sessionDataManager.requestBadgeImage(this.var_50.localization.getPreviousLevelBadgeId(param1.badgeCode));
         if(this._window == null || !this._window.visible)
         {
            this.var_833 = const_1122;
         }
         this.prepare();
      }
      
      private function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
            if(this.var_832.length > 0)
            {
               this.var_833 = const_1614;
            }
         }
      }
      
      private function prepare() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IFrameWindow(this.var_50.getXmlWindow("AchievementLevelUp"));
         this._window.findChildByTag("close").procedure = this.onCloseLink;
         this._window.findChildByName("ok_button").procedure = this.onOkButton;
         this._window.findChildByName("share_button").procedure = this.onShareButton;
         new PendingImage(this.var_50,this._window.findChildByName("reward_icon"),"ach_receive_star");
         this._window.findChildByName("achievements_link_region").procedure = this.onAchievementsLink;
         this._window.findChildByName("close_link_region").procedure = this.onCloseLink;
         this.var_719 = this.var_50.getTwinkleAnimation(this._window);
         this._window.visible = false;
      }
      
      private function show() : void
      {
         this.prepare();
         this.registerParameter("achievements.levelup.title","category",this.var_50.getAchievementCategoryName(this.var_69.category));
         this.registerParameter("achievements.levelup.reward","amount","" + this.var_69.levelRewardPoints);
         this.registerParameter("achievements.levelup.reward","currency_name",this.var_50.getActivityPointName(this.var_69.levelRewardPointType));
         this.registerParameter("achievements.levelup.score","amount","" + this.var_69.points);
         this.registerParameter("achievements.levelup.sharedesc","amount","" + this.var_69.bonusPoints);
         this._window.findChildByName("achievement_name_txt").caption = "\'" + this.var_50.localization.getBadgeName(this.var_69.badgeCode) + "\'";
         var _loc1_:Boolean = this.isFacebookPostingEnabled();
         this._window.findChildByName("achievements_link_region").visible = !_loc1_;
         this._window.findChildByName("close_link_region").visible = _loc1_;
         this._window.findChildByName("ok_button").visible = !_loc1_;
         this._window.findChildByName("share_button").visible = _loc1_;
         this._window.findChildByName("facebook_info_txt").visible = _loc1_;
         this.doFacebookLogging();
         if(this.var_69.level > 1)
         {
            this.setFadeStatus(const_1121);
         }
         else
         {
            this.setFadeStatus(const_714,const_1617);
         }
         this.var_719.restart();
      }
      
      private function setFadeStatus(param1:int, param2:int = 300) : void
      {
         this.var_834 = null;
         this.var_1987 = param1;
         this.var_563 = param2;
         this.var_1988 = param2;
         this.var_1583 = const_1615;
      }
      
      private function isFacebookPostingEnabled() : Boolean
      {
         return this.var_69.bonusPoints > 0 && this.isPostingEnabled() && this.var_50.configuration.keyExists("facebook.user");
      }
      
      private function isPostingEnabled() : Boolean
      {
         return this.var_50.configuration.getKey("achievement.post.enabled","1") != "0";
      }
      
      private function doFacebookLogging() : void
      {
         var _loc1_:Boolean = this.var_50.configuration.keyExists("facebook.user");
         var _loc2_:String = this.var_69.badgeCode;
         if(this.var_69.bonusPoints <= 0 || !this.isPostingEnabled())
         {
            this.var_50.send(new EventLogMessageComposer("Achievements",_loc2_,"client.show.no_post"));
         }
         else if(_loc1_)
         {
            this.var_50.send(new EventLogMessageComposer("Achievements",_loc2_,"client.show.post"));
         }
         else
         {
            this.var_50.send(new EventLogMessageComposer("Achievements",_loc2_,"client.show.no_fb"));
         }
      }
      
      private function onOkButton(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onCloseLink(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onAchievementsLink(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_50.achievementController.show();
            this.close();
         }
      }
      
      private function onShareButton(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_50.send(new GetAchievementShareIdComposer(this.var_69.achievementID));
            this.var_50.send(new EventLogMessageComposer("Achievements",this.var_69.badgeCode,"client.start_post"));
         }
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_833 > 0)
         {
            this.checkDialogOpen(param1);
            return;
         }
         if(this.var_719 != null)
         {
            this.var_719.update(param1);
         }
         if(this._window == null || this.var_1987 == const_1123)
         {
            return;
         }
         switch(this.var_1987)
         {
            case const_1121:
               this.var_1583 -= param1;
               this.animateBadgeImage(true);
               if(this.var_1583 < 0)
               {
                  this.setFadeStatus(const_1124);
               }
               break;
            case const_1124:
               this.var_563 -= param1;
               this.animateBadgeImage(true);
               if(this.var_563 < 0)
               {
                  this.setFadeStatus(const_714);
               }
               break;
            case const_714:
               this.var_563 -= param1;
               this.animateBadgeImage(false);
               if(this.var_563 < 0)
               {
                  this.setFadeStatus(const_1123);
               }
         }
      }
      
      private function checkDialogOpen(param1:uint) : void
      {
         this.var_833 -= param1;
         if(this.var_833 > 0)
         {
            return;
         }
         if(this.var_832.length < 1)
         {
            return;
         }
         var _loc2_:AchievementLevelUpData = this.var_832.pop();
         if(this.var_50.sessionDataManager.getBadgeImageWithInfo(_loc2_.badgeCode).placeHolder || this.var_50.sessionDataManager.getBadgeImageWithInfo(this.var_50.localization.getPreviousLevelBadgeId(_loc2_.badgeCode)).placeHolder)
         {
            if(this.var_1584 > 0)
            {
               this.var_832.push(_loc2_);
               this.var_833 = const_1122;
               --this.var_1584;
               return;
            }
            this.var_1584 = const_1616;
         }
         this.var_69 = _loc2_;
         this.show();
         this._window.center();
         this._window.visible = true;
         this._window.activate();
      }
      
      public function requestFacebookPostDialog(param1:String, param2:String) : void
      {
         if(this._window == null || this.var_69 == null || this.var_69.badgeCode != param1)
         {
            Logger.log("Invalid facebook post: " + param1 + ", " + (this.var_69 == null ? "current is null" : this.var_69.badgeCode));
            return;
         }
         var _loc3_:String = this.getFacebookText("notifications.text.achievement_facebook");
         var _loc4_:String = this.getFacebookText("notifications.text.achievement_facebook_title");
         HabboWebTools.facebookAchievementPost(this.var_69.badgeCode,_loc4_,_loc3_,param2);
         this.close();
      }
      
      private function getFacebookText(param1:String) : String
      {
         var _loc2_:String = this.var_50.sessionDataManager.userName;
         var _loc3_:String = this.var_50.sessionDataManager.realName;
         var _loc4_:String = this.var_50.localization.getAchievementNameForFacebook(this.var_69.badgeCode,_loc2_,_loc3_,this.var_69.level);
         var _loc5_:String = this.var_50.localization.getAchievementDescForFacebook(this.var_69.badgeCode,_loc2_,_loc3_,this.var_69.level);
         this.registerParameter(param1,"badge_name",this.var_50.localization.getBadgeName(this.var_69.badgeCode));
         this.registerParameter(param1,"badge_desc",this.var_50.localization.getBadgeDesc(this.var_69.badgeCode));
         this.registerParameter(param1,"badge_name_fb",_loc4_);
         this.registerParameter(param1,"badge_desc_fb",_loc5_);
         this.registerParameter(param1,"level",this.var_69.level.toString());
         this.registerParameter(param1,"name",_loc2_);
         this.registerParameter(param1,"realname",_loc3_);
         return this.var_50.localization.getKey(param1,param1);
      }
      
      private function registerParameter(param1:String, param2:String, param3:String) : void
      {
         this.var_50.localization.registerParameter(param1,param2,param3);
      }
      
      private function animateBadgeImage(param1:Boolean) : void
      {
         this.changeBadgeColorFilter(param1);
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("achievement_pic_bitmap"));
         if(_loc2_.bitmap == null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         }
         if(this.var_834 == null)
         {
            this.var_834 = !!param1 ? this.var_50.sessionDataManager.getBadgeImage(this.var_50.localization.getPreviousLevelBadgeId(this.var_69.badgeCode)) : this.var_50.sessionDataManager.getBadgeImage(this.var_69.badgeCode);
            this.var_2693 = new Point((_loc2_.width - this.var_834.width) / 2,(_loc2_.height - this.var_834.height) / 2);
         }
         _loc2_.bitmap.fillRect(_loc2_.bitmap.rect,0);
         _loc2_.bitmap.applyFilter(this.var_834,this.var_834.rect,this.var_2693,this.var_1986);
         _loc2_.invalidate(_loc2_.rectangle);
      }
      
      private function changeBadgeColorFilter(param1:Boolean) : void
      {
         var _loc2_:int = Math.max(0,!param1 ? Number(this.var_563) : Number(this.var_1988 - this.var_563));
         var _loc3_:Number = _loc2_ / this.var_1988 * const_1618;
         this.var_564[3] = _loc3_;
         this.var_564[8] = _loc3_;
         this.var_564[13] = _loc3_;
         this.var_564[0] = 1 - _loc3_;
         this.var_564[6] = 1 - _loc3_;
         this.var_564[12] = 1 - _loc3_;
         this.var_1986.matrix = this.var_564;
      }
   }
}
