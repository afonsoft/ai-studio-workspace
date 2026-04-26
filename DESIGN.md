# DESIGN.md - Architecture and Design Patterns

## Architecture Principles

### Clean Architecture
- **Domain Layer**: Business logic, entities, value objects
- **Application Layer**: Use cases, DTOs, application services
- **Infrastructure Layer**: EF Core, external services, repositories
- **Presentation Layer**: Controllers, APIs, UI components

### SOLID Principles
- **S**: Single Responsibility - Each class has one reason to change
- **O**: Open/Closed - Open for extension, closed for modification
- **L**: Liskov Substitution - Subtypes must be substitutable
- **I**: Interface Segregation - Clients shouldn't depend on unused interfaces
- **D**: Dependency Inversion - Depend on abstractions, not concretions

## Design Patterns

### Data Access
- **Repository Pattern**: Generic repository with Unit of Work
- **Specification Pattern**: Encapsulate query logic
- **CQRS**: Separate read and write operations

### Business Logic
- **Factory Pattern**: Object creation
- **Strategy Pattern**: Interchangeable algorithms
- **Decorator Pattern**: Behavior extension
- **Observer Pattern**: Event-driven architecture

### API Design
- **RESTful**: Resource-based URLs, proper HTTP verbs
- **DTO Pattern**: Data transfer objects for API contracts
- **MediatR**: CQRS with MediatR pattern
- **API Versioning**: URL-based or header-based versioning

## Project Structure

### Solution Organization
```
src/
├── Domain/              # Core business logic
│   ├── Entities/
│   ├── ValueObjects/
│   ├── Interfaces/
│   └── Events/
├── Application/         # Use cases and orchestration
│   ├── Commands/
│   ├── Queries/
│   ├── DTOs/
│   └── Services/
├── Infrastructure/      # External concerns
│   ├── Data/
│   ├── Services/
│   └── Repositories/
└── Presentation/        # API/UI
    ├── Controllers/
    ├── Models/
    └── ViewModels/
```

### Layer Dependencies
- Domain → No dependencies
- Application → Domain
- Infrastructure → Application, Domain
- Presentation → Application

## Database Design

### EF Core Conventions
- **NoTracking**: Use AsNoTracking() for read-only queries
- **Split Queries**: Use AsSplitting() for navigation collections
- **Indexing**: Add indexes for frequently queried columns
- **Soft Delete**: Use IsDeleted column instead of hard deletes

### Naming Conventions
- **Tables**: PascalCase, plural (e.g., Customers, Orders)
- **Columns**: PascalCase (e.g., FirstName, CreatedAt)
- **Foreign Keys**: {Table}Id (e.g., CustomerId, OrderId)
- **Indexes**: IX_{Table}_{Column} (e.g., IX_Customers_Email)

## API Design Guidelines

### RESTful Endpoints
```
GET    /api/users           # List users
GET    /api/users/{id}      # Get specific user
POST   /api/users           # Create user
PUT    /api/users/{id}      # Update user
PATCH  /api/users/{id}      # Partial update
DELETE /api/users/{id}      # Delete user
```

### Response Format
```json
{
  "data": { },
  "message": "Success",
  "errors": [ ],
  "statusCode": 200
}
```

### Error Handling
- **400**: Bad Request - Validation errors
- **401**: Unauthorized - Authentication required
- **403**: Forbidden - Authorization required
- **404**: Not Found - Resource not found
- **500**: Internal Server Error - Unexpected errors

## Frontend Architecture

### Angular Structure
```
src/
├── app/
│   ├── core/              # Singleton services
│   ├── features/          # Feature modules
│   ├── shared/            # Shared components
│   └── layouts/           # Layout components
├── assets/
└── environments/
```

### Component Design
- **Standalone Components**: Use standalone with v20+
- **Signals**: Use signals for reactive state
- **OnPush**: Use OnPush change detection
- **Lazy Loading**: Lazy load feature modules

## Security Patterns

### Authentication
- **JWT**: JSON Web Tokens for stateless auth
- **Refresh Tokens**: Long-lived refresh tokens
- **Password Hashing**: Use bcrypt or Argon2

### Authorization
- **Role-Based**: Role-based access control
- **Policy-Based**: Policy-based authorization
- **Resource-Based**: Resource-level permissions

### Data Protection
- **Encryption**: Encrypt sensitive data at rest
- **HTTPS**: Always use HTTPS in production
- **Input Validation**: Validate all user inputs
- **Output Encoding**: Encode output to prevent XSS

## Performance Patterns

### Caching
- **In-Memory**: Use IMemoryCache for frequently accessed data
- **Distributed**: Use IDistributedCache for distributed caching
- **Response Caching**: Use response caching for static content
- **CDN**: Use CDN for static assets

### Database Optimization
- **Indexing**: Proper indexing for query performance
- **Query Optimization**: Use AsNoTracking() and AsSplitting()
- **Connection Pooling**: Configure connection pool size
- **Batch Operations**: Use batch operations for bulk inserts

### Async Patterns
- **Async/Await**: Use async/await for I/O operations
- **ConfigureAwait**: Use ConfigureAwait(false) in library code
- **Cancellation**: Use CancellationToken for long operations
- **Parallel Processing**: Use Task.WhenAll for parallel operations

## Testing Strategy

### Unit Tests
- **Arrange-Act-Assert**: Follow AAA pattern
- **Mocking**: Use NSubstitute or Moq for mocking
- **Test Coverage**: Aim for >80% coverage
- **Test Naming**: Use descriptive test names

### Integration Tests
- **TestServer**: Use TestServer for API testing
- **In-Memory DB**: Use in-memory database for tests
- **Test Data**: Use test data factories
- **Test Cleanup**: Clean up test data after tests

## References
- [agents/AGENTS.md](agents/AGENTS.md) - Coding conventions
- [agents/rules/](agents/rules/) - Detailed rules
- [agents/skills/](agents/skills/) - Skill packages
