import { Component, OnInit } from '@angular/core';
import { FormGroupState, NgrxValueConverters } from 'ngrx-forms';
import { MessageService } from 'primeng/api';
import { MESSAGES, MESSAGE_SEVERITY } from '../../../_config/config';
import { TokenStorageService } from '../../../services/token-storage.service';
import { FoodEntryAdminFacade } from '../_state/food-entry-admin.facade';
import FoodEntry from '../../../_models/food-entry';

@Component({
  selector: 'app-report-summary',
  templateUrl: './report-summary.component.html',
  styleUrls: ['./report-summary.component.css'],
})
export class ReportSummaryComponent implements OnInit {
  dateValueConverter = NgrxValueConverters.dateToISOString;
  state: FoodEntryAdminFacade;
  foodEntryModel: FoodEntry;
  formState: FormGroupState<FoodEntry>;
  selectedFoodEntryId = 0;
  foodName: string;
  results: string[];
  visibility = {
    foodDetailDialog: false,
  };
  chartData: any;
  constructor(
    private facade: FoodEntryAdminFacade,
    private messageService: MessageService,
    private tokenService: TokenStorageService
  ) {
    this.state = facade;
  }
  ngOnInit(): void {
    this.facade.reportSummary$.subscribe((data) => {
      console.log('ReportSummaryComponent ', data);
      var entriesLastWeek = data?.entriesLastWeek ?? 0;
      var entriesWeekBeforeLastWeek = data?.entriesWeekBeforeLastWeek ?? 0;
      this.chartData = {
        labels: [
          'Entries in Past Week',
          'Entries in Previous Week',
        ],
        datasets: [
          {
            data: [entriesLastWeek, entriesWeekBeforeLastWeek],
            backgroundColor: ['#42A5F5', '#66BB6A'],
            hoverBackgroundColor: ['#64B5F6', '#81C784'],
          }
        ]

      };
    });
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
}
