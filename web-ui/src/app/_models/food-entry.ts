export default class FoodEntry {
  id: number;
  name: string;
  unit: string;
  quantity: number | null;
  unitCalorieValue: number | null;
  totalCalories: number | null;
  foodTakenAt: string | null;
  userId: string | null;
  userFullName?: string;
}
