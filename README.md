# Auth, Inventory & Orders Microservices
.NET 8 reference solution with Auth, Inventory and Order services.

Auth -> auth_db; Inventory -> inventory_db; Order -> order_db. Order calls Inventory over HTTP and never accesses inventory_db. JWT + ADMIN/USER RBAC, pagination, global exception handling, Serilog file logs, atomic stock decrement, order cancellation with stock restoration.

Ports: Auth https://localhost:7201, Inventory https://localhost:7202, Order https://localhost:7203.

Run Auth, Inventory, then Order. Use JWT as `Authorization: Bearer <token>`.

Production note: public registration should always create USER; provision ADMIN separately.
