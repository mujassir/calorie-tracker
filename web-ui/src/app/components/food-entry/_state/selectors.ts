import { createFeatureSelector, createSelector } from '@ngrx/store';
import { StoreKey } from '../../../_config/config';
import { foodEntryAdapter, FoodEntryState } from './state';

export const getState = createFeatureSelector<FoodEntryState>(
  StoreKey.FoodEntry
);

export const { selectIds, selectEntities, selectAll, selectTotal } =
  foodEntryAdapter.getSelectors();


export const getAllRecords = createSelector(getState, selectAll);

export const formState = createSelector(
  getState,
  (state: FoodEntryState) => state.formState
);


export const error = createSelector(
  getState,
  (state: FoodEntryState) => state.error
);

