import { useGetCases } from '@/Hooks/Query/useGetCases';
import AssignedCases from './AssignedCases';
import { Grid, GridItem } from '@chakra-ui/react';
import CustomTabs from '@/Components/CustomTabs';
import { useGetUsers } from '@/Hooks/Query/useGetUsers';
import ShowClients from '../Clients/ShowClients';
import type { Adviser, Case, Client } from '@/Types/Data';
import { useGetCollection } from '@/Hooks/Query/useGetCollection';
import type { User } from '@auth0/auth0-react';
import NoAssignedCases from './NoAssignedCases';
import React from 'react';
type Props = {}

function index({ }: Props) {

  /////////////////////////// //Preparación parámetro de consultas
  const populateFields = [
    { path: "adviser", select: "adviserName adviserEmail adviserRut" },
    { path: "client", select: "nombre apellidos email rut direccion" },
    { path: "incident", select: "incidentCode incidentType" },
    { path: "status", select: "statusName statusDescription" },
  ];

  const queryAdvisers = {
    adviser: { $exists: true, $nin: [null] }
  };

  const queryNoAdvisers = {
    $or: [
      { adviser: { $exists: false } },
      { adviser: null }
    ]
  };





  const limit = 20;

  const { data: dataCases, isFetching: isFetchingCases, isSuccess: isSuccessCases, error: errorCases, refetch: refetchCases } = useGetCollection<Case>("Case", { query: queryAdvisers, populate: populateFields, limit });

  console.log("dataCases,", dataCases);

  const { data: dataNCases, isFetching: isFetchingNCases, isSuccess: isSuccessNCases, error: errorNCases, refetch: refetchNCases } = useGetCollection<Case>("Case", { query: queryNoAdvisers, populate: populateFields, limit });
  
  if (!dataCases) return null // o un loader
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
              label: "Casos asignados",
              content: (<AssignedCases
                {...{ isFetching: isFetchingCases, isSuccess: isSuccessCases, error: errorCases }}
                cases={dataCases} assigned={true} refetchCases={refetchCases} refetchNCases={refetchNCases}  />)
            },
            {
              label: "Casos no asignados",
              content: (<NoAssignedCases
                {...{ isFetching: isFetchingNCases, isSuccess: isSuccessNCases, error: errorNCases, refetchCases }}
                cases={dataNCases ? dataNCases : []} refetchCases={refetchCases} refetchNCases={refetchNCases} />)
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