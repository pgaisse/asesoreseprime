import { Navigate, Outlet } from "react-router-dom";
import { useAuth0 } from "@auth0/auth0-react";

type Props = {
  reqAuth: boolean;
};

function AuthorizedUsers({ reqAuth }: Props) {
  const { isLoading, isAuthenticated } = useAuth0();
  if (isLoading) return null;
  if (!isAuthenticated && reqAuth) {
    return <Navigate to="/" />;
  }
  return <Outlet />;
}

export default AuthorizedUsers;
