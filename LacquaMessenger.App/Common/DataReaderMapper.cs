using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Reflection;

public static class DataReaderMapper
{
    public static T MapToClass<T>(DbDataReader reader) where T : class, new()
    {
        T returnedObject = new T();
        List<PropertyInfo> properties = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance)
                                                 .OrderBy(p => p.MetadataToken)
                                                 .ToList();

        foreach (var prop in properties)
        {
            if (ColumnExists(reader, prop.Name) && !reader.IsDBNull(reader.GetOrdinal(prop.Name)))
            {
                try
                {
                    object value = reader.GetValue(reader.GetOrdinal(prop.Name));
                    prop.SetValue(returnedObject, Convert.ChangeType(value, prop.PropertyType));
                }
                catch
                {
                    // Ignorar falhas de conversão
                }
            }
        }
        return returnedObject;
    }

    private static bool ColumnExists(DbDataReader reader, string columnName)
    {
        for (int i = 0; i < reader.FieldCount; i++)
        {
            if (reader.GetName(i).Equals(columnName, StringComparison.OrdinalIgnoreCase))
            {
                return true;
            }
        }
        return false;
    }
}
