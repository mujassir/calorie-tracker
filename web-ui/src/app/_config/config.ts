export const API = {
  Auth: 'auth',
  FoodEntry: 'foodEntries',
  GetAllUsers:'GetAllUsers',
  GetAllUsersData:'GetAllUsersData',
  GetReportSummary: 'GetReportSummary',
};

export const StoreKey = {
  FoodEntry: 'FoodEntryStore',
  FoodEntryAdmin: 'FoodEntryAdminStore',
};

export const CONSTANTS = {
  PASSWORD_LENGTH: 20,
  DAILY_CALORIE_LIMIT: 2100
};


export const MESSAGES = {
  SERVER_ERROR: 'Server error occured, please contact your administrator',
  DELETE_CONFIRMATION:  'Do you want to delete this record?',
  CALORIE_LIMIT_WARNING: 'Warning! You have reached your daily calorie limit'
};

export const MESSAGE_SEVERITY = {
 ERROR: 'error',
 INFO: 'info',
 WARNING: 'warn',
 SUCCESS: 'success',
};
