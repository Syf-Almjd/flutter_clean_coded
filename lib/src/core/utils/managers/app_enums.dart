//FOR API Usage

enum PaymentStatus { refunded, cancelled, success, pending, failed }

//For App Logic Usage

enum AuthPages { landing, login, register }

enum NotificationsType { welcomeNotification }

enum AppLocale { english, chinese, italian }

enum AppButtonsType { allowHomeScrolling }

enum UserStatusType {
  newUser,
  existingUser,
  verifiedUser,
  unverifiedUser,
  inCompleteProfileUser,
}

enum FeedbackType { management, property, booking, payment, withdrawal, other }

enum PageViewType {
  homePage,
  feedbackPage,
  myBookingPage,
  myPropertyPage,
  newsPage,
  profilePage,
}
