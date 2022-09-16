import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
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
import { FoodEntryComponent } from './food-entry.component';
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
import {MessagesModule} from 'primeng/messages';
import {MessageModule} from 'primeng/message';
import { FoodEntryEffects } from './_state/effects';
import { FoodEntryFacade } from './_state/food-entry.facade';
import { CardModule } from 'primeng/card';
import { ChartModule } from 'primeng/chart';

@NgModule({
  declarations: [FoodEntryComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    NgrxFormsModule,
    HttpClientModule,
    RouterModule.forChild([
      { path: '', component: FoodEntryComponent },
      { path: '*', component: FoodEntryComponent },
    ]),
    StoreModule.forFeature(StoreKey.FoodEntry, foodEntryStore.reducer),
    EffectsModule.forRoot([FoodEntryEffects]),
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
    ChartModule
  ],
  providers: [
    authInterceptorProviders,
    TokenStorageService,
    FoodEntryFacade,
    ConfirmationService,
    MessageService,
    NutritionixApiService,
  ],
})
export class FoodEntryModule {}
