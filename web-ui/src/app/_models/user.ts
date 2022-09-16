
export default class User {
  id?: string | null;
  username?: string;
  email?: string;
  fullName?: string;
  password?: string;
  isAdmin?:boolean;
  dailyCalorieLimit?: number;
}
