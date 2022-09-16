import { TestBed } from '@angular/core/testing';

import { NutritionixApiService } from './nutritionix-api.service';

describe('AuthService', () => {
  let service: NutritionixApiService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(NutritionixApiService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
