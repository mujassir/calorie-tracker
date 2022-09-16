import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { AuthService } from '../../services/auth.service';
import { TokenStorageService } from '../../services/token-storage.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  form: any = {
    username: null,
    password: null,
  };
  isLoggedIn = false;
  isLoginFailed = false;
  errorMessage = '';
  roles: string[] = [];
  userFullName = "";
  constructor(
    private authService: AuthService,
    private tokenStorage: TokenStorageService,
    private router: Router,
    private spinner: NgxSpinnerService
  ) {}

  ngOnInit(): void {
    if (this.tokenStorage.getToken()) {
      this.isLoggedIn = true;
      this.router.navigate(['/food-entry']);

    }
  }

  onSubmit(): void {
    const { username, password } = this.form;

    this.spinner.show();
    this.authService.login(username, password).subscribe({
      next: (data) => {
        this.spinner.hide();
        this.tokenStorage.saveToken(data.accessToken);
        this.tokenStorage.saveUser(data.user);
        this.userFullName = data.user.fullName;
        this.isLoginFailed = false;
        this.isLoggedIn = true;
        this.roles = this.tokenStorage.getUser().roles;
        this.router.navigate(['/food-entry']);
      },
      error: (err) => {
        this.spinner.hide();
        this.errorMessage = "Username or password is incorrect"
        this.isLoginFailed = true;
      },
    });
  }

  reloadPage(): void {
    window.location.reload();
  }
}
