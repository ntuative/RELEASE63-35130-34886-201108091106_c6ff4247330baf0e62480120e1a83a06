package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.Direction;
   import com.sulake.core.window.enum.LinkTarget;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextFieldAutoSize;
   
   public class PropertyDefaults
   {
      
      public static const const_835:String = "antialias_type";
      
      public static const const_760:String = "auto_arrange_items";
      
      public static const const_1025:String = "auto_size";
      
      public static const const_901:String = "bitmap_asset_name";
      
      public static const const_987:String = "direction";
      
      public static const const_1361:String = "display_as_password";
      
      public static const const_1004:String = "editable";
      
      public static const const_990:String = "focus_capturer";
      
      public static const const_1407:String = "grid_fit_type";
      
      public static const const_881:String = "handle_bitmap_disposing";
      
      public static const const_786:String = "link_target";
      
      public static const const_421:String = "spacing";
      
      public static const const_254:String = "margin_left";
      
      public static const const_293:String = "margin_top";
      
      public static const const_282:String = "margin_right";
      
      public static const const_304:String = "margin_bottom";
      
      public static const const_788:String = "item_array";
      
      public static const const_818:String = "mouse_wheel_enabled";
      
      public static const const_814:String = "pointer_offset";
      
      public static const const_1011:String = "resize_on_item_update";
      
      public static const const_812:String = "scale_to_fit_items";
      
      public static const const_1026:String = "scroll_step_h";
      
      public static const const_797:String = "scroll_step_v";
      
      public static const const_858:String = "selectable";
      
      public static const const_451:String = "text_color";
      
      public static const const_436:String = "text_style";
      
      public static const const_885:String = "tool_tip_caption";
      
      public static const const_799:String = "tool_tip_delay";
      
      public static const const_2351:String = "test_id_key";
      
      public static const const_1909:String = AntiAliasType.NORMAL;
      
      public static const const_1348:Array = [AntiAliasType.NORMAL,AntiAliasType.ADVANCED];
      
      public static const const_827:Boolean = true;
      
      public static const const_1256:String = TextFieldAutoSize.NONE;
      
      public static const const_1257:Array = [TextFieldAutoSize.NONE,TextFieldAutoSize.LEFT,TextFieldAutoSize.CENTER,TextFieldAutoSize.RIGHT];
      
      public static const const_1287:String = null;
      
      public static const const_1979:String = Direction.DOWN;
      
      public static const const_1991:Array = [Direction.UP,Direction.DOWN,Direction.LEFT,Direction.RIGHT];
      
      public static const const_1336:Boolean = false;
      
      public static const const_1831:Boolean = true;
      
      public static const const_1224:Boolean = false;
      
      public static const const_1362:String = GridFitType.PIXEL;
      
      public static const const_1226:Array = [GridFitType.PIXEL,GridFitType.NONE,GridFitType.SUBPIXEL];
      
      public static const const_923:Boolean = true;
      
      public static const HTML_LINK_TARGET_VALUE:String = LinkTarget.const_30;
      
      public static const const_931:Array = [LinkTarget.const_30,LinkTarget.name_3,LinkTarget.const_1844,LinkTarget.const_1839,LinkTarget.const_1851,LinkTarget.const_1193];
      
      public static const const_644:int = 0;
      
      public static const const_963:int = 0;
      
      public static const const_975:int = 0;
      
      public static const const_980:int = 0;
      
      public static const const_891:int = 0;
      
      public static const const_1867:Array = [];
      
      public static const const_1235:Boolean = true;
      
      public static const const_1793:int = 0;
      
      public static const const_805:Boolean = false;
      
      public static const const_750:Boolean = false;
      
      public static const const_1191:Number = -1;
      
      public static const const_1422:Number = -1;
      
      public static const const_1296:Boolean = true;
      
      public static const const_1013:uint = 0;
      
      public static const const_2029:String = TextStyleManager.const_234;
      
      public static const const_871:Array = TextStyleManager.getStyleNameArrayRef();
      
      public static const const_420:String = "";
      
      public static const const_843:int = 500;
      
      public static const const_2350:PropertyStruct = new PropertyStruct(const_835,const_1909,PropertyStruct.const_52,false,const_1348);
      
      public static const const_1908:PropertyStruct = new PropertyStruct(const_760,const_827,PropertyStruct.const_37,false);
      
      public static const const_1833:PropertyStruct = new PropertyStruct(const_1025,const_1256,PropertyStruct.const_52,false,const_1257);
      
      public static const const_1886:PropertyStruct = new PropertyStruct(const_901,const_1287,PropertyStruct.const_52,false);
      
      public static const const_1958:PropertyStruct = new PropertyStruct(const_987,const_1979,PropertyStruct.const_52,false,const_1991);
      
      public static const const_1926:PropertyStruct = new PropertyStruct(const_1361,const_1336,PropertyStruct.const_37,false);
      
      public static const const_1863:PropertyStruct = new PropertyStruct(const_1004,const_1831,PropertyStruct.const_37,false);
      
      public static const const_1804:PropertyStruct = new PropertyStruct(const_990,const_1224,PropertyStruct.const_37,false);
      
      public static const const_1930:PropertyStruct = new PropertyStruct(const_1407,const_1362,PropertyStruct.const_52,false,const_1226);
      
      public static const const_1806:PropertyStruct = new PropertyStruct(const_881,const_923,PropertyStruct.const_37,false);
      
      public static const const_1825:PropertyStruct = new PropertyStruct(const_786,HTML_LINK_TARGET_VALUE,PropertyStruct.const_52,false,const_931);
      
      public static const const_1266:PropertyStruct = new PropertyStruct(const_421,const_644,PropertyStruct.const_36,false);
      
      public static const const_1024:PropertyStruct = new PropertyStruct(const_254,const_963,PropertyStruct.const_36,false);
      
      public static const const_884:PropertyStruct = new PropertyStruct(const_293,const_975,PropertyStruct.const_36,false);
      
      public static const const_936:PropertyStruct = new PropertyStruct(const_282,const_980,PropertyStruct.const_36,false);
      
      public static const const_802:PropertyStruct = new PropertyStruct(const_304,const_891,PropertyStruct.const_36,false);
      
      public static const const_1785:PropertyStruct = new PropertyStruct(const_788,const_1867,PropertyStruct.const_167,false);
      
      public static const const_1961:PropertyStruct = new PropertyStruct(const_818,const_1235,PropertyStruct.const_37,false);
      
      public static const const_1918:PropertyStruct = new PropertyStruct(const_1011,const_805,PropertyStruct.const_37,false);
      
      public static const const_1960:PropertyStruct = new PropertyStruct(const_814,const_1793,PropertyStruct.const_36,false);
      
      public static const const_1801:PropertyStruct = new PropertyStruct(const_812,const_750,PropertyStruct.const_37,false);
      
      public static const const_2005:PropertyStruct = new PropertyStruct(const_1026,const_1191,PropertyStruct.const_140,false);
      
      public static const const_2063:PropertyStruct = new PropertyStruct(const_797,const_1422,PropertyStruct.const_140,false);
      
      public static const const_2046:PropertyStruct = new PropertyStruct(const_858,const_1296,PropertyStruct.const_37,false);
      
      public static const const_1234:PropertyStruct = new PropertyStruct(const_451,const_1013,PropertyStruct.const_148,false);
      
      public static const const_1379:PropertyStruct = new PropertyStruct(const_436,const_2029,PropertyStruct.const_52,false,const_871);
      
      public static const const_1821:PropertyStruct = new PropertyStruct(const_885,const_420,PropertyStruct.const_52,false);
      
      public static const TOOL_TIP_DELAY:PropertyStruct = new PropertyStruct(const_799,const_843,PropertyStruct.const_311,false);
       
      
      public function PropertyDefaults()
      {
         super();
      }
   }
}
