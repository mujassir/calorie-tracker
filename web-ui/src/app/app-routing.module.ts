import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { RegisterComponent } from './components/register/register.component';
import { LoginComponent } from './components/login/login.component';
import { ProfileComponent } from './components/profile/profile.component';
import { AuthGuard } from './auth.guard';
import { UnauthorizedComponent } from './components/unauthorized/unauthorized.component';

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'invite-friend', component: RegisterComponent },
  { path: 'unauthorized', component: UnauthorizedComponent },
  { path: 'profile', component: ProfileComponent, canActivate: [AuthGuard] },
  {
    path: 'food-entry',
    loadChildren: () =>
      import('./components/food-entry/food-entry.module').then((m) => m.FoodEntryModule),
    canActivate: [AuthGuard],
  },
  {
    path: 'food-entry-admin',
    loadChildren: () =>
      import('./components/food-entry-admin/food-entry-admin.module').then((m) => m.FoodEntryAdminModule),
    canActivate: [AuthGuard],
  },
  {
    path: 'report-summary',
    loadChildren: () =>
      import('./components/food-entry-admin/food-entry-admin.module').then((m) => m.FoodEntryAdminModule),
    canActivate: [AuthGuard],
  },

  { path: '', redirectTo: 'food-entry', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
