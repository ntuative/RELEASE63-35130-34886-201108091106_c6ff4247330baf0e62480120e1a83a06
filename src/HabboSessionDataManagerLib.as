package
{
   import com.sulake.habbo.session.SessionDataManager;
   import com.sulake.iid.IIDSessionDataManager;
   import mx.core.SimpleApplication;
   
   public class HabboSessionDataManagerLib extends SimpleApplication
   {
      
      public static var manifest:Class = HabboSessionDataManagerLib_manifest;
      
      public static var SessionDataManager:Class = SessionDataManager;
      
      public static var IIDSessionDataManager:Class = IIDSessionDataManager;
      
      public static var loading_icon:Class = HabboSessionDataManagerLib_loading_icon;
      
      public static var make_favourite:Class = HabboSessionDataManagerLib_make_favourite;
      
      public static var clear_favourite:Class = HabboSessionDataManagerLib_clear_favourite;
      
      public static var group_info:Class = HabboSessionDataManagerLib_group_info;
      
      public static var group_entry:Class = HabboSessionDataManagerLib_group_entry;
       
      
      public function HabboSessionDataManagerLib()
      {
         super();
      }
   }
}
