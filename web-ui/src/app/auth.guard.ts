import { Injectable } from '@angular/core';
import {
  ActivatedRouteSnapshot,
  CanActivate,
  Router,
  RouterStateSnapshot,
  UrlTree,
} from '@angular/router';
import { Observable } from 'rxjs';
import { TokenStorageService } from './services/token-storage.service';

const PUBLIC_ROUTES = ['login', 'register'];
const ADMIN_ROUTES = ['food-entry-admin', 'report-summary'];

@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  constructor(
    private tokenService: TokenStorageService,
    private router: Router
  ) {}
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ):
    | Observable<boolean | UrlTree>
    | Promise<boolean | UrlTree>
    | boolean
    | UrlTree {
    console.log('Route info: ', route.routeConfig?.path);

    if (
      ADMIN_ROUTES.indexOf(route.routeConfig?.path + '') > -1 &&
      this.tokenService.isAdmin() !== true
    ) {
      this.router.navigate(['/unauthorized']);
      return false;
    }

    if (PUBLIC_ROUTES.indexOf(route.routeConfig?.path + '') > -1) {
      return true;
    } else {
      const isLoggedIn = !!this.tokenService.getToken();
      if (!isLoggedIn) this.router.navigate(['/login']);
      return isLoggedIn;
    }
  }
}
