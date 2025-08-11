import { isRouteErrorResponse, useRouteError } from "react-router-dom";

type Props = {};

function ErrorDetail({}: Props) {
  const error = useRouteError();

  console.log(error);
  return (
    <div>
      {isRouteErrorResponse(error)
        ? "La pagina no existe"
        : (error as Error).message}
    </div>
  );
}

export default ErrorDetail;
