
<div align="center">
  <img src="https://user-images.githubusercontent.com/25383436/156942429-0f111ad7-6004-4b5f-8570-73518765822c.png" alt="Logo" width="100%">
  <h1>A relationship app.</h1>
  <h6>Stay connected with your partner by evaluating your satisfaction in various areas of the relationship.</h6>
  <strong>
    <a href="#about">View screenshots</a>
    • 
  <a href="https://github.com/clukes/LoveHue/issues/new?assignees=&labels=enhancement&template=02_FEATURE_REQUEST.md&title=feat%3A+">Request a Feature</a>
  </strong>
</div>

<details>
<summary>Table of Contents</summary>

- [About](#about)
  - [Screenshots](#screenshots)
    - [Features](#features)
  - [Built With](#built-with)
- [Roadmap](#roadmap)
- [Support](#support)

</details>

---

## About

This app is designed to facilitate open and honest communication in relationships. 

You and your partner can link to each other with a unique link code, then set and update in realtime your ratings for different aspects of the relationship, e.g. Verbal Affection, Physical Affection. 

This can then open a conversation about why you each feel that way, moving the focus from your phones to each other.

> App is not yet released, but is being prepared for a Google Play Store release.
>
> Currently focusing on Android development. A web app is also being considered, but iOS is unlikely due to the Apple developer costs.

<details open>
  <summary><h3>Screenshots</h3></summary>
  
  Sign-in | Email-Link | Link Sent 
  :--: | :--: | :--: 
  ![Sign-in](/doc/screenshots/Signin.png) | ![Email](/doc/screenshots/Email.png) | ![LinkSent](/doc/screenshots/LinkSent.png) 
  
  Home | Delete Account
  :--: | :--: 
  ![Home](/doc/screenshots/Home.png) | ![Delete Account](/doc/screenshots/DeleteAccount.png)

  <h4>Gifs</h4>
  
  Linking | Updating values
  :--: | :--: 
  ![Linking](/doc/screenshots/Linking.gif) | ![Updating Values](/doc/screenshots/Updating.gif)
  
  Resetting values | Unlinking
  :--: | :--: 
  ![Resetting values](/doc/screenshots/Resetting.gif) | ![Unlinking](/doc/screenshots/Unlinking.gif)


</details>

### Features
- Authorisation, with passwordless email link sign in or anonymous sign in.
- Unique 5 character generated codes for each user, to easily link to partner.
- 7 default relationship aspects.
- Colour indicators for aspect values.
- Realtime updating between partners.
- Timestamps for last updates.
- Undo one value change, or cancel all changes.
- Display name changing.
- Account and data deletion.

### Built With

- Flutter
- Google Firebase (Authentication and NoSQL database)

## Roadmap
Current stage TODO:
- [ ] Minor bug fixes 
- [ ] Some extra touches to app before release
- [ ] Finalising production database setup
- [ ] Optimisation

Development Process for V1.0:
- [x] Design
- [ ] Development (Almost complete)
- [ ] Unit testing
- [ ] Beta Testing
- [ ] Production

Future updates:
- [ ] Ability to add, delete and edit your own relationship aspects.

## Support

Check for existing issues or submit a new one:
- [GitHub issues](https://github.com/clukes/LoveHue/issues/new?assignees=&labels=question&template=04_SUPPORT_QUESTION.md&title=support%3A+)
