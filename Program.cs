using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


builder.Services.AddApplicationInsightsTelemetry();


var app = builder.Build();

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment()) //Inside a Docker container, the default environment is Production

app.UseSwagger();
app.UseSwaggerUI(); 


app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
