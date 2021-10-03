package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.FigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class AvatarAssetDownloadManager extends EventDispatcher
   {
       
      
      private var var_1340:Dictionary;
      
      private var _assets:IAssetLibrary;
      
      private var var_1093:Dictionary;
      
      private var var_606:Dictionary;
      
      private var _structure:AvatarStructure;
      
      private var var_2834:String;
      
      private var var_1339:String;
      
      private var var_2100:Boolean;
      
      private var var_1092:int = 3;
      
      private var var_491:AssetLoaderStruct;
      
      private var var_1094:Timer;
      
      private var var_1341:Array;
      
      private var var_878:Array;
      
      private var var_877:Array;
      
      private const const_2410:int = 100;
      
      private const const_1869:int = 2;
      
      public function AvatarAssetDownloadManager(param1:IAssetLibrary, param2:String, param3:String, param4:AvatarStructure)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         super();
         this.var_1340 = new Dictionary();
         this._assets = param1;
         this._structure = param4;
         this.var_1093 = new Dictionary();
         this.var_2834 = param3;
         this.var_1339 = param2;
         this.var_606 = new Dictionary();
         this.var_1341 = [];
         this.var_878 = [];
         this.var_877 = [];
         var _loc5_:URLRequest = new URLRequest(param2);
         var _loc6_:IAsset = this._assets.getAssetByName("figuremap");
         if(_loc6_ == null)
         {
            this.var_491 = this._assets.loadAssetFromFile("figuremap",_loc5_,"text/xml");
            this.addMapLoaderEventListeners();
         }
         else
         {
            _loc7_ = this._assets.getAssetByName("figuremap") as XmlAsset;
            _loc8_ = (_loc7_.content as XML).copy();
            this.loadFigureMapData(_loc8_);
         }
         this.var_1094 = new Timer(this.const_2410,1);
         this.var_1094.addEventListener(TimerEvent.TIMER_COMPLETE,this.onNextDownloadTimeout);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_1340 = null;
         this._assets = null;
         this.var_1093 = null;
         this.var_606 = null;
         this._structure = null;
         this.var_878 = null;
         this.var_1341 = null;
         if(this.var_1094)
         {
            this.var_1094.stop();
            this.var_1094 = null;
         }
         if(this.var_491)
         {
            this.removeMapLoaderEventListeners();
            this.var_491 = null;
         }
      }
      
      private function addMapLoaderEventListeners() : void
      {
         if(this.var_491)
         {
            this.var_491.addEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,this.onConfigurationComplete);
            this.var_491.addEventListener(AssetLoaderEvent.const_41,this.onConfigurationError);
         }
      }
      
      private function removeMapLoaderEventListeners() : void
      {
         if(this.var_491)
         {
            this.var_491.removeEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,this.onConfigurationComplete);
            this.var_491.removeEventListener(AssetLoaderEvent.const_41,this.onConfigurationError);
         }
      }
      
      private function onConfigurationError(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         --this.var_1092;
         if(this.var_1092 <= 0)
         {
            HabboWebTools.logEventLog("Figuremap download error " + this.var_1339);
            Logger.log("AVATAR ASSET ERROR: Could not download figuremap.xml.");
         }
         else
         {
            Logger.log("Could not download figuremap.xml. Retries left: " + this.var_1092);
            if(this.var_1339.indexOf("?") > 0)
            {
               _loc2_ = this.var_1339 + "&retry=" + this.var_1092;
            }
            else
            {
               _loc2_ = this.var_1339 + "?retry=" + this.var_1092;
            }
            this.removeMapLoaderEventListeners();
            _loc3_ = new URLRequest(_loc2_);
            this.var_491 = this._assets.loadAssetFromFile("figuremap",_loc3_,"text/xml");
            this.addMapLoaderEventListeners();
         }
      }
      
      private function onConfigurationComplete(param1:Event) : void
      {
         var data:XML = null;
         var event:Event = param1;
         var loaderStruct:AssetLoaderStruct = event.target as AssetLoaderStruct;
         if(loaderStruct == null)
         {
            return;
         }
         try
         {
            data = new XML(loaderStruct.assetLoader.content as String);
         }
         catch(e:Error)
         {
            Logger.log("[AvatarAssetDownloadManager] Error: " + e.message);
            return;
         }
         this.loadFigureMapData(data);
      }
      
      private function loadFigureMapData(param1:XML) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            Logger.log("[AvatarAssetDownloadManager] XML error: " + param1 + " not valid XML");
            return;
         }
         if(param1.toString() == "")
         {
            Logger.log("[AvatarAssetDownloadManager] XML error: " + param1 + " is EMPTY!");
            return;
         }
         this.generateMap(param1);
         this.var_2100 = true;
         for each(_loc2_ in this.var_1341)
         {
            this.loadFigureSetData(_loc2_[0],_loc2_[1]);
         }
         this.var_1341 = [];
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function generateMap(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         for each(_loc2_ in param1.lib)
         {
            _loc3_ = new AvatarAssetDownloadLibrary(_loc2_.@id,_loc2_.@revision,this.var_2834,this._assets);
            _loc3_.addEventListener(Event.COMPLETE,this.libraryComplete);
            for each(_loc4_ in _loc2_.part)
            {
               _loc5_ = _loc4_.@type + ":" + _loc4_.@id;
               _loc6_ = this.var_1340[_loc5_];
               if(_loc6_ == null)
               {
                  _loc6_ = [];
               }
               _loc6_.push(_loc3_);
               this.var_1340[_loc5_] = _loc6_;
            }
         }
      }
      
      public function isReady(param1:IAvatarFigureContainer) : Boolean
      {
         if(!this.var_2100)
         {
            return false;
         }
         var _loc2_:Array = this.getLibsToDownload(param1);
         return _loc2_.length == 0;
      }
      
      public function loadFigureSetData(param1:IAvatarFigureContainer, param2:IAvatarImageListener) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(!this.var_2100)
         {
            this.var_1341.push([param1,param2]);
            return;
         }
         var _loc3_:String = param1.getFigureString();
         var _loc4_:Array = this.getLibsToDownload(param1);
         if(_loc4_.length > 0)
         {
            if(param2 && !param2.disposed)
            {
               _loc6_ = this.var_606[_loc3_];
               if(_loc6_ == null)
               {
                  _loc6_ = [];
               }
               _loc6_.push(param2);
               this.var_606[_loc3_] = _loc6_;
            }
            this.var_1093[_loc3_] = _loc4_;
            for each(_loc5_ in _loc4_)
            {
               this.addToQueue(_loc5_);
            }
         }
         else if(param2 != null && !param2.disposed)
         {
            param2.avatarImageReady(_loc3_);
         }
      }
      
      private function libraryComplete(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc2_:* = [];
         for(_loc3_ in this.var_1093)
         {
            _loc7_ = true;
            _loc4_ = this.var_1093[_loc3_];
            for each(_loc8_ in _loc4_)
            {
               if(!_loc8_.isReady)
               {
                  _loc7_ = false;
                  break;
               }
            }
            if(_loc7_)
            {
               _loc2_.push(_loc3_);
               _loc9_ = this.var_606[_loc3_];
               for each(_loc10_ in _loc9_)
               {
                  if(_loc10_ != null && !_loc10_.disposed)
                  {
                     _loc10_.avatarImageReady(_loc3_);
                  }
               }
               delete this.var_606[_loc3_];
            }
         }
         for each(_loc3_ in _loc2_)
         {
            delete this.var_1093[_loc3_];
         }
         while(_loc6_ < this.var_877.length)
         {
            _loc5_ = this.var_877[_loc6_];
            if(_loc5_.libraryName == (param1.target as AvatarAssetDownloadLibrary).libraryName)
            {
               this.var_877.splice(_loc6_,1);
            }
            _loc6_++;
         }
         this.var_1094.start();
      }
      
      private function getLibsToDownload(param1:IAvatarFigureContainer) : Array
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc2_:* = [];
         if(!this._structure)
         {
            return _loc2_;
         }
         if(!param1)
         {
            return _loc2_;
         }
         var _loc3_:IFigureData = this._structure.figureData;
         if(!_loc3_)
         {
            return _loc2_;
         }
         var _loc4_:Array = param1.getPartTypeIds();
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc3_.getSetType(_loc5_);
            if(_loc6_)
            {
               _loc7_ = param1.getPartSetId(_loc5_);
               _loc8_ = _loc6_.getPartSet(_loc7_);
               if(_loc8_)
               {
                  for each(_loc9_ in _loc8_.parts)
                  {
                     _loc10_ = _loc9_.type + ":" + _loc9_.id;
                     _loc11_ = this.var_1340[_loc10_];
                     if(_loc11_ != null)
                     {
                        for each(_loc12_ in _loc11_)
                        {
                           if(_loc12_ != null)
                           {
                              if(!_loc12_.isReady)
                              {
                                 if(_loc2_.indexOf(_loc12_) == -1)
                                 {
                                    _loc2_.push(_loc12_);
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         return _loc2_;
      }
      
      private function processPending() : void
      {
         var _loc1_:* = null;
         while(this.var_878.length > 0 && this.var_877.length < this.const_1869)
         {
            _loc1_ = this.var_878[0];
            _loc1_.startDownloading();
            this.var_877.push(this.var_878.shift());
         }
      }
      
      private function addToQueue(param1:AvatarAssetDownloadLibrary) : void
      {
         if(!param1.isReady && this.var_878.indexOf(param1) == -1 && this.var_877.indexOf(param1) == -1)
         {
            this.var_878.push(param1);
            this.processPending();
         }
      }
      
      private function onNextDownloadTimeout(param1:Event = null) : void
      {
         this.processPending();
      }
   }
}
