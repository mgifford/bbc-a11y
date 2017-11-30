Feature: Content resizing

  Users must be able to control font sizing and user interface (UI) scaling.

  All users benefit when they can adapt the size of content to see and read it.
  This may be a constant or temporary adaption due, for example, to screen size,
  screen glare, or vision impairment.

  Ensure that content responds to platform native text resizing, and that
  scaling (or "zoom") is supported.

  Users who magnify or zoom in on content only see part of the screen. Try to
  keep on-screen changes close to the point of interaction. For example, if a
  user completes an input field incorrectly add a visual cue above, below or
  inside the field, rather than out to the side.

  HTML Applicability
  ==================

  * Text must be styled with units that are resizable in all browsers.

  * Content must be visible and usable with text resized to 200% of normal.

  * Content must be visible and usable with page zoomed to 200% of normal.

  * Where available on a platform zoom must be suported.

  Standard browser features for resizing text or page zoom can make content
  accessible to many low vision users without the need for additional assistive
  technologies such as screen magnifiers or screen readers.

  Text resizing and page zoom cater to different needs, and therefore both
  should be supported.

  Internet Explorer does not resize text that have been styled in px units,
  therefore em, % or similar units should be used.

  Browsers on iOS, Android, and other mobile platforms also support zoom with
  pinch-in and pinch-out gestures. In most cases it is just a matter of not
  disabling this, but there are some cases when it is appropriate to implement
  content specific interactions, such as with zoomable maps, which should mimic
  the same pinch-in and pinch-out gestures.

  @html @automated
  Scenario: Text must be styled with units that are resizable in all browsers
    Given a page with the body:
      """
      <p style="font-size: 16px">Styled in px!</p>
      <style>b { font-size: 18px }</style>
      <b>Styled in px!</b>
      """
    When I test the "Design: Content resizing: Text must be styled with units that are resizable in all browsers" standard
    Then it fails with the message:
      """
      Text styled with px unit: /html/body/p
      Text styled with px unit: /html/body/b
      """

  @html @automated
  Scenario: User agent stylesheet is ignored
    Given a page with the body:
      """
      <p>Not styled in px!</p>
      """
    When I test the "Design: Content resizing: Text must be styled with units that are resizable in all browsers" standard
    Then it passes

  @html @manual
  Scenario: Manual pass of "Content must be visible and usable with page zoomed to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with page zoomed to 200% of normal" standard
    And I have been asked "Is the content visible and usable with the page zoomed to 200% of normal?"
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail of "Content must be visible and usable with page zoomed to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with page zoomed to 200% of normal" standard
    And I have been asked "Is the content visible and usable with the page zoomed to 200% of normal?"
    When I answer "No"
    Then the manual test fails

  @html @manual
  Scenario: Manual pass of "Content must be visible and usable with text resized to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with text resized to 200% of normal" standard
    And I have been asked "Is the content visible and usable with the text resized to 200% of normal?"
    When I answer "Yes"
    Then the manual test passes

  @html @manual
  Scenario: Manual fail of "Content must be visible and usable with text resized to 200% of normal"
    Given I am performing a manual test of the "Design: Content resizing: Content must be visible and usable with text resized to 200% of normal" standard
    And I have been asked "Is the content visible and usable with the text resized to 200% of normal?"
    When I answer "No"
    Then the manual test fails
