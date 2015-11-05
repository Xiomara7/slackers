//
//  Constants.swift
//  slackers
//
//  Created by Xiomara on 11/4/15.
//  Copyright © 2015 Xiomara. All rights reserved.
//

import Foundation

let productionUrl = "https://slack.com/api/"

let TOKEN = "xoxp-4698769766-4698769768-4898023905-7a1afa"

let AUTH_PATH = "auth.test"
let USERS_PATH = "users.list"

let DELEGATE = UIApplication.sharedApplication().delegate as! AppDelegate

// Entities

let USER_ENTITY = "User"
let PROFILE_ENTITY = "Profile"

// Images

let IMG_BG = "background_img"
let IMG_CLOSE = "close-icon"
let IMG_EMAIL = "envelope-icon"
let IMG_SKYPE = "chats-icon"
let IMG_PHONE = "bell-icon"

// Sizes

let defaultscreenSize = UIScreen.mainScreen().bounds
let defaultBorderWidth: CGFloat = 2.0
let defaultCornerRadius: CGFloat = 10.0
let defaultCellHeight: CGFloat = 104.0
let profileImageSize: CGFloat = 192.0

// Cells

let defaultReuseIdentifier = "Cell"

// Fonts 

let userFontName = "HelveticaNeue-UltraLightItalic"
let nameFontName = "HelveticaNeue-Medium"
let normalFontName = "HelveticaNeue"

let ADMIN = "admin"

// errors

let FETCH_ERR = "Could not fetch "
let SAVE_ERR = "Failure to save context "

// messages

let LOADING_MSG = "Hire Me, Slack - added by @xiomara"




