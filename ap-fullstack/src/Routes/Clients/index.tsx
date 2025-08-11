
import { useGetCollection } from '@/Hooks/Query/useGetCollection';
import type { Case } from '@/Types/Data';
import React from 'react'
import ShowClients from './ShowClients';
import { Grid, GridItem } from '@chakra-ui/react';
import CustomTabs from '@/Components/CustomTabs';

type Props = {}

const index = (props: Props) => {
    const {
        data: clientsWithCases,
        isFetching: loadingDistinct,
        refetch: refetchClientCases
    } = useGetCollection<Case>('Case',
        {
            query: { client: { $ne: null } },
            projection: { _id: 0, client: 1 }
        }
    );

    console.log("clientsWithCases", clientsWithCases);
    return (
        <>
            <Grid
                templateAreas={`"assigned Nassigned"`}
                templateColumns={{
                    base: "1fr",       // Móvil
                    md: "repeat(1, 1fr)", // Tablet
                    lg: "repeat(1, 1fr)"  // Desktop
                }}
                templateRows={"1fr"}>
                <GridItem area={"assigned"}>
                    <CustomTabs tabData={[
                        {
                            label: "Clientes en proceso",
                            content: (<ShowClients exclude={false}
                                clientsWithCases={clientsWithCases ? clientsWithCases : []} refetchClientCases={refetchClientCases} />)
                        },
                        {
                            label: "Clientes sin procesar",
                            content: (<ShowClients exclude={true}
                                clientsWithCases={clientsWithCases ? clientsWithCases : []} refetchClientCases={refetchClientCases} />)
                        }
                    ]

                    }

                    />

                </GridItem>


            </Grid>

        </>
    )

}

export default index