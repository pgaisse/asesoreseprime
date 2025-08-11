import CardGeneralView from '@/Components/Cards/CardGeneralView';
import CustomCardBody from '@/Components/Cards/CustomCardBody';
import CustomCardHeader from '@/Components/Cards/CustomCardHeader';
import { useGetCollection } from '@/Hooks/Query/useGetCollection';
import type { Case } from '@/Types/Data';
import { Box,  Button,  CloseButton,  HStack,  Stack,  Tag,  Text} from '@chakra-ui/react';
import React from 'react';

type Props = {
    _id: string
}


const MyCases = ({_id}: Props) => {

    const populateFields = [
        { path: "adviser", select: "adviserName adviserEmail adviserRut" },
        { path: "client", select: "nombre apellidos email rut direccion" },
        { path: "incident", select: "incidentCode incidentType" },
        { path: "status", select: "statusName statusDescription" },
    ];



      const mongoQuery ={adviser:_id}  ;
  

    const {  data: cases, isFetching: isFetchingCases, isSuccess: isSuccessCases, error: errorCases, refetch: refetchCases } = useGetCollection<Case>(
        'Case',
        {
            mongoQuery,
            convertObjectId: true,
            limit: 20,
            populate:populateFields
        }
    );
    console.log("cases",cases)
    return (
        <>
             {!isFetchingCases &&
        isSuccessCases &&
        cases.map((item: Case, index: number) => (
          <React.Fragment key={`${item._id}-${index}`}>
            <Stack spacing={4} my={1}>
              <CardGeneralView>
                <Box position="relative">
                  <CloseButton
                    position="absolute"
                    top="8px"
                    right="8px"
                    onClick={() => console.log('Cerrar card con ID:', item._id)}
                  />
                  <CustomCardHeader my={0}>
                    <Text fontWeight="semibold" color="gray.700">
                      {`${item.client.nombre} ${item.client.apellidos}`}
                    </Text>
                  </CustomCardHeader>
                </Box>
                <CustomCardBody>
                  {item.client && item.client.rut &&
                    <HStack>
                      <Text>Rut Cliente:</Text>
                      <Text fontWeight="normal">{item.client.rut}</Text>
                    </HStack>}
                  {item.client && item.client.direccion &&
                    <HStack>
                      <Text>Dirección:</Text>
                      <Text fontWeight="normal">{item.client.direccion}</Text>
                    </HStack>}
                  {item.incident && item.incident.incidentType &&
                    <HStack>
                      <Text>Tipo de Siniestro:</Text>
                      <Text fontWeight="normal">{item.incident.incidentType}</Text>
                    </HStack>}

                  {item.adviser && (
                    <HStack>
                      <Text>Asesor:</Text>
                      <Tag bg="blue.100">
                        <Text fontWeight="normal">
                          {item.adviser.adviserName}
                        </Text>
                      </Tag>
                    </HStack>
                  ) }

                  <HStack mt={4} spacing={4}>
                    {item.adviser && item.adviser._id && (
                      <Button colorScheme="blue" variant="solid">
                        Ingresar
                      </Button>
                    )}

                    <Button colorScheme="red" variant="outline">
                      Eliminar
                    </Button>
                  </HStack>
                </CustomCardBody>
              </CardGeneralView>
            </Stack>
          </React.Fragment>
        ))}
        </>
    )
}

export default MyCases