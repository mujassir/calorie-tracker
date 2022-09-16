import { Injectable } from '@angular/core';
import { select, Store } from '@ngrx/store';
import FoodEntry from '../../../_models/food-entry';
import { TokenStorageService } from '../../../services/token-storage.service';
import * as EntityActions from './actions';
import * as EntitySelectors from './selectors';
import { map } from 'rxjs';

@Injectable()
export class FoodEntryAdminFacade {
  records$ = this.store.pipe(
    select(EntitySelectors.getAllRecords),
    map((results) => results.sort((a, b) => this.sortCompare(a, b)))
  );
  error$ = this.store.pipe(select(EntitySelectors.error));
  users$ = this.store.pipe(select(EntitySelectors.users));
  reportSummary$ = this.store.pipe(select(EntitySelectors.reportSummary));
  formState$ = this.store.pipe(select(EntitySelectors.formState));

  constructor(
    private readonly store: Store,
    private tokenService: TokenStorageService
  ) {
    // initialize store

    this.store.dispatch(EntityActions.fetchAllUsers());
    this.store.dispatch(EntityActions.fetchReportSummary());
    this.store.dispatch(EntityActions.fetchAllUserRecords());
  }

  sortCompare(a: FoodEntry, b: FoodEntry): number {
    var aDate = new Date(a.foodTakenAt ?? 0).getTime();
    var bDate = new Date(b.foodTakenAt ?? 0).getTime();

    return bDate - aDate;
  }
  resetFormState() {
    this.store.dispatch(EntityActions.resetFormState());
  }

  setFormState(obj: FoodEntry) {
    this.store.dispatch(EntityActions.setFormState({ data: obj }));
  }

  fetchRecordById(id: number) {
    this.store.dispatch(EntityActions.fetchRecordById({ id: id }));
  }

  cancelNew() {
    this.store.dispatch(
      EntityActions.deleteRecord({
        id: 0,
      })
    );
  }

  saveChanges(obj: FoodEntry) {
    if (obj.id == undefined || obj.id == 0) {
      this.store.dispatch(EntityActions.saveNew({ data: obj }));
    } else {
      this.store.dispatch(
        EntityActions.updateOnApi({
          updatedData: { id: obj.id, changes: obj },
        })
      );
    }
  }

  deleteRecord(id: number) {
    this.store.dispatch(EntityActions.deleteFromApi({ id: id }));
  }
}
