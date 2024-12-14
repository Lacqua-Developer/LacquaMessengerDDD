using LacquaMessenger.Infra;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Threading.Tasks;

public abstract class ProcedureService<T> where T : class
{
    private readonly Context _context;

    protected ProcedureService(Context context)
    {
        _context = context;
    }

    protected async Task<T> ExecuteProcedureAsync(string procedureName, params DbParameter[] parameters)
    {
        using var command = _context.Database.GetDbConnection().CreateCommand();
        command.CommandText = procedureName;
        command.CommandType = CommandType.StoredProcedure;

        if (parameters != null && parameters.Length > 0)
        {
            command.Parameters.AddRange(parameters);
        }

        await _context.Database.OpenConnectionAsync();

        try
        {
            using var reader = await command.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                return MapFromReader(reader);
            }
        }
        finally
        {
            await _context.Database.CloseConnectionAsync();
        }

        return null;
    }

    protected async Task<List<T>> ExecuteProcedureListAsync(string procedureName, params DbParameter[] parameters)
    {
        using var command = _context.Database.GetDbConnection().CreateCommand();
        command.CommandText = procedureName;
        command.CommandType = CommandType.StoredProcedure;

        if (parameters != null && parameters.Length > 0)
        {
            command.Parameters.AddRange(parameters);
        }

        await _context.Database.OpenConnectionAsync();

        try
        {
            using var reader = await command.ExecuteReaderAsync();
            var result = new List<T>();
            while (await reader.ReadAsync())
            {
                var entity = MapFromReader(reader);
                result.Add(entity);
            }
            return result;
        }
        finally
        {
            await _context.Database.CloseConnectionAsync();
        }
    }

    protected abstract T MapFromReader(DbDataReader reader);
}
