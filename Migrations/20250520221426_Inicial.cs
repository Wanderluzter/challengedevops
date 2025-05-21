using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace challengedotnet.Migrations
{
    /// <inheritdoc />
    public partial class Inicial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Motos",
                columns: table => new
                {
                    id = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    placa = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    tag = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    cliente = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Motos", x => x.id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Motos");
        }
    }
}
