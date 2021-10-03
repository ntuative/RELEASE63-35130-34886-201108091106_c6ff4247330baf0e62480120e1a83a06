package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2310:int;
      
      private var var_1552:String;
      
      private var var_2884:int;
      
      private var var_2886:int;
      
      private var _category:int;
      
      private var var_2277:String;
      
      private var var_2132:int;
      
      private var var_2887:int;
      
      private var var_2883:int;
      
      private var var_2888:int;
      
      private var var_2885:int;
      
      private var var_2882:Boolean;
      
      private var var_3155:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2310 = param1;
         this.var_1552 = param2;
         this.var_2884 = param3;
         this.var_2886 = param4;
         this._category = param5;
         this.var_2277 = param6;
         this.var_2132 = param7;
         this.var_2887 = param8;
         this.var_2883 = param9;
         this.var_2888 = param10;
         this.var_2885 = param11;
         this.var_2882 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2310;
      }
      
      public function get itemType() : String
      {
         return this.var_1552;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2884;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2886;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2277;
      }
      
      public function get extra() : int
      {
         return this.var_2132;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2887;
      }
      
      public function get creationDay() : int
      {
         return this.var_2883;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2888;
      }
      
      public function get creationYear() : int
      {
         return this.var_2885;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2882;
      }
      
      public function get songID() : int
      {
         return this.var_2132;
      }
   }
}
