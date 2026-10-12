# Stakeholder Register, RACI, and User Stories

## Stakeholder Register

| Stakeholder | Role | Interest / Stake |
| --- | --- | --- |
| Operations Manager | Owns the returns process | Lower handling cost, KPIs to report up |
| Customer Support Lead | Manages the team fielding returns | Fewer manual tickets, fast reason logging |
| Warehouse Team | Receives and inspects returned items | Advance notice of reason and SKU before the item arrives |
| Finance | Processes refunds | Auditable refund-reference trail, cost visibility by category |
| Regional Managers (Chris: Central, Erin: East, Sam: South, William: West) | Own regional P&L | Whether their region's return rate is above or below others |
| Customer | Requests the return | A fast, no-call way to request a return and track it |
| IT/Dev | Builds the form and data changes | Clear functional specs (see FRD) |

## RACI

R = Responsible, A = Accountable, C = Consulted, I = Informed

| Activity | Ops Mgr | Support Lead | Warehouse | Finance | IT/Dev | Customer |
| --- | --- | --- | --- | --- | --- | --- |
| Define return reasons and policy | A | R | C | I | I | I |
| Build self-service return form | C | C | I | I | R, A | I |
| Log return, generate refund ref | I | R | I | C | A | I |
| Inspect returned item | I | I | R, A | I | I | I |
| Approve and process refund | I | I | C | R, A | I | I |
| Build return-rate dashboard | A | C | I | C | R | I |
| Submit return request | I | I | I | I | I | R |

## User Stories

1. As a **customer**, I want to request a return online and pick a reason from a dropdown, so that I don't have to call Support and wait on hold.
2. As a **Customer Support agent**, I want every return to arrive pre-logged with a reason and order reference, so that I don't have to chase order details before I can act.
3. As the **Operations Manager**, I want a dashboard showing return rate by category, region, and reason, so that I can spot problem areas and report on them to leadership.
4. As a **Finance analyst**, I want an auto-generated refund reference tied to each return, so that I can reconcile refunds against orders without manual lookups.
5. As a **Warehouse team member**, I want to see the stated return reason before the item arrives, so that I can inspect for the right thing and flag mismatches quickly.
