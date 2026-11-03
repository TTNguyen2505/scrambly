## Jira Tracking
- **Jira Task:** [OOP-XX](https://your-domain.atlassian.net/browse/OOP-XX)
- **Parent Epic:** [OOP-YY](https://your-domain.atlassian.net/browse/OOP-YY) <!-- Optional: remove if not applicable -->
- **Related GitHub Issue:** N/A <!-- Or Closes #123 if tracking GitHub issues in parallel -->

## Description
<!-- Briefly summarize what changes were made and why. -->


## Type of Change
<!-- Check [x] all applicable options -->
- [ ] `feat`: New feature (non-breaking change adding functionality or UI)
- [ ] `fix`: Bug fix (non-breaking change fixing an issue or logic bug)
- [ ] `refactor`: Code refactoring (neither fixes a bug nor adds a feature)
- [ ] `perf`: Performance improvement (memory optimization, FPS/render boost)
- [ ] `docs`: Documentation updates (LaTeX report, README, technical docs)
- [ ] `chore`: Build, tooling, asset, or formatting updates (CMake, CI/CD, .gitignore)
- [ ] `!` BREAKING CHANGE (changes that alter existing APIs or architecture)

## Visual Changes (UI / QML)
<!-- Attach before/after screenshots or short demo clips (drag & drop into GitHub). Write N/A for backend or logic-only tasks. -->
- *N/A*

## Checklist
<!-- Check [x] all items before requesting a review -->
- [ ] **PR Title** follows the Jira convention: `[OOP-XX] <type>(<scope>): <description>` (e.g., `[OOP-13] feat(ui): build design system tokens`)
- [ ] Rebased onto the latest `main` branch prior to pushing
- [ ] Code adheres to formatting standards (`clang-format` and `qmlformat` executed)
- [ ] Built and verified locally on the target environment
- [ ] No new compiler warnings, QML console errors, or memory leaks introduced