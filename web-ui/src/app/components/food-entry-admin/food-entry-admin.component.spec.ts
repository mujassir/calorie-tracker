import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FoodEntryAdminComponent } from './food-entry-admin.component';


describe('FoodEntryAdminComponent', () => {
  let component: FoodEntryAdminComponent;
  let fixture: ComponentFixture<FoodEntryAdminComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FoodEntryAdminComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FoodEntryAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
