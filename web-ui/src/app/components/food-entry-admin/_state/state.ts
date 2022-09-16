import { createEntityAdapter, EntityAdapter, EntityState } from '@ngrx/entity';
import { FormGroupState } from 'ngrx-forms';
import FoodEntry from 'src/app/_models/food-entry';
import ReportSummary from '../../../_models/report-summary';
import IdName from '../../../_models/id-name';

export type FoodEntryState = IFoodEntryState<FoodEntry>


export const foodEntryAdapter: EntityAdapter<FoodEntry> =
  createEntityAdapter<FoodEntry>();


  // Extending Entity state with custom attributes

interface IFoodEntryState<T> extends EntityState<T> {
  formState : FormGroupState<T>,
  error?: any;
  users?: IdName[];
  reportSummary?: ReportSummary;
  isAdmin?: boolean
}
