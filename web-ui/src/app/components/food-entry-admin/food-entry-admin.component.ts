import { Component, OnInit } from '@angular/core';
import { FormGroupState, NgrxValueConverters } from 'ngrx-forms';
import FoodEntry from '../../_models/food-entry';
import { ConfirmationService, MessageService } from 'primeng/api';
import { NutritionixApiService } from '../../services/nutritionix-api.service';
import { MESSAGES, MESSAGE_SEVERITY } from '../../_config/config';
import { TokenStorageService } from '../../services/token-storage.service';
import { FoodEntryAdminFacade } from './_state/food-entry-admin.facade';
import IdName from 'src/app/_models/id-name';

@Component({
  selector: 'app-food-entry-admin',
  templateUrl: './food-entry-admin.component.html',
  styleUrls: ['./food-entry-admin.component.css'],
})
export class FoodEntryAdminComponent implements OnInit {
  dateValueConverter = NgrxValueConverters.dateToISOString;
  state: FoodEntryAdminFacade;
  foodEntryModel: FoodEntry;
  formState: FormGroupState<FoodEntry>;
  users: IdName[];
  selectedFoodEntryId = 0;
  foodName: string;
  results: string[];
  visibility = {
    foodDetailDialog: false,
  };
  userSelection: IdName;
  userSelectionAllowed = true;
  constructor(
    private facade: FoodEntryAdminFacade,
    private confirmationService: ConfirmationService,
    private messageService: MessageService,
    private nutritionixApi: NutritionixApiService,
    private tokenService: TokenStorageService
  ) {
    this.state = facade;
  }
  ngOnInit(): void {
    this.facade.users$.subscribe((p) => (this.users = p ?? []));
    this.state.formState$.subscribe((p) => (this.formState = p));

    this.facade.error$.subscribe((error) => {
      if (error == undefined || error == null) return;
      console.log('Error occured: ', error);
      this.messageService.add({
        severity: MESSAGE_SEVERITY.ERROR,
        summary: 'Server Error',
        detail: MESSAGES.SERVER_ERROR,
      });
    });
  }
  save() {
    let entry: FoodEntry = this.formState.value;
    if (entry == undefined || entry.name == undefined) {
      alert('Food Entry name is required field');
      return;
    }

    entry = {
      ...entry,
      userId: this.userSelection.id,
      userFullName: this.userSelection.name,
    };
    console.log('On save: ', entry);
    this.facade.saveChanges(entry);
    this.visibility.foodDetailDialog = false;
    this.messageService.add({
      severity: MESSAGE_SEVERITY.SUCCESS,
      summary: 'Record Saved',
      detail: 'Food entry saved successfully!',
    });
    this.facade.resetFormState();
  }
  userSelectionChange(event: any) {
    var res = this.users.filter((p) => p.id == event.value);
    var userFullName = '';
    if (res.length > 0) {
      userFullName = res[0].name;
    }
    this.userSelection = {
      id: event.value,
      name: userFullName,
    };
  }
  cancel() {
    this.userSelectionAllowed = true;
    this.visibility.foodDetailDialog = false;
  }
  delete(id: number) {
    this.confirmationService.confirm({
      message: MESSAGES.DELETE_CONFIRMATION,
      header: 'Delete Confirmation',
      icon: 'pi pi-info-circle',
      accept: () => {
        this.facade.deleteRecord(id);
        this.messageService.add({
          severity: MESSAGE_SEVERITY.INFO,
          summary: 'Confirmed',
          detail: 'Record deleted',
        });
      },
    });
  }
  addNew() {
    this.userSelectionAllowed = true;
    if (this.users.length > 0) this.userSelection = this.users[0];
    this.facade.setFormState({
      id: 0,
      name: '',
      unit: '',
      quantity: null,
      totalCalories: null,
      unitCalorieValue: null,
      foodTakenAt: null,
      userId: null,
    });
    this.visibility.foodDetailDialog = true;
  }
  edit(data: FoodEntry) {
    this.userSelectionAllowed = false;
    data = {
      ...data,
      foodTakenAt: this.convertUtcToLocalDate(data.foodTakenAt),
    };
    this.facade.setFormState(data);
    this.visibility.foodDetailDialog = true;
  }
  allowEdit(FoodEntry: FoodEntry) {
    return FoodEntry.id == 0 || FoodEntry.id == this.selectedFoodEntryId;
  }

  search(event: { query: string }) {
    this.nutritionixApi.search(event.query).subscribe((data) => {
      this.results = data;
    });
  }

  foodSelected(value: string) {
    this.nutritionixApi.fetchNutrients(value).subscribe((data) => {
      const entry = {
        id: 0,
        name: value,
        quantity: 1,
        unit: data.serving_unit,
        totalCalories: data.nf_calories,
        unitCalorieValue: data.nf_calories,
        foodTakenAt: null,
        userId: null,
      };
      this.facade.setFormState(entry);
    });
  }
  toggleDialog() {
    this.visibility.foodDetailDialog = false;
  }

  convertUtcToLocalDate(utcDate: string | null) {
    if (utcDate == undefined || utcDate == null) return null;
    var dt = new Date(utcDate.replace('T', ' ') + ' UTC');
    return dt.toLocaleDateString() + ' ' + dt.toLocaleTimeString();
  }

  isValidEntryByDate(entry: FoodEntry, fromDate: Date, toDate: Date) {
    if (entry.foodTakenAt == null) return false;
    var dt = new Date(entry.foodTakenAt.replace('T', ' ') + ' UTC');
    return dt >= fromDate && dt <= toDate;
  }

  isTodayEntry(entry: FoodEntry) {
    var fromDate = new Date(new Date().toDateString());
    var toDate = new Date();
    if (entry.foodTakenAt == null) return false;
    var dt = new Date(entry.foodTakenAt.replace('T', ' ') + ' UTC');
    return dt >= fromDate && dt <= toDate;
  }
}
