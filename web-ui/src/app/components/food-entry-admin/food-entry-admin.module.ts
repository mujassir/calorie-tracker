import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import * as foodEntryStore from './_state/reducer';
import { NgrxFormsModule } from 'ngrx-forms';
import { RouterModule } from '@angular/router';
import { StoreModule } from '@ngrx/store';
import { EffectsModule } from '@ngrx/effects';
import { StoreKey } from '../../_config/config';
import { CommonModule } from '@angular/common';
import { authInterceptorProviders } from '../../_helpers/auth.interceptor';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { ConfirmationService, MessageService } from 'primeng/api';
import { ToastModule } from 'primeng/toast';
import { AutoCompleteModule } from 'primeng/autocomplete';
import { NutritionixApiService } from 'src/app/services/nutritionix-api.service';
import { DialogModule } from 'primeng/dialog';
import { InputNumberModule } from 'primeng/inputnumber';
import { InputTextModule } from 'primeng/inputtext';
import { CalendarModule } from 'primeng/calendar';
import { TokenStorageService } from 'src/app/services/token-storage.service';
import { MessagesModule } from 'primeng/messages';
import { MessageModule } from 'primeng/message';
import { FoodEntryAdminComponent } from './food-entry-admin.component';
import { FoodEntryAdminEffects } from './_state/effects';
import { FoodEntryAdminFacade } from './_state/food-entry-admin.facade';
import { ReportSummaryComponent } from './report-summary/report-summary.component';
import { CardModule } from 'primeng/card';
import { ChartModule } from 'primeng/chart';
import {DropdownModule} from 'primeng/dropdown';
@NgModule({
  declarations: [FoodEntryAdminComponent, ReportSummaryComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    NgrxFormsModule,
    HttpClientModule,
    RouterModule.forChild([
      { path: '', component: FoodEntryAdminComponent },
      { path: 'report-summary', component: ReportSummaryComponent },
      { path: '*', component: FoodEntryAdminComponent },
    ]),
    StoreModule.forFeature(StoreKey.FoodEntryAdmin, foodEntryStore.reducer),
    EffectsModule.forRoot([FoodEntryAdminEffects]),
    // Prime NG
    AutoCompleteModule,
    ConfirmDialogModule,
    ToastModule,
    DialogModule,
    InputNumberModule,
    InputTextModule,
    CalendarModule,
    MessagesModule,
    MessageModule,
    CardModule,
    ChartModule,
    DropdownModule
  ],
  providers: [
    authInterceptorProviders,
    TokenStorageService,
    FoodEntryAdminFacade,
    ConfirmationService,
    MessageService,
    NutritionixApiService,
  ],
})
export class FoodEntryAdminModule {}
