package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailRenderer;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   
   public class RoomPopupCtrl extends PopupCtrl
   {
       
      
      private var var_197:IWindowContainer;
      
      private var var_133:GuestRoomData;
      
      private var var_2590:RoomThumbnailRenderer;
      
      private var var_1120:TagRenderer;
      
      public function RoomPopupCtrl(param1:HabboNavigator, param2:int, param3:int)
      {
         super(param1,param2,param3,"grs_guest_room_details_long");
         this.var_2590 = new RoomThumbnailRenderer(param1);
         this.var_1120 = new TagRenderer(param1,hideInstantly);
      }
      
      public function set room(param1:GuestRoomData) : void
      {
         this.var_133 = param1;
      }
      
      override public function refreshContent(param1:IWindowContainer) : void
      {
         if(this.var_197 == null)
         {
            this.var_197 = IWindowContainer(param1.findChildByName("details_container"));
         }
         this.var_197.visible = true;
         Util.hideChildren(this.var_197);
         this.refreshRoomName(this.var_197,this.var_133);
         if(this.var_133.ownerName != "" && this.var_133.ownerName != "-")
         {
         }
         this.refreshOwnerName();
         this.refreshTextWithCaption("roomctg",this.var_197,!!this.var_133.event ? this.getEventCtg(this.var_133.categoryId) : this.getRoomCtg(this.var_133.categoryId));
         this.refreshRoomDesc(this.var_197,this.var_133);
         this.refreshExtraCont();
         this.refreshInfo(this.var_197,"trading_allowed",this.var_133.allowTrading);
         this.refreshInfo(this.var_197,"doormode_doorbell",this.var_133.doorMode == 1);
         this.refreshInfo(this.var_197,"doormode_password",this.var_133.doorMode == 2);
         Util.moveChildrenToColumn(this.var_197,["roomname","roomctg_cont","roomowner_cont","roomdesc","extra_cont","doormode_doorbell","doormode_password","trading_allowed"],0,0);
         this.var_197.height = Util.getLowestPoint(this.var_197);
      }
      
      private function refreshOwnerName() : void
      {
         this.refreshTextWithCaption("roomowner",this.var_197,this.var_133.ownerName);
         var _loc1_:ITextWindow = ITextWindow(this.var_197.findChildByName("roomowner"));
         if(this.var_133.ownerName != "" && this.var_133.ownerName != "-")
         {
            _loc1_.procedure = this.onOwnerName;
            _loc1_.setParamFlag(HabboWindowParam.const_45,true);
            _loc1_.underline = true;
         }
         else
         {
            _loc1_.procedure = null;
            _loc1_.setParamFlag(HabboWindowParam.const_45,false);
            _loc1_.underline = false;
         }
      }
      
      private function refreshExtraCont() : void
      {
         var _loc1_:IWindowContainer = IWindowContainer(this.var_197.findChildByName("extra_cont"));
         Util.hideChildren(_loc1_);
         this.var_1120.refreshTags(_loc1_,this.var_133.tags);
         this.refreshTextWithCaption("rating",_loc1_,"" + this.var_133.score);
         if(this.var_133.event)
         {
            this.refreshTextWithCaption("startedat",_loc1_,"" + this.var_133.eventCreationTime);
         }
         this.var_2590.refreshThumbnail(_loc1_,this.var_133.thumbnail,false);
         _loc1_.findChildByName("bitmap").visible = true;
         _loc1_.visible = true;
      }
      
      private function refreshRoomName(param1:IWindowContainer, param2:GuestRoomData) : void
      {
         var _loc3_:ITextWindow = ITextWindow(param1.getChildByName("roomname"));
         _loc3_.visible = true;
         _loc3_.text = param2.roomName;
         _loc3_.height = _loc3_.textHeight + 3;
      }
      
      private function refreshRoomDesc(param1:IWindowContainer, param2:GuestRoomData) : void
      {
         if(param2.description == "")
         {
            return;
         }
         var _loc4_:ITextWindow = ITextWindow(param1.getChildByName("roomdesc"));
         _loc4_.text = param2.description;
         _loc4_.height = _loc4_.textHeight + 10;
         _loc4_.y = Util.getLowestPoint(param1);
         _loc4_.visible = true;
      }
      
      private function refreshTextWithCaption(param1:String, param2:IWindowContainer, param3:String) : void
      {
         var _loc4_:IWindowContainer = IWindowContainer(param2.findChildByName(param1 + "_cont"));
         _loc4_.visible = true;
         var _loc5_:ITextWindow = ITextWindow(_loc4_.getChildByName(param1));
         var _loc6_:ITextWindow = ITextWindow(_loc4_.getChildByName(param1 + ".caption"));
         _loc5_.text = param3;
         Util.moveChildrenToRow(_loc4_,[param1 + ".caption",param1],_loc6_.x,0,2);
      }
      
      private function refreshInfo(param1:IWindowContainer, param2:String, param3:Boolean) : void
      {
         if(!param3)
         {
            return;
         }
         var _loc4_:IWindowContainer = IWindowContainer(param1.findChildByName(param2));
         _loc4_.visible = true;
         navigator.refreshButton(_loc4_,param2,true,null,0);
      }
      
      private function getEventCtg(param1:int) : String
      {
         var _loc2_:String = "roomevent_type_" + param1;
         var _loc3_:String = navigator.getText(_loc2_);
         return _loc3_ == null ? "" : _loc3_;
      }
      
      private function getRoomCtg(param1:int) : String
      {
         var _loc2_:* = null;
         for each(_loc2_ in navigator.data.allCategories)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_.nodeName;
            }
         }
         return "";
      }
      
      private function onOwnerName(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:ITextWindow = ITextWindow(param2);
         if(_loc3_ != null)
         {
            navigator.mainViewCtrl.startSearch(Tabs.const_271,Tabs.const_466,_loc3_.text);
            this.hideInstantly();
         }
      }
   }
}
