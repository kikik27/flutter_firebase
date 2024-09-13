class SharedPrefKeys {
  static const loggedInKey = "logged_in_key";
  static const tokenKey = "token_key";
  static const profileKey = "profile_key";
  static const assetClassOptionKey = "asset_class_option_key";
  static const brandOptionKey = "brand_option_key";
  static const companyOptionKey = "company_option_key";
  static const categoryOptionKey = "category_option_key";
  static const subCategoryOptionKey = "subcategory_option_key";
  static const checkingResultOptionKey = "checking_result_option_key";
  static const costCenterOptionKey = "cost_center_option_key";
  static const locationOptionKey = "location_option_key";
  static const activeBuildingKey = "active_building_key";
  static const locationIsChangeKey = "location_is_change_key";
  static const activeInventory = "active_inventory_key";
  static const assetUsersKey = "asset_user_key";
}

class ApiEndPoints {
  //Auth
  static const loginApiUrl = "auth/login/";
  static const verifyOTPApiUrl = "auth/verify_otp/";
  static const resendOTPApiUrl = "auth/resend_otp/";

  //master data
  static const listUnitAssetUrl = "api/v1/assets/master_data/";
  static const buildingLocationApiUrl = "api/v1/master/building/";
  static const citiesApiUrl = "api/v1/master/city-option/";
  static const costCenterOptionUrl = "api/v1/master/costcenter-option/";
  static const costLocationOptionUrl = "api/v1/master/location/";
  static const roleOptionUrl = "api/v1/admin/role-option/";

  //Inventaris
  static const listInventarisApiUrl = "api/v1/mobile/inventaris/list/";
  static const createInventarisApiUrl = "api/v1/mobile/inventaris/create/";
  static const extendInventarisApiUrl = "api/v1/mobile/inventaris/extend/";
  static const detailInventarisApiUrl = "api/v1/mobile/inventaris/detail";
  static const listAssetInventarisApiUrl =
      "api/v1/mobile/inventaris/base/asset";
  static const listSyncedAssetInventarisApiUrl =
      "api/v1/mobile/inventaris/list/dup-asset";
  static const listAssetInventarisUpdateApiUrl =
      "api/v1/mobile/inventaris/update/asset/";
  static const submitInventarisApiUrl = "api/v1/mobile/inventaris/submit/";

  //Asset
  static const addAssetApiUrl = "api/v1/mobile/inventaris/add/un-asset/";
  static const getDupAssetInv = "/api/v1/mobile/inventaris/list/dup-asset-inv";
  static const checkAssetApiUrl =
      "api/v1/mobile/inventaris/check/asset-location";
  static const deleteAssetApiUrl = "api/v1/mobile/inventaris/delete/un-asset/";

  //Dropdown Options
  static const assetClassOptionsUrl =
      "api/v1/mobile/inventaris/asset-class-option/";
  static const brandOptionsUrl = "api/v1/mobile/inventaris/brand-option/";
  static const companyOptionsUrl = "api/v1/mobile/inventaris/company-option/";
  static const categoryOptionsUrl = "api/v1/mobile/inventaris/category-option/";
  static const subCategoryOptionsUrl =
      "api/v1/mobile/inventaris/subcategory-option/";
  static const checkingResultOptionsUrl =
      "api/v1/mobile/inventaris/checking-result-option/";

  //Profile
  static const userProfileApiUrl = "user/self/profile/";
  static const userUploadAvatarApiUrl = "user/upload_avatar/";
  static const assetUsersApiUrl = "user/lists/";

  //update
  static const updateVersionApiUrl = "api/v1/mobile/inventaris/version/";
}
