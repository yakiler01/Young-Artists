using Microsoft.EntityFrameworkCore;
using Young_Artist_Server.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Add services to the container. (container就是容器 DI注入)
string YoungArtistsConnectionString = builder.Configuration.GetConnectionString("YoungArtists");
// 註冊服務
builder.Services.AddDbContext<YoungArtistsContext>(options => {
    options.UseSqlServer(connectionString: YoungArtistsConnectionString);
});

// CORS Strategy 跨域策略
var MyAllowOrigins = "AllowAny";
builder.Services.AddCors(option => {
    option.AddPolicy(
        name: MyAllowOrigins,
        policy => policy.WithOrigins("*").WithMethods("*").WithHeaders("*")
    );
});


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// 跨域
app.UseCors();
// 跨域
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
