import { Component, OnInit } from '@angular/core';
import { FormGroupState, NgrxValueConverters } from 'ngrx-forms';
import FoodEntry from '../../_models/food-entry';
import { ConfirmationService, MessageService } from 'primeng/api';
import { NutritionixApiService } from '../../services/nutritionix-api.service';
import { MESSAGES, MESSAGE_SEVERITY } from '../../_config/config';
import { TokenStorageService } from 'src/app/services/token-storage.service';
import { FoodEntryFacade } from './_state/food-entry.facade';

@Component({
  selector: 'app-food-entry',
  templateUrl: './food-entry.component.html',
  styleUrls: ['./food-entry.component.css'],
})
export class FoodEntryComponent implements OnInit {
  dateValueConverter = NgrxValueConverters.dateToISOString;
  state: FoodEntryFacade;
  foodEntryModel: FoodEntry;
  formState: FormGroupState<FoodEntry>;
  selectedFoodEntryId = 0;
  foodName: string;
  results: string[];
  visibility = {
    foodDetailDialog: false,
  };
  todayCalories = 0;
  dailyCalorieLimit = 0;
  yetToConsume = 0;
  chartData: any;
  constructor(
    private facade: FoodEntryFacade,
    private confirmationService: ConfirmationService,
    private messageService: MessageService,
    private nutritionixApi: NutritionixApiService,
    private tokenService: TokenStorageService
  ) {
    this.state = facade;
  }
  ngOnInit(): void {
    this.state.formState$.subscribe((p) => (this.formState = p));

    this.facade.records$.subscribe((data) => {
      this.calculateTodayCalories(data);
    });

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
    const entry: FoodEntry = this.formState.value;
    if (entry == undefined || entry.name == undefined) {
      alert('Food Entry name is required field');
      return;
    }
    this.facade.saveChanges(entry);
    this.visibility.foodDetailDialog = false;
    this.messageService.add({
      severity: MESSAGE_SEVERITY.SUCCESS,
      summary: 'Record Saved',
      detail: 'Food entry saved successfully!',
    });
    this.facade.resetFormState();
  }
  cancel() {
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
        userId: null
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

  calculateTodayCalories(records: FoodEntry[]) {
    var fromDate = new Date(new Date().toDateString());
    var toDate = new Date();

    const todaysRecords = records.filter((p) =>
      this.isValidEntryByDate(p, fromDate, toDate)
    );
    this.todayCalories = 0;
    todaysRecords.forEach((entry) => {
      if (entry.totalCalories != null)
        this.todayCalories += entry.totalCalories;
    });
    this.dailyCalorieLimit = this.tokenService.dailyCalorieLimit();
    this.yetToConsume = this.dailyCalorieLimit - this.todayCalories;
if(this.yetToConsume < 0) this.yetToConsume  = 0;
    if (
      this.dailyCalorieLimit != undefined &&
      this.dailyCalorieLimit > 0 &&
      this.todayCalories > this.dailyCalorieLimit
    ) {
      const calorieWarningMessage = {
        severity: MESSAGE_SEVERITY.WARNING,
        summary: 'Limit Reached',
        detail: MESSAGES.CALORIE_LIMIT_WARNING,
      };
      this.messageService.add(calorieWarningMessage);
    }

    this.prepareChartData(this.todayCalories, this.yetToConsume);
  }

  prepareChartData(consumed: number, yetToConsume: number) {
    this.chartData = {
      labels: ['Consumed', 'Left'],
      datasets: [
        {
          data: [consumed, yetToConsume],
          backgroundColor: ['#42A5F5', '#66BB6A'],
          hoverBackgroundColor: ['#64B5F6', '#81C784'],
        },
      ],
    };
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
