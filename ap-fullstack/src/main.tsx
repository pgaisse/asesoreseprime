import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { RouterProvider } from "react-router-dom";
import { Auth0Provider } from "@auth0/auth0-react";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { ChakraProvider } from '@chakra-ui/react'
import router from "./Routes/App";

const queryClient = new QueryClient();
createRoot(document.getElementById("root")!).render(
  <StrictMode>

    <ChakraProvider >
      <QueryClientProvider client={queryClient}>
        <Auth0Provider
          domain={`${import.meta.env.VITE_APP_AUTH0_DOMAIN}`}
          clientId={`${import.meta.env.VITE_APP_AUTH0_CLIENTID}`}
          authorizationParams={{
            redirect_uri: `${import.meta.env.VITE_AUTH0_CALLBACK_URL}`,
            audience: `${import.meta.env.VITE_AUTH0_AUDIENCE}`,
          }}
          useRefreshTokens={true}
          cacheLocation="localstorage"
        >

          <RouterProvider router={router} />
        </Auth0Provider>
      </QueryClientProvider>
    </ChakraProvider>

  </StrictMode>
);
