# Building Risk Assessment Scenarios

This lecture explains how to turn technical weaknesses into complete risk scenarios. It uses a vulnerable student portal as the main example, covering student accounts, admin accounts, grades, a login page, a search page, and a SQLite database.

## Materials

- `THREAT_TO_RISK.pdf` - lecture slides.

## Main Topics

- Difference between asset, threat, vulnerability, impact, and risk.
- Why a threat is not the same thing as a vulnerability.
- How to build a strong risk scenario that is specific, realistic, complete, measurable, and actionable.
- Example scenarios for SQL injection login bypass, plaintext password exposure, missing MFA, and chained risk.
- Practical fixes such as parameterized queries, password hashing, and MFA for admin users.

## Lecture Goal

By the end of this lecture, students should be able to describe a real system, identify its assets and weaknesses, write clear risk scenarios, estimate likelihood and impact, and connect each risk to a useful control or fix.
