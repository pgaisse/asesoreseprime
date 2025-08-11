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
  useToast
} from '@chakra-ui/react';
import React, { useState } from 'react';
import CardGeneralView from '@/Components/Cards/CardGeneralView';
import CustomCardHeader from '@/Components/Cards/CustomCardHeader';
import CustomCardBody from '@/Components/Cards/CustomCardBody';
import CustomSelect from '@/Components/FormElements/CustomSelect';
import type { Auth0UserResponse, Case } from '@/Types/Data';
import type { RefetchOptions, QueryObserverResult } from '@tanstack/react-query';
import type { User } from '@auth0/auth0-react';

type Props = {
  cases: Case[];
  isFetching: boolean;
  isSuccess: boolean;
  error: Error | null;
  assigned: boolean;
  asesors?: User[];
  refetchCases?: (options?: RefetchOptions) => Promise<QueryObserverResult<any, Error>>;
  refetchNCases?: (options?: RefetchOptions) => Promise<QueryObserverResult<any, Error>>;
  refetchClients?: (options?: RefetchOptions) => Promise<QueryObserverResult<any, Error>>;
};

function AssignedCases({ cases, isFetching, isSuccess, asesors, refetchNCases, refetchCases, refetchClients }: Props) {
  const { mutate } = useUpdateItems();
  const toast = useToast();
  // Estado individual por caso
  const [selectedAdvisers, setSelectedAdvisers] = useState<Record<string, string>>({});



  const handleSelectChange = (id_case: string, email: string) => {
    setSelectedAdvisers(prev => ({ ...prev, [id_case]: email }));
  };

  const handleAssignClick = (id_case: string) => {
    const id_adviser = selectedAdvisers[id_case];
    if (!id_adviser) return;
    const payload = {
      table: "cases",      // tu tabla
      id_field: "id_case",      // campo PK
      id_value: id_case,   // valor PK
      data: {
        id_adviser: id_adviser,  // campos a actualizar
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
        if (refetchClients) refetchClients()
      },
    })
  }
  if (!Array.isArray(cases) || cases.length === 0) {
    return (
      <Box py={2}>
        <Stack spacing={3}>
          <Alert status='info'>
            <AlertIcon />
            No se han registrado casos
          </Alert>
        </Stack>
      </Box>
    );
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

                  {item.adviser ? (
                    <HStack>
                      <Text>Asesor:</Text>
                      <Tag bg="blue.100">
                        <Text fontWeight="normal">
                          {item.adviser.adviserName}
                        </Text>
                      </Tag>
                    </HStack>
                  ) : asesors && asesors[0]?.data?.length > 0 ? (
                    <HStack>
                      <Text>Asignar asesor:</Text>
                      <CustomSelect
                        height="auto"
                        width="fit-content"
                        onChange={e => handleSelectChange(item._id, e.target.value)}
                        value={selectedAdvisers[item._id] || ''}
                      >
                        <option value="" disabled>
                          Selecciona un asesor
                        </option>
                        {asesors[0].data.map((asesor: User) => (
                          <option key={asesor.user_id} value={asesor.user_id}>
                            {asesor.name}
                          </option>
                        ))}
                      </CustomSelect>
                    </HStack>
                  ) : (
                    <Alert status="error">
                      <AlertIcon />
                      <AlertTitle>Asesor Eliminado!</AlertTitle>
                      <AlertDescription>El asesor asignado a este caso fue eliminado.</AlertDescription>
                    </Alert>
                  )}

                  <HStack mt={4} spacing={4}>
                    {item.adviser && item.adviser._id ? (
                      <Button colorScheme="blue" variant="solid">
                        Ingresar
                      </Button>
                    ) : (
                      <Button
                        colorScheme="blue"
                        variant="solid"
                        isDisabled={!selectedAdvisers[item._id]}
                        onClick={() => handleAssignClick(item._id)}
                      >
                        Asignar
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
  );
}

export default AssignedCases;
