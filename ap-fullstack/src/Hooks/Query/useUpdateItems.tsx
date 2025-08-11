import {
  useMutation,
  useQueryClient,
} from "@tanstack/react-query";
import axios from "axios";
import { useAuth0 } from "@auth0/auth0-react";

type UpdatePayload = {
  table: string;
  id_field: string;
  id_value: any;
  data: { [key: string]: any };
};

const updateItems = async ({
  payload,
  token,
}: {
  payload: UpdatePayload;
  token: string;
}) => {
  const res = await axios.patch(
    `${import.meta.env.VITE_APP_SERVER}/update-items`,
    payload,
    {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    }
  );
  return res.data;
};

export const useUpdateItems = () => {
  const queryClient = useQueryClient();
  const { getAccessTokenSilently, isAuthenticated } = useAuth0();

  const mutation = useMutation({
    mutationFn: async (payload: UpdatePayload) => {
      if (!isAuthenticated) throw new Error("Usuario no autenticado");

      const token = await getAccessTokenSilently({
        authorizationParams: {
          audience: import.meta.env.VITE_AUTH0_AUDIENCE,
        },
      });

      return await updateItems({ payload, token });
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["items"] });
    },
  });

  return mutation;
};
