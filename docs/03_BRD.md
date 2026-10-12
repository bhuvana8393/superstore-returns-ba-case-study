# Business Requirements Document (BRD)

## Purpose

This BRD expands the Business Case into requirements the solution must satisfy: a self-service return channel with mandatory reason capture, an auto-generated refund reference, and category, region, and reason reporting.

## Business Objectives

- Give customers a way to submit a return without contacting Support.
- Capture a reason for 100% of returns going forward (today: 0%).
- Cut manual Support handling time per return request.
- Give Ops and Finance a return-rate view by category, region, and reason to set and track a reduction target.

## Scope

**In scope:** customer return-request flow with reason dropdown, auto-generated refund reference, return-rate reporting (category, region, reason).

**Out of scope:** warehouse/inspection workflow automation, carrier/logistics integration, refund payment rail changes. Treated as out of scope until confirmed otherwise.

## Current State vs. Desired State

| Area | Current State | Desired State |
| --- | --- | --- |
| Return request | Phone/email to Support, no fixed format | Self-service web form, structured fields |
| Reason capture | Not recorded anywhere | Mandatory dropdown, logged with every return |
| Refund reference | Manual, ad hoc, inconsistent | Auto-generated, unique per return |
| Reporting | None; return rate not visible to the business | Power BI dashboard: return rate by category, region, reason |
| Data trail | Order ID and "Returned" status only | Order ID, reason, date, refund reference, status |

## Business Requirements

| ID | Requirement | Priority | Rationale |
| --- | --- | --- | --- |
| BR-01 | The business shall let customers submit a return request online without contacting Support. | High | Removes the main manual bottleneck |
| BR-02 | The business shall require a reason to be selected for every return submitted. | High | Root-cause visibility is the core gap today |
| BR-03 | The business shall auto-generate a unique refund reference number for every processed return. | High | Needed for Finance reconciliation |
| BR-04 | The business shall report return rate by product category, region, and reason. | High | Directly supports the project's KPI |
| BR-05 | The business shall retain historical return records to support trend analysis over time. | Medium | Enables year-over-year comparison |
| BR-06 | The business shall notify the Warehouse team of the stated return reason before the item arrives. | Medium | Speeds up inspection, flags mismatches early |
| BR-07 | The business shall route a submitted return through logging, inspection, and refund without manual re-entry at each handoff. | Medium | Reduces duplicate data entry and delay |

## Assumptions and Constraints

- The existing Orders/Returns data structure (Order ID, Status) is the system of record to extend, not replace.
- Refund payment processing stays manual for this phase; only the reference number and reconciliation trail are automated.
- Warehouse/logistics automation is out of scope pending confirmation.

## Stakeholders

See [02_stakeholders_raci_user_stories.md](02_stakeholders_raci_user_stories.md).

## Success Metrics

Reason-code capture rate (target: 100%), Support handling time per return, and return rate by category, region, and reason. Baseline is 10.41% overall, with a numeric reduction target to be set from the SQL breakdown.
