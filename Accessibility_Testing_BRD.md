# Business Requirements Document: Accessibility Testing

## Requirement Title 1: Accessibility Testing

### Overview

This report summarizes the accessibility testing performed on the Fairfax Assistance Portal to assess its compliance with WCAG guidelines and evaluate the impact on end users, especially those relying on keyboard navigation and assistive technologies. The assessment covered all key customer-facing pages, and documents both the accessibility issues detected and the proposed remediation approach.

Accessibility evaluation was conducted using the Siteimprove Accessibility Checker as the primary testing tool, supplemented by a manual review of page structure, headings, links, ARIA usage, and interactive elements. The scan revealed multiple accessibility issues related to color contrast, ARIA landmarks, visible label mismatches, link visibility, control sizing, and text presentation, which may affect both usability and readability across devices.

To validate specific issues such as contrast ratios, heading hierarchy, and link visibility, supporting tools like the WAVE Web Accessibility Evaluation Tool and WebAIM Contrast Checker were referenced as part of secondary validation efforts. These tools helped verify findings flagged by Siteimprove and ensure alignment with accessibility best practices.

Overall, this report provides a consolidated summary of issues and outlines recommended fixes that can be implemented through Portal Management and CSS overrides to improve accessibility and user experience across the portal.

### Scope

The key customer-facing web pages that were covered as part of accessibility testing are as follows:

#### Common Pages
- Home
- HSRG
- HSRG > Reports
- FAQs
- Help

#### Profile: Community Member
- Assistance Requests > My Assistance Requests
- Assistance Requests > My Withdrawn Assistance Requests
- Assistances
- Assistances > Assistance Details
- Profile

#### Profile: CBO
- Accounts
- Accounts > Account Details
- Accounts > Referrals
- Accounts > Report
- Profile

---

## Accessibility Issues Identified

### 1. Interactive Elements Do Not Meet Enhanced Size (WCAG 2.5.5)

**Issue Description:**
Buttons or clickable areas are too small, which makes it hard for keyboard and touch users to interact with them.

**Proposed Fix:**
Increase minimum touch target size (44×44px) using CSS and ensure padding/margins are sufficient.

**Impact:**
- Affects users with motor disabilities
- Impacts mobile and tablet users
- Reduces usability for keyboard-only navigation

---

### 2. Visible Label and Accessible Name Do Not Match (WCAG 2.5.3)

**Issue Description:**
The text shown visually is different from what assistive technologies read, leading to confusion for screen reader users.

**Proposed Fix:**
Align aria-label/aria-labelledby with visible text OR use aria-hidden where required.

**Impact:**
- Confuses screen reader users
- Creates inconsistent user experience
- May lead to incorrect form submissions or navigation

---

### 3. Text Not Included in an ARIA Landmark

**Issue Description:**
Important content is not enclosed within ARIA landmark regions (like `<main>`, `<nav>`, `<header>`), reducing page structure clarity for screen readers.

**Proposed Fix:**
Wrap major sections in `<main>`, `<nav>`, `<header>`, `<footer>` or assign correct role attributes.

**Impact:**
- Reduces navigation efficiency for screen reader users
- Makes page structure unclear
- Impairs content discovery

---

### 4. Links Are Not Clearly Identifiable (WCAG 1.4.1 - Use of Color)

**Issue Description:**
Links rely only on color to show they are clickable but need an additional cue like underline or hover effect.

**Proposed Fix:**
Add underline or hover states using CSS (text-decoration) to visually distinguish links.

**Impact:**
- Affects users with color vision deficiencies
- Reduces link discoverability
- Violates WCAG 1.4.1 requirement for non-color indicators

---

### 5. Color Contrast Does Not Meet Enhanced Requirements (WCAG 1.4.6)

**Issue Description:**
Text and background colors do not have enough contrast, making content hard to read, especially for users with low vision.

**Proposed Fix:**
Adjust text/background colors to meet WCAG contrast ratio of at least 4.5:1 (AA) or 7:1 (AAA).

**Impact:**
- Affects users with low vision
- Reduces readability in various lighting conditions
- May cause eye strain for all users

---

### 6. Line Height Is Below Minimum Value (WCAG 1.4.8 - Visual Presentation)

**Issue Description:**
The spacing between lines is too tight, reducing readability and failing WCAG guidelines.

**Proposed Fix:**
Increase line-height to 1.5 or higher for readability in CSS.

**Impact:**
- Reduces readability for all users
- Particularly affects users with dyslexia or reading difficulties
- May cause eye strain during extended reading

---

### 7. Font Size Is Fixed (Violates WCAG 1.4.8)

**Issue Description:**
Font cannot resize properly, which makes it difficult for users who rely on zoom or customized text sizes.

**Proposed Fix:**
Use rem/em instead of px and avoid hard-coded font sizes.

**Impact:**
- Prevents users from customizing text size
- Breaks browser zoom functionality
- Affects users with visual impairments who need larger text

---

### 8. Content Missing After Heading

**Issue Description:**
A heading is present, but no supporting content follows it, which harms page structure and confuses screen reader users.

**Proposed Fix:**
Add meaningful content below the heading or remove unnecessary headings.

