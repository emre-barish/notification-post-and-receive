# Notification Post and Receive


| **Device** | **Minimum OS** |
|:---:|:---:|
| **iPhone** | iOS 16 |

## Overview

This sample app shows how to post a notification via `NotificationCenter`, and take an action when the notification is received by a publisher of `NotificationCenter`.

There is a `TextField` to type in and send a message in the sample app. When the message is sent by tapping the button labelled `Send Message`, a notification is posted via `NotificationCenter`, and received by a publisher of `NotificationCenter` which updates the text that displays the message received.

