using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LacquaMessenger.Common.Extensions
{
    public static class TypeExtension
    {
        public static bool IsSubclassOfGenericClass(this Type generic, Type baseClass)
        {
            Type? baseClassToCheck = generic;

            if (baseClass != null)
            {
                do
                {
                    baseClassToCheck = baseClassToCheck?.BaseType?.IsGenericType == true ? baseClassToCheck.BaseType.GetGenericTypeDefinition() : baseClassToCheck?.BaseType;

                    if (baseClassToCheck == baseClass)
                        return true;
                }
                while (baseClassToCheck != null);
            }

            return false;
        }
    }
}
