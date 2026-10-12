# Business Case: Reducing Returns at Superstore

## Background

Superstore sells across three categories (Office Supplies, Furniture, Technology) through four regions (Central, East, South, West). Of 5,496 orders in the dataset, 572 (about 10.4%) came back. The Returns sheet records nothing beyond an Order ID and a "Returned" status: no reason code, no return date, no refund amount.

## Problem Statement

Returns are handled manually today: a customer calls or emails Support, the order is looked up, and a refund is issued case by case. There is no self-service channel and no reason tracking. This creates three costs:

1. Avoidable Support handling time.
2. Reverse-logistics and refund cost with no visibility into what drives it.
3. No data trail to fix root causes (product description, packaging damage, wrong item, and so on).

## Objective

Design a self-service returns process, and the data model behind it, so Superstore can let customers request a return online with a reason code, cut manual Support handling time, and give Ops and Finance a reliable return-rate view by category, region, and reason.

## Scope

- **In scope:** customer-facing return request flow (reason capture, auto refund reference), the data changes to support it, and a Power BI reporting layer for return-rate KPIs.
- **Out of scope:** warehouse/inspection workflow automation, carrier/logistics integration, and changes to the refund payment rails themselves.

## Current vs. Desired State

| | Current State | Desired State |
| --- | --- | --- |
| Return request | Phone/email to Support | Self-service web form |
| Reason capture | Not recorded | Mandatory reason dropdown, logged |
| Refund reference | Manual, ad hoc | Auto-generated on submission |
| Reporting | None; return rate is invisible | Power BI dashboard: rate by category, region, reason |

## Expected Benefits

Lower Support handling time per return; category, region, and reason visibility for targeted fixes; a baseline to set a real reduction target against.

## Risks

Data-model changes need coordination with whatever holds Orders and Returns today. A reason dropdown only helps if the reasons are ones Ops can act on, not a catch-all "Other".

## Success Criteria

Baseline return rate (10.41%) tracked by category, region, and reason in the dashboard, with a numeric reduction target set once that breakdown exists.
