import { useUpdateItems } from '@/Hooks/Query/useUpdateItems';
import {
  Text,
  Alert,
  AlertDescription,
  AlertIcon,
  AlertTitle,
  Box,
  Button,
  CloseButton,
  HStack,
  Stack,
  Tag,
  useToast,
  Select
} from '@chakra-ui/react';
import React, { useState } from 'react';
import CardGeneralView from '@/Components/Cards/CardGeneralView';
import CustomCardHeader from '@/Components/Cards/CustomCardHeader';
import CustomCardBody from '@/Components/Cards/CustomCardBody';
import CustomSelect from '@/Components/FormElements/CustomSelect';
import type { Adviser, Case } from '@/Types/Data';
import type { RefetchOptions, QueryObserverResult } from '@tanstack/react-query';
import type { User } from '@auth0/auth0-react';
import { useGetCollection } from '@/Hooks/Query/useGetCollection';

type Props = {
  cases: Case[];
  isFetching: boolean;
  isSuccess: boolean;
  error: Error | null;
  refetchCases?: (options?: RefetchOptions) => Promise<QueryObserverResult<any, Error>>;
  refetchNCases?: (options?: RefetchOptions) => Promise<QueryObserverResult<any, Error>>;
};

function AssignedCases({ cases, isFetching, isSuccess, refetchCases, refetchNCases }: Props) {

  const { data: advisers, isFetching: _isFetchingadvisers, isSuccess: _isSuccessadvisers, error: _erroradvisers } = useGetCollection<Adviser>("Adviser", { query: {}, populate: {}, limit: 100 });
  //console.log("advisers", JSON.stringify(advisers))
  const { mutate } = useUpdateItems();
  const toast = useToast();
  const [selectedAdvisers, setSelectedAdvisers] = useState<Record<string, string>>({});



  const handleSelectChange = (id_case: string, email: string) => {
    setSelectedAdvisers(prev => ({ ...prev, [id_case]: email }));
  };

  const handleAssignClick = (id_case: string) => {
    const id_adviser = selectedAdvisers[id_case];
    if (!id_adviser) return;
    const payload = {
      table: "Case",      // tu tabla
      id_field: "_id",      // campo PK
      id_value: id_case,   // valor PK
      data: {
        adviser: id_adviser,  // campos a actualizar
      },
    };

    mutate(payload, {
      onSuccess: () => {
        toast({
          title: "Caso asignado.",
          description: "Asesor asignado correctamente.",
          status: "success",
          duration: 3000,
          isClosable: true,
        });
        if (refetchCases) refetchCases()
        if (refetchNCases) refetchNCases()
      },
    })
  }

  return (
    <>
      {!isFetching &&
        isSuccess &&
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


                  {advisers &&
                    <HStack>
                      <Text>Asesor</Text>
                      <CustomSelect
                        placeholder="Selecciona un asesor"
                        onChange={(e) => handleSelectChange(item._id, e.target.value)}
                        value={selectedAdvisers[item._id] || ""} // Para mantener el valor seleccionado
                      >
                        {advisers.map((item, index) => (
                          <option key={index} value={item._id}>
                            {item.adviserName}
                          </option>
                        ))}
                      </CustomSelect>
                    </HStack>}


                  <HStack mt={4} spacing={4}>
                    <Button
                      colorScheme="blue"
                      variant="solid"

                      onClick={() => handleAssignClick(item._id)}
                    >
                      Asignar
                    </Button>

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
  );
}

export default AssignedCases;
