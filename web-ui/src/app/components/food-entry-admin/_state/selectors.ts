import { createFeatureSelector, createSelector } from '@ngrx/store';
import { StoreKey } from '../../../_config/config';
import { foodEntryAdapter, FoodEntryState } from './state';

export const getState = createFeatureSelector<FoodEntryState>(
  StoreKey.FoodEntryAdmin
);

export const { selectIds, selectEntities, selectAll, selectTotal } =
  foodEntryAdapter.getSelectors();


export const getAllRecords = createSelector(getState, selectAll);

export const formState = createSelector(
  getState,
  (state: FoodEntryState) => state.formState
);


export const reportSummary = createSelector(
  getState,
  (state: FoodEntryState) => state.reportSummary
);

export const users = createSelector(
  getState,
  (state: FoodEntryState) => state.users
);

export const error = createSelector(
  getState,
  (state: FoodEntryState) => state.error
);