**Impact:**
- Confuses screen reader users
- Creates poor page structure
- May mislead users about available content

---

### 9. ARIA Attribute Unsupported or Prohibited

**Issue Description:**
Some elements have invalid or incorrectly used ARIA attributes, which may cause screen readers to misinterpret content or ignore accessibility features.

**Proposed Fix:**
Remove unsupported ARIA attributes or use only valid combinations of role, aria-*, and semantic HTML elements.

**Impact:**
- May cause screen readers to misinterpret content
- Can break assistive technology functionality
- Creates inconsistent accessibility behavior

---

### 10. Interactive Elements Do Not Meet Minimum Size Nor Spacing

**Issue Description:**
Some buttons or links are either too small or too close together, making it easy for users to activate the wrong control.

**Proposed Fix:**
Ensure each interactive element has at least a 24×24 px target or enough spacing around it (e.g., 8-10 px), using padding/margins so that the overall tappable area is comfortably large and clearly separated from neighboring controls.

**Impact:**
- Increases risk of accidental clicks/taps
- Affects users with motor disabilities
- Reduces usability on mobile devices

---

## Page-Specific Testing Results

### Common Pages

#### 1. Target Page: Home
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 2. Target Page: HSRG
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 3. Target Page: HSRG > Reports
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 4. Target Page: FAQs
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 5. Target Page: Help
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

---

### Profile - Community Member

#### 1. Target Page: Assistance Requests > My Assistance Requests
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 2. Target Page: Assistance Requests > My Withdrawn Assistance Requests
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 3. Target Page: Assistances
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 4. Target Page: Assistances > Assistance Details
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 5. Target Page: Profile
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

---

### Profile – CBO

#### 1. Target Page: Accounts
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 2. Target Page: Accounts > Account Details
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 3. Target Page: Accounts > Referrals
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 4. Target Page: Accounts > Report
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

#### 5. Target Page: Profile
**Status:** Tested
**Issues Found:** Multiple accessibility issues identified (see above for details)

---

## Testing Methodology

### Primary Testing Tool
- **Siteimprove Accessibility Checker**: Used as the primary automated testing tool

### Secondary Validation Tools
- **WAVE Web Accessibility Evaluation Tool**: Used to validate contrast ratios and heading hierarchy
- **WebAIM Contrast Checker**: Used to verify color contrast compliance

### Manual Review Areas
- Page structure
- Headings hierarchy
- Links and interactive elements
- ARIA usage and landmarks
- Keyboard navigation flow

---

## Implementation Approach

### Recommended Implementation Methods

1. **Portal Management Configuration**
   - Update portal settings where applicable
   - Configure accessibility features through admin interface

2. **CSS Overrides**
   - Implement fixes through custom CSS
   - Ensure changes do not break existing functionality
   - Test across different browsers and devices

3. **HTML Structure Updates**
   - Add semantic HTML elements
   - Implement ARIA landmarks
   - Fix heading structure

4. **Component-Level Fixes**
   - Update interactive elements (buttons, links)
   - Fix form labels and ARIA attributes
   - Adjust spacing and sizing

---

## Success Criteria

### Compliance Goals
- Achieve WCAG 2.1 Level AA compliance minimum
- Target WCAG 2.1 Level AAA where feasible
- Ensure all identified issues are resolved

### User Experience Goals
- Improve usability for keyboard-only users
- Enhance screen reader compatibility
- Better mobile and touch device experience
- Increased readability for all users

### Validation
- Re-test all pages after fixes are implemented
- Verify fixes using same testing tools
- Conduct user acceptance testing with assistive technology users

---

## Priority Classification

### High Priority
- Color contrast issues (affects all users)
- Interactive element sizing (affects usability)
- ARIA landmark structure (affects screen reader navigation)
- Link visibility (affects navigation)

### Medium Priority
- Label mismatches (affects screen reader users)
- Line height and font sizing (affects readability)
- ARIA attribute issues (affects assistive technology)

### Low Priority
- Content after headings (affects structure clarity)
- Spacing between elements (affects usability but less critical)

---

## Dependencies

- Access to Portal Management interface
- Ability to implement CSS overrides
- HTML structure modification capabilities
- Testing environment for validation

---

## Risks and Mitigation

### Risks
- CSS overrides may conflict with existing styles
- Changes may affect visual design
- Implementation may require multiple iterations

### Mitigation
- Test changes in staging environment first
- Maintain design consistency while fixing issues
- Conduct thorough regression testing
- Get stakeholder approval before production deployment

---

## Timeline Considerations

### Phase 1: High Priority Fixes
- Color contrast adjustments
- Interactive element sizing
- ARIA landmark implementation
- Link visibility improvements

### Phase 2: Medium Priority Fixes
- Label alignment
- Typography improvements
- ARIA attribute corrections

### Phase 3: Low Priority Fixes
- Content structure improvements
- Spacing refinements

---

## Notes

- All fixes should be tested across multiple browsers (Chrome, Firefox, Safari, Edge)
- Mobile responsiveness should be maintained
- Changes should not negatively impact existing functionality
- Consider user feedback during and after implementation

---

## Document Version

**Version:** 1.0  
**Date:** [Current Date]  
**Author:** Accessibility Testing Team  
**Status:** Draft for Review
