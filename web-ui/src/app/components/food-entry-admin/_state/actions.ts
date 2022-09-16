import { createAction, props } from '@ngrx/store';
import { Update } from '@ngrx/entity';
import FoodEntry from '../../../_models/food-entry';
import ReportSummary from '../../../_models/report-summary';
import IdName from '../../../_models/id-name';

const ACTION_PREFIX = "[FoodEntryAmin/API] ";

export const fetchRecords = createAction(
  ACTION_PREFIX + 'fetchRecords'
);
export const storeRecords = createAction(
  ACTION_PREFIX +  'storeRecords',
  props<{ data: FoodEntry[] }>()
);

export const fetchAllUserRecords = createAction(
  ACTION_PREFIX + 'fetchAllUserRecords'
);

export const fetchReportSummary = createAction(
  ACTION_PREFIX + 'fetchReportSummary'
);
export const storeReportSummary = createAction(
  ACTION_PREFIX +  'storeReportSummary',
  props<{ data: ReportSummary }>()
);

export const fetchAllUsers = createAction(
  ACTION_PREFIX + 'fetchAllUsers'
);

export const storeAllUsers = createAction(
  ACTION_PREFIX + 'storeAllUsers',
  props<{ data: IdName[] }>()
);



export const fetchRecordById= createAction(
  ACTION_PREFIX + 'fetchRecordById',
  props<{ id: number }>()
);




export const resetFormState = createAction(
  ACTION_PREFIX + 'resetFormState'
);

export const setFormState = createAction(
  ACTION_PREFIX + 'setFormState',
  props<{ data: FoodEntry }>()
);

export const addNew = createAction(
  ACTION_PREFIX + 'addNew',
  props<{ data: FoodEntry }>()
);
export const saveNew = createAction(
  ACTION_PREFIX + 'saveNew',
  props<{ data: FoodEntry }>()
);

export const saveNewSuccess = createAction(
  ACTION_PREFIX + 'saveNewSuccess',
  props<{ data: FoodEntry }>()
);

export const update = createAction(
  ACTION_PREFIX + 'update',
  props<{ updatedData: Update<FoodEntry> }>()
);
export const updateOnApi = createAction(
  ACTION_PREFIX + 'updateOnApi',
  props<{ updatedData: Update<FoodEntry> }>()
);
export const updateSuccess = createAction(
  ACTION_PREFIX + 'updateSuccess'
);

export const deleteRecord = createAction(
  ACTION_PREFIX + 'deleteRecord',
  props<{ id: number }>()
);
export const deleteFromApi = createAction(
  ACTION_PREFIX + 'deleteFromApi',
  props<{ id: number }>()
);



export const onError = createAction(
  ACTION_PREFIX + 'onError',
  props<{error:any}>()
);

