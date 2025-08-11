import { useQuery } from "@tanstack/react-query";
import axios from "axios";
import { useAuth0 } from "@auth0/auth0-react";
import { useEffect, useState } from "react";

// Tipado opcional para los filtros
type CollectionFilters = {
  mongoQuery?: Record<string, any>;
  convertObjectId?: boolean;
  [key: string]: any; // permite otros parámetros como limit, populate, etc.
};

// Función genérica para obtener datos de cualquier colección
const fetchCollection = async function <T>(
  collection: string,
  token: string,
  filters: CollectionFilters = {}
): Promise<T[]> {
  const { mongoQuery, convertObjectId, ...rest } = filters;

  const finalParams: Record<string, any> = {
    ...rest,
    ...(mongoQuery ? { query: JSON.stringify(mongoQuery) } : {}),
    ...(convertObjectId ? { convertObjectId: true } : {})
  };

  console.log("🔍 Axios params:", finalParams);

  const res = await axios.get(`${import.meta.env.VITE_APP_SERVER}/${collection}`, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
    params: finalParams,
  });

  return res.data;
};

// Hook genérico con soporte de Auth0 y filtros avanzados
export const useGetCollection = <T = unknown>(
  collection: string,
  filters: CollectionFilters = {}
) => {
  const { getAccessTokenSilently, isAuthenticated } = useAuth0();
  const [token, setToken] = useState<string | null>(null);

  useEffect(() => {
    const getToken = async () => {
      if (isAuthenticated) {
        const newToken = await getAccessTokenSilently({
          authorizationParams: {
            audience: import.meta.env.VITE_AUTH0_AUDIENCE,
          },
        });
        setToken(newToken);
      }
    };
    getToken();
  }, [getAccessTokenSilently, isAuthenticated]);

  return useQuery<T[]>({
    queryKey: [collection, filters],
    queryFn: async () => fetchCollection<T>(collection, token!, filters),
    enabled: !!token,
    refetchOnWindowFocus: false,
  });
};
