import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import User from '../../_models/user';
import { NgxSpinnerService } from 'ngx-spinner';
import { CONSTANTS } from '../../_config/config';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
})
export class RegisterComponent implements OnInit {
  form: User = {
    id: null,
  };
  isSuccessful = false;
  isSignUpFailed = false;
  errorMessage = '';

  constructor(
    private authService: AuthService,
    private spinner: NgxSpinnerService
  ) {}

  ngOnInit(): void {}

  onSubmit(): void {
    this.spinner.show();
    this.form = { ...this.form,
      dailyCalorieLimit: CONSTANTS.DAILY_CALORIE_LIMIT,
      password: this.generatePassword(CONSTANTS.PASSWORD_LENGTH),
      username: this.form.email };
    this.authService.register(this.form).subscribe({
      next: (data: any) => {
        this.spinner.hide();
        console.log(data);
        this.isSuccessful = true;
        this.isSignUpFailed = false;
      },
      error: (err: { error: { message: string; errors: any[] } }) => {
        console.log('Error: ', err);
        var errorMessage = '';
        for (let index = 0; index < err.error.errors.length; index++) {
          const element = err.error.errors[index];
          errorMessage += element.description + '<br/>';
        }
        this.spinner.hide();
        this.errorMessage = errorMessage;
        this.isSignUpFailed = true;
      },
    });
  }

  generatePassword(length: number) {
    const wishlist =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~!@-#$';
    return Array.from(crypto.getRandomValues(new Uint32Array(length)))
      .map((x) => wishlist[x % wishlist.length])
      .join('');
  }
}
