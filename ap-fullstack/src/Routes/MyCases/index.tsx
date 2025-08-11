
import { useGetCollection } from '@/Hooks/Query/useGetCollection';
import type { Adviser } from '@/Types/Data';
import { useAuth0 } from '@auth0/auth0-react';
import MyCases from './Mycases';

type Props = {}

const index = (props: Props) => {

    const { user, isAuthenticated } = useAuth0();
    const query = { adviserSub: user?.sub }; // condición de búsqueda
    console.log("user", user)
    const limit = 20;

    const { data: id, isFetching: isFetchingId, isSuccess: isSuccessId, error: errorId, refetch: refetchId } = useGetCollection<Adviser>("Adviser", {

        query: { adviserSub: user?.sub }
        ,
        limit: 20,
    });
    const idAdv=id?id[0]._id:""
    console.log(idAdv)
    return (
        <>
            <MyCases _id={idAdv}/>
        </>
    )
}


export default index
