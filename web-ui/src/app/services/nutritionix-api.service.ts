import { APP_ID, Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { map, Observable } from 'rxjs';

const Nutritionix_API = {
  BASE_URL: 'https://trackapi.nutritionix.com/v2/',
  SEARCH: 'search/instant',
  NUTRIENTS: 'natural/nutrients',
  APP_ID: '8bc7063e',
  APP_KEY: '4df8901567a5fcef1d5d623545451032',
};

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'x-app-id': Nutritionix_API.APP_ID,
    'x-app-key': Nutritionix_API.APP_KEY,
  }),
};

@Injectable({
  providedIn: 'root',
})
export class NutritionixApiService {
  constructor(private http: HttpClient) {}

  search(query: string): Observable<any> {
    return this.http
      .get(
        Nutritionix_API.BASE_URL + Nutritionix_API.SEARCH + `?query=${query}`,
        httpOptions
      )
      .pipe(map((res: any) => res.common.map((p: any) => p.food_name)));
  }

  fetchNutrients(query: string): Observable<any> {
    return this.http
      .post(
        Nutritionix_API.BASE_URL + Nutritionix_API.NUTRIENTS,
        { query },
        httpOptions
      )
      .pipe(
        map((res: any) =>
          res.foods != undefined && res.foods.length > 0
            ? res.foods[0]
            : res
        )
      );
  }
}
