import { useQuery } from "@tanstack/react-query";
import axios from "axios";
import { useAuth0 } from "@auth0/auth0-react";
import { useEffect, useState } from "react";
import type { Auth0UserResponse } from "@/Types/Data";

const fetchUsers = async (token: string) => {
  const res = await axios.get(`${import.meta.env.VITE_APP_SERVER}/users`, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
    params: {
    },
  });

  return res.data;
};

export const useGetUsers = () => {
  const { getAccessTokenSilently, isAuthenticated } = useAuth0();
  const [token, setToken] = useState<string | null>(null);

  useEffect(() => {
    const getToken = async () => {
      if (isAuthenticated) {
        const token = await getAccessTokenSilently({
          authorizationParams: {
            audience: import.meta.env.VITE_AUTH0_AUDIENCE,
          },
        });
        //console.log("Token obtenido:", token);
        setToken(token);
      }
    };
    getToken();
  }, [getAccessTokenSilently, isAuthenticated]);

  return useQuery<Auth0UserResponse[]>({
    queryKey: ["users"],
    queryFn: () => fetchUsers(token!,),
    enabled: !!token, // <- Solo ejecuta cuando hay token
    refetchOnWindowFocus: false,
  });
};
