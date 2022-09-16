import { createEntityAdapter, EntityAdapter, EntityState } from '@ngrx/entity';
import { FormGroupState } from 'ngrx-forms';
import FoodEntry from 'src/app/_models/food-entry';

export type FoodEntryState = IFoodEntryState<FoodEntry>


export const foodEntryAdapter: EntityAdapter<FoodEntry> =
  createEntityAdapter<FoodEntry>();


  // Extending Entity state with custom attributes

interface IFoodEntryState<T> extends EntityState<T> {
  formState : FormGroupState<T>,
  error?: any;
}
