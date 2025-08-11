import React, { useEffect, useState } from 'react';
import { useAuth0 } from '@auth0/auth0-react';
import axios from 'axios';
import type { Auth0User } from '@/Types/Data';

// Hook personalizado
const useInsertUser = (
  user: Auth0User,
  isAuthenticated: boolean,
  userInserted: boolean,
  setUserInserted: (v: boolean) => void
) => {
  const { getAccessTokenSilently } = useAuth0();
  const [token, setToken] = useState<string | null>(null);

  useEffect(() => {
    const getToken = async () => {
      if (isAuthenticated) {
        const token = await getAccessTokenSilently({
          authorizationParams: {
            audience: import.meta.env.VITE_AUTH0_AUDIENCE,
          },
        });
        setToken(token);
      }
    };
    getToken();
  }, [getAccessTokenSilently, isAuthenticated]);

  useEffect(() => {
    const insertUser = async () => {
      try {
        if (user && isAuthenticated && !userInserted && token) {
          await axios.post(`${import.meta.env.VITE_APP_SERVER}/advisers`, {
            user
          }, {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          });
          setUserInserted(true);
        }
      } catch (err) {
        console.error("Error inserting user into MongoDB", err);
      }
    };

    insertUser();
  }, [user, isAuthenticated, userInserted, token, setUserInserted]);
};

// Componente principal
const Index = () => {
  const { user, isAuthenticated } = useAuth0();

  const role = user?.["https://letsmarter.com/roles"] || []

  const userWithRole: Auth0User = {
    email: user?.email ?? '', // Ensure email is always a string
    role: role[0] ?? null, // si hay varios roles, toma el primero
    email_verified: user?.email_verified ?? false, // Ensure email_verified is always boolean    
    family_name: user?.family_name ?? "",
    given_name: user?.given_name ?? "",
    name: user?.name ?? "",
    nickname: user?.nickname ?? "",
    org_id: user?.org_id ?? "",
    picture: user?.picture ?? "",
    sub: user?.sub ?? "",
    updated_at: user?.updated_at ?? ""
  };
  console.log("user", userWithRole)
  const [userInserted, setUserInserted] = useState(false);

  useInsertUser(userWithRole, isAuthenticated, userInserted, setUserInserted);

  return (
    <>
      <div>index</div>
    </>
  );
};

export default Index;
