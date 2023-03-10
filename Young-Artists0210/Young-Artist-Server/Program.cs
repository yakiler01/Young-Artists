using Microsoft.EntityFrameworkCore;
using Young_Artist_Server.Models;
using Young_Artist_Server.Controllers;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Add services to the container. (container�N�O�e�� DI�`�J)
string YoungArtistsConnectionString = builder.Configuration.GetConnectionString("YoungArtists");
// ���U�A��
builder.Services.AddDbContext<YoungArtistsContext>(options => {
    options.UseSqlServer(connectionString: YoungArtistsConnectionString);
});

// CORS Strategy ��쵦��
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

// ���
app.UseCors();
// ���
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

//app.MapCommodityEndpoints();

app.Run();
