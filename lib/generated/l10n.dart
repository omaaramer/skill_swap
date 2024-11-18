// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `choose a language`
  String get lang {
    return Intl.message(
      'choose a language',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get ar {
    return Intl.message(
      'Arabic',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Skill Swap!`
  String get onBoardingTitle1 {
    return Intl.message(
      'Welcome to Skill Swap!',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Discover a community where you can learn new skills and share your expertise with others. Let's get started!`
  String get onBoardingSubtitle1 {
    return Intl.message(
      'Discover a community where you can learn new skills and share your expertise with others. Let\'s get started!',
      name: 'onBoardingSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Find Your Perfect Match!`
  String get onBoardingTitle2 {
    return Intl.message(
      'Find Your Perfect Match!',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Browse through a diverse range of skills and connect with people who can help you learn and grow.`
  String get onBoardingSubtitle2 {
    return Intl.message(
      'Browse through a diverse range of skills and connect with people who can help you learn and grow.',
      name: 'onBoardingSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Share Your Knowledge!`
  String get onBoardingTitle3 {
    return Intl.message(
      'Share Your Knowledge!',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Have a talent or expertise? Offer your skills to others and become a mentor in our vibrant community.`
  String get onBoardingSubtitle3 {
    return Intl.message(
      'Have a talent or expertise? Offer your skills to others and become a mentor in our vibrant community.',
      name: 'onBoardingSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Learn Anytime, Anywhere!`
  String get onBoardingTitle4 {
    return Intl.message(
      'Learn Anytime, Anywhere!',
      name: 'onBoardingTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Grow Together! - Join a community that believes in mutual growth and learning. Together, we can achieve more.`
  String get onBoardingSubtitle4 {
    return Intl.message(
      'Grow Together! - Join a community that believes in mutual growth and learning. Together, we can achieve more.',
      name: 'onBoardingSubtitle4',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Get Started`
  String get start {
    return Intl.message(
      'Let’s Get Started',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Unlock a world of limitless skills and knowledge with our free skill swapping app, where sharing is caring!`
  String get introMessage {
    return Intl.message(
      'Unlock a world of limitless skills and knowledge with our free skill swapping app, where sharing is caring!',
      name: 'introMessage',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get signIn {
    return Intl.message(
      'SIGN IN',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get signUp {
    return Intl.message(
      'SIGN UP',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Hi, Welcome Back!`
  String get welcomeBackMessage1 {
    return Intl.message(
      'Hi, Welcome Back!',
      name: 'welcomeBackMessage1',
      desc: '',
      args: [],
    );
  }

  /// `Hello again, You have been missed!`
  String get welcomeBackMessage2 {
    return Intl.message(
      'Hello again, You have been missed!',
      name: 'welcomeBackMessage2',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create an account and enjoy a world of learning and connections.`
  String get createAccountDescription {
    return Intl.message(
      'Create an account and enjoy a world of learning and connections.',
      name: 'createAccountDescription',
      desc: '',
      args: [],
    );
  }

  /// `Or Continue With`
  String get orContinueWith {
    return Intl.message(
      'Or Continue With',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Your Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Your Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Your Title, e.g. developer, designer, etc`
  String get titlePlaceholder {
    return Intl.message(
      'Your Title, e.g. developer, designer, etc',
      name: 'titlePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Your Address`
  String get address {
    return Intl.message(
      'Your Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Your Username`
  String get username {
    return Intl.message(
      'Your Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Provide your personal details to enhance your Skill Swap experience and connect with like-minded individuals.`
  String get personalDetailsMessage {
    return Intl.message(
      'Provide your personal details to enhance your Skill Swap experience and connect with like-minded individuals.',
      name: 'personalDetailsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Personal Details`
  String get personalDetails {
    return Intl.message(
      'Personal Details',
      name: 'personalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message(
      'Select Date',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Enter your date of birth for better skill matching and personalized recommendations.`
  String get dobMessage {
    return Intl.message(
      'Enter your date of birth for better skill matching and personalized recommendations.',
      name: 'dobMessage',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Choose Image`
  String get chooseImage {
    return Intl.message(
      'Choose Image',
      name: 'chooseImage',
      desc: '',
      args: [],
    );
  }

  /// `Personalize your account with a profile picture upload`
  String get profilePictureMessage {
    return Intl.message(
      'Personalize your account with a profile picture upload',
      name: 'profilePictureMessage',
      desc: '',
      args: [],
    );
  }

  /// `Upload your Pictures`
  String get uploadPictures {
    return Intl.message(
      'Upload your Pictures',
      name: 'uploadPictures',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Requests`
  String get requests {
    return Intl.message(
      'Requests',
      name: 'requests',
      desc: '',
      args: [],
    );
  }

  /// `Add Skill`
  String get addSkill {
    return Intl.message(
      'Add Skill',
      name: 'addSkill',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get posts {
    return Intl.message(
      'Posts',
      name: 'posts',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get receive {
    return Intl.message(
      'Receive',
      name: 'receive',
      desc: '',
      args: [],
    );
  }

  /// `Swap`
  String get swap {
    return Intl.message(
      'Swap',
      name: 'swap',
      desc: '',
      args: [],
    );
  }

  /// `Write a Comment...`
  String get writeComment {
    return Intl.message(
      'Write a Comment...',
      name: 'writeComment',
      desc: '',
      args: [],
    );
  }

  /// `Connect`
  String get connect {
    return Intl.message(
      'Connect',
      name: 'connect',
      desc: '',
      args: [],
    );
  }

  /// `IN EXPECTATION FOR`
  String get inExpectationFor {
    return Intl.message(
      'IN EXPECTATION FOR',
      name: 'inExpectationFor',
      desc: '',
      args: [],
    );
  }

  /// `WILL OFFER YOU`
  String get willOfferYou {
    return Intl.message(
      'WILL OFFER YOU',
      name: 'willOfferYou',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `In Person`
  String get inPerson {
    return Intl.message(
      'In Person',
      name: 'inPerson',
      desc: '',
      args: [],
    );
  }

  /// `Type your message here`
  String get typeMessage {
    return Intl.message(
      'Type your message here',
      name: 'typeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get skills {
    return Intl.message(
      'Skills',
      name: 'skills',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experience {
    return Intl.message(
      'Experience',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get check {
    return Intl.message(
      'Check',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email and we will send you a link to reset your password.`
  String get resetPasswordMessage {
    return Intl.message(
      'Enter your email and we will send you a link to reset your password.',
      name: 'resetPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Check Your Email`
  String get checkYourEmail {
    return Intl.message(
      'Check Your Email',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been created successfully`
  String get accountCreatedSuccess {
    return Intl.message(
      'Your account has been created successfully',
      name: 'accountCreatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations`
  String get congratulations {
    return Intl.message(
      'Congratulations',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `POST`
  String get post {
    return Intl.message(
      'POST',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Skill you want to get (eg. programming)`
  String get desiredSkillPlaceholder {
    return Intl.message(
      'Skill you want to get (eg. programming)',
      name: 'desiredSkillPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `My Skill/ My Service (eg. piano)`
  String get mySkillServicePlaceholder {
    return Intl.message(
      'My Skill/ My Service (eg. piano)',
      name: 'mySkillServicePlaceholder',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
