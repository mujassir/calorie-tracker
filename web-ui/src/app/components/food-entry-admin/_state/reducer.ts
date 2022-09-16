import { createReducer, on } from '@ngrx/store';
import { createFormGroupState, onNgrxForms } from 'ngrx-forms';
import { StoreKey } from '../../../_config/config';
import FoodEntry from '../../../_models/food-entry';
import * as EntityActions from './actions';
import { foodEntryAdapter, FoodEntryState } from './state';

const STORE_KEY = StoreKey.FoodEntryAdmin;

export const initialState: FoodEntryState = foodEntryAdapter.getInitialState({
  formState: createFormGroupState(STORE_KEY, <FoodEntry>{}),
});

export const reducer = createReducer(
  initialState,
  onNgrxForms(),
  on(EntityActions.resetFormState, (state, action) => {
    return {
      ...state,
      formState: createFormGroupState(STORE_KEY, <FoodEntry>{}),
    };
  }),
  on(EntityActions.setFormState, (state, action) => {
    return {
      ...state,
      formState: createFormGroupState(STORE_KEY, action.data),
    };
  }),
  on(EntityActions.storeRecords, (state, action) => {
    return {
      ...state,
      ...foodEntryAdapter.setAll(action.data, state),
    };
  }),
  on(EntityActions.storeAllUsers, (state, action) => {
    return {
      ...state,
      users: action.data
    };
  }),
  on(EntityActions.addNew, (state, action) => {
    return {
      ...state,
      ...foodEntryAdapter.addOne(action.data, state),
    };
  }),

  on(EntityActions.update, (state, action) => {
    return {
      ...state,
      ...foodEntryAdapter.updateOne(action.updatedData, state),
    };
  }),
  on(EntityActions.updateSuccess, (state, action) => {
    return {
      ...state,
      updateSuccess: true,
    };
  }),
  on(EntityActions.deleteRecord, (state, action) => {
    return {
      ...state,
      ...foodEntryAdapter.removeOne(action.id, state),
    };
  }),
  on(EntityActions.saveNewSuccess, (state, action) => {
    return {
      ...state,
      ...foodEntryAdapter.addOne(
        action.data,
        foodEntryAdapter.removeOne('0', state)
      ),
    };
  }),
  on(EntityActions.storeReportSummary, (state, action) => {
    return {
      ...state,
      reportSummary: action.data
    };
  }),
  on(EntityActions.onError, (state, action) => {
    return {
      ...state,
      error: action.error
    };
  }),

);
