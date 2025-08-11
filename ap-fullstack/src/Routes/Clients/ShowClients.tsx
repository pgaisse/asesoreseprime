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
import type { Auth0User, Auth0UserResponse, Case, Client, Incident, } from '@/Types/Data';
import type { RefetchOptions, QueryObserverResult } from '@tanstack/react-query';
import { formatDate } from '@/Functions/formatDate';
import { useInsertToCollection } from '@/Hooks/Query/useInsertToCollection';
import { useGetCollection } from '@/Hooks/Query/useGetCollection';
import CustomSelect from '@/Components/FormElements/CustomSelect';

type Props = {
    clientsWithCases: Case[];
    refetchCases?: (options?: RefetchOptions) => Promise<QueryObserverResult<any, Error>>;
    refetchNCases?: (options?: RefetchOptions) => Promise<QueryObserverResult<any, Error>>;
    refetchClientCases?: (options?: RefetchOptions) => Promise<QueryObserverResult<any, Error>>;
    exclude:boolean
};

function ShowClients({ clientsWithCases, exclude, refetchNCases, refetchCases, refetchClientCases }: Props) {
    const toast = useToast();
    // Estado individual por caso
    
    const insertMutation = useInsertToCollection<Case>("cases");
    const { data: dataIncidents, isFetching: isFetchingIncidents, isSuccess: isSuccessIncidents, error: errorIncidents, refetch: refetchIncidents } = useGetCollection<Incident>("Incident", {});
    const filter = Array.from(
        new Set(
            clientsWithCases
                .map(item => item.client)
                .filter(Boolean)
        )
    );

    const mongoQuery =exclude?{ _id: { $nin: filter } }: { _id: { $in: filter } };
    console.log("mongoQuery ", mongoQuery)

    const { data: clients, isFetching: isFetchingClient, isSuccess: isSuccessClient, error: errorClient, refetch: refetchClients } = useGetCollection<Client>(
        'Client',
        {
            mongoQuery,
            convertObjectId: true,
            limit: 20,
        }
    );
    console.log("clients", clients)
    const [selectedIncidentTypes, setSelectedIncidentTypes] = useState<Record<string, string>>({});

    const updateMutation = useUpdateItems();

    const handleIncidentTypeChange = (clientId: string, value: string) => {
        console.log("value", value)
        setSelectedIncidentTypes((prev) => ({
            ...prev,
            [clientId]: value,
        }));
    };
    const handleAssignClick = (clientId: string, incidentId: string) => {


        const payloadInsert = {
            status: "685ba691374f948c6f57bde1",           // campo obligatorio
            caseDate: new Date(),       // campo obligatorio
            client: clientId,           // asignas solo el cliente
            caseSectors: [],            // puedes dejar vacío
            numCase: "",                // opcional, o genera un número aq
            incident: incidentId,
        }

        insertMutation.mutate(payloadInsert, {
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
                if (refetchClientCases) refetchClientCases();
            },
        })
    }

    return (
        <>
            {!isFetchingClient &&
                isSuccessClient &&
                clients.map((item: Client, index: number) => {
                    const incidentTypeExists = dataIncidents?.some(
                        (incident) => (incident.incidentType === item.tipo_siniestros)
                    );
                    if (!item.numero_caso) return null;

                    return (
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
                                    </Box>

                                    <CustomCardHeader my={0}>
                                        <Text fontWeight="semibold" color="gray.700">
                                            {`${item.nombre} ${item.apellidos}`}
                                        </Text>
                                    </CustomCardHeader>

                                    <CustomCardBody>
                                        {item._id && (
                                            <HStack>
                                                <Text>ID:</Text>
                                                <Text fontWeight="normal">{item._id}</Text>
                                            </HStack>
                                        )}
                                        {item.rut && (
                                            <HStack>
                                                <Text>Rut:</Text>
                                                <Text fontWeight="normal">{item.rut}</Text>
                                            </HStack>
                                        )}

                                        {item.direccion && (
                                            <HStack>
                                                <Text>Dirección:</Text>
                                                <Text fontWeight="normal">
                                                    {item.direccion} {item.comuna ? item.comuna : ''}
                                                </Text>
                                            </HStack>
                                        )}

                                        {incidentTypeExists ? (
                                            <HStack>
                                                <Text>Tipo de siniestro:</Text>
                                                <Text fontWeight="normal">{item.tipo_siniestros}</Text>
                                            </HStack>
                                        ) : (
                                            <HStack align="center">
                                                <Text>Seleccione tipo de siniestro:</Text>
                                                <CustomSelect
                                                    onChange={(e) => handleIncidentTypeChange(item._id, e.target.value)}
                                                    placeholder="Seleccione una opción"
                                                    size="sm"
                                                    width="auto"
                                                    minW="200px"
                                                >
                                                    {dataIncidents?.map((incident, idx) => (
                                                        <option key={idx} value={incident._id}>
                                                            {incident.incidentType}
                                                        </option>
                                                    ))}
                                                </CustomSelect>
                                            </HStack>
                                        )}

                                        {item.created_at && (
                                            <HStack>
                                                <Text>Fecha de ingreso:</Text>
                                                <Text fontWeight="normal">{formatDate(item.created_at)}</Text>
                                            </HStack>
                                        )}

                                        {item.observaciones && (
                                            <HStack>
                                                <Text>Observaciones:</Text>
                                                <Text fontWeight="normal">{item.observaciones}</Text>
                                            </HStack>
                                        )}

                                        {item.estado && (
                                            <HStack>
                                                <Text>Estado:</Text>
                                                <Text fontWeight="normal">{item.estado}</Text>
                                            </HStack>
                                        )}

                                        {item.aseguradora && (
                                            <HStack>
                                                <Text>Aseguradora:</Text>
                                                <Text fontWeight="normal">{item.aseguradora}</Text>
                                            </HStack>
                                        )}

                                        <HStack>
                                            <Text>Numero de caso:</Text>
                                            <Text fontWeight="normal">{item.numero_caso}</Text>
                                        </HStack>

                                        <HStack mt={4} spacing={4}>
                                            <Button
                                                colorScheme="blue"
                                                variant="solid"
                                                isDisabled={
                                                    !incidentTypeExists &&
                                                    !selectedIncidentTypes[item._id]
                                                }
                                                onClick={() => {
                                                    const selectedIncidentId = incidentTypeExists
                                                        ? dataIncidents?.find(
                                                            (i) => i.incidentType === item.tipo_siniestros
                                                        )?._id
                                                        : selectedIncidentTypes[item._id];

                                                    handleAssignClick(item._id, selectedIncidentId ? selectedIncidentId : "");
                                                }}
                                            >
                                                Aceptar Caso
                                            </Button>
                                            <Button colorScheme="red" variant="outline">
                                                Eliminar
                                            </Button>
                                        </HStack>
                                    </CustomCardBody>
                                </CardGeneralView>
                            </Stack>
                        </React.Fragment>
                    );
                })}
        </>
    );


}

export default ShowClients;
