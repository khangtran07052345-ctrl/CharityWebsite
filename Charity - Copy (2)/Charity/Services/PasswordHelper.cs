using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

namespace Charity.Services
{
    public class PasswordHelper
    {
        
       
            private const int SaltSize = 16;
            private const int HashSize = 32;
            private const int Iterations = 10000;
            private const string Prefix = "PBKDF2$";

            // Băm mật khẩu -> PBKDF2$lần$salt$hash
            public static string Hash(string password)
            {
                byte[] salt = new byte[SaltSize];
                using (var rng = new RNGCryptoServiceProvider())
                    rng.GetBytes(salt);

                byte[] hash;
                using (var pbkdf2 = new Rfc2898DeriveBytes(password, salt, Iterations))
                    hash = pbkdf2.GetBytes(HashSize);

                return Prefix + Iterations + "$" +
                       Convert.ToBase64String(salt) + "$" +
                       Convert.ToBase64String(hash);
            }

            public static bool IsHashed(string stored)
            {
                return !string.IsNullOrEmpty(stored) && stored.StartsWith(Prefix);
            }

            public static bool Verify(string password, string stored)
            {
                if (string.IsNullOrEmpty(stored)) return false;

                // Tài khoản cũ chưa băm: so sánh trực tiếp (sẽ được băm lại khi đăng nhập)
                if (!IsHashed(stored)) return password == stored;

                string[] parts = stored.Split('$');
                int iterations = int.Parse(parts[1]);
                byte[] salt = Convert.FromBase64String(parts[2]);
                byte[] expected = Convert.FromBase64String(parts[3]);

                byte[] actual;
                using (var pbkdf2 = new Rfc2898DeriveBytes(password, salt, iterations))
                    actual = pbkdf2.GetBytes(expected.Length);

                int diff = 0;
                for (int i = 0; i < expected.Length; i++)
                    diff |= expected[i] ^ actual[i];
                return diff == 0;
            }
        
    }
}
