import { useQuery } from "@tanstack/react-query";
import axios from "axios";
import { useAuth0 } from "@auth0/auth0-react";
import { useEffect, useState } from "react";
import type { Case} from "@/Types/Data";

const fetchCases = async (token: string) => {
  const res = await axios.get(`${import.meta.env.VITE_APP_SERVER}/cases`, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
    params: {
    },
  });

  return res.data;
};

export const useGetCases = () => {
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

  return useQuery<Case[]>({
    queryKey: ["cases"],
    queryFn: () => fetchCases(token!,),
    enabled: !!token, // <- Solo ejecuta cuando hay token
    refetchOnWindowFocus: false,
  });
};
