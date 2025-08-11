import axios from "axios";
import { useAuth0 } from "@auth0/auth0-react";
import { useEffect, useState } from "react";

type DeleteParams = {
  collection: string;
  id: string;
};

export const useDeleteDocument = () => {
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
        setToken(token);
      }
    };
    getToken();
  }, [getAccessTokenSilently, isAuthenticated]);

  const deleteDocument = async ({ collection, id }: DeleteParams) => {
    if (!token) throw new Error("Token no disponible");

    const res = await axios.delete(
      `${import.meta.env.VITE_APP_SERVER}/${collection}/${id}`,
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );

    return res.data;
  };

  return { deleteDocument, token };
};
