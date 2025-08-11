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
    Select,
    useDisclosure,
    Avatar,
    Flex
} from '@chakra-ui/react';
import React, { useRef, useState } from 'react';
import CardGeneralView from '@/Components/Cards/CardGeneralView';
import CustomCardHeader from '@/Components/Cards/CustomCardHeader';
import CustomCardBody from '@/Components/Cards/CustomCardBody';
import type { Adviser, Auth0User, Auth0UserResponse, Case, Client, Incident, } from '@/Types/Data';
import { formatDate } from '@/Functions/formatDate';
import { useInsertToCollection } from '@/Hooks/Query/useInsertToCollection';
import { useGetCollection } from '@/Hooks/Query/useGetCollection';
import CustomSelect from '@/Components/FormElements/CustomSelect';
import { useDeleteDocument } from '@/Hooks/Query/useDeleteDocument';
import DeleteConfirmation from '@/Components/Messages/DeleteConfirmation';

type Props = {

};

function AhowAdvisers({ }: Props) {
    const toast = useToast();
    // Estado individual por caso
    const { isOpen, onOpen, onClose } = useDisclosure();
    const { deleteDocument, } = useDeleteDocument();
    const [itemToDelete, setItemToDelete] = useState<string>("");
    const cancelRef = useRef<HTMLButtonElement>(null);

    const mongoQuery = {}

    const { data: Advisers, isFetching: isFetchingAdvisers, isSuccess: isSuccessAdvisers, error: errorAdvisers, refetch: refetchAdvisers } = useGetCollection<Adviser>(
        'Adviser',
        {
            mongoQuery,
            convertObjectId: false,
            limit: 20,
        }
    );
    console.log("Advisers", Advisers)
    const [selectedIncidentTypes, setSelectedIncidentTypes] = useState<Record<string, string>>({});


    const handleIncidentTypeChange = (clientId: string, value: string) => {
        console.log("value", value)
        setSelectedIncidentTypes((prev) => ({
            ...prev,
            [clientId]: value,
        }));
    };



    const confirmDelete = (id: string) => {
        setItemToDelete(id);
        onOpen();
    };

    const handleDelete = async () => {
        if (deleteDocument && itemToDelete) {
            try {
                const result = await deleteDocument({ collection: "Adviser", id: itemToDelete });
                if (refetchAdvisers) refetchAdvisers();
                console.log(result);
            } catch (error: any) {
                console.error(error);
            }
        }
        onClose();
    };
    return (
        <>
            {!isFetchingAdvisers &&
                isSuccessAdvisers &&
                Advisers.map((item: Adviser, index: number) => {

                    return (
                        <React.Fragment key={`${item._id}-${index}`}>
                            <Stack spacing={4} my={1}>
                                <CardGeneralView>
                                    <Box position="relative">
                                        <CloseButton
                                            position="absolute"
                                            onClick={() => confirmDelete(item._id)}
                                            top="8px"
                                            right="8px"
                                        />
                                    </Box>

                                    <Flex direction="row" align="center" gap={6} m={5}>
                                        <Avatar
                                            size="2xl"
                                            src={`${item.adviserPicture}`}
                                            pos="relative"
                                            _after={{
                                                content: '""',
                                                w: 4,
                                                h: 4,
                                                bg: 'green.300',
                                                border: '2px solid white',
                                                rounded: 'full',
                                                pos: 'absolute',
                                                bottom: 0,
                                                right: 3,
                                            }}
                                        />

                                        <Box flex="1">
                                            <CustomCardHeader  >
                                                <Text fontWeight="semibold" fontSize="xl" color="gray.700">
                                                    {`${item.adviserName} ${item.adviserLastname}`}
                                                </Text>
                                            </CustomCardHeader>

                                            <CustomCardBody>
                                                {item._id && (
                                                    <HStack>
                                                        <Text>ID:</Text>
                                                        <Text fontWeight="normal">{item._id}</Text>
                                                    </HStack>
                                                )}
                                                {item.adviserEmail && (
                                                    <HStack>
                                                        <Text>Email:</Text>
                                                        <Text fontWeight="normal">{item.adviserEmail}</Text>
                                                    </HStack>
                                                )}
                                                {item.adviserRole && (
                                                    <HStack>
                                                        <Text>Rol:</Text>
                                                        <Text fontWeight="normal">{item.adviserRole}</Text>
                                                    </HStack>
                                                )}
                                                {item.adviserUsername && (
                                                    <HStack>
                                                        <Text>Usuario:</Text>
                                                        <Text fontWeight="normal">{item.adviserUsername}</Text>
                                                    </HStack>
                                                )}
                                                <HStack>
                                                    <Text>Rut:</Text>
                                                    <Text fontWeight="normal">{item.adviserRut ? item.adviserRut : "N/A"}</Text>
                                                </HStack>


                                                <HStack>
                                                    <Text>Teléfono:</Text>
                                                    <Text fontWeight="normal">{item.adviserPhone || "N/A"}</Text>
                                                </HStack>

                                                {item.registeredAt && (
                                                    <HStack>
                                                        <Text>Ingresado en:</Text>
                                                        <Text fontWeight="normal">{formatDate(item.registeredAt)}</Text>
                                                    </HStack>
                                                )}

                                            </CustomCardBody>
                                        </Box>
                                    </Flex>
                                </CardGeneralView>
                            </Stack>
                        </React.Fragment>

                    );
                })}
            <DeleteConfirmation handleDelete={handleDelete} isOpen={isOpen} onClose={onClose} leastDestructiveRef={cancelRef} children={undefined} />
        </>
    );


}

export default AhowAdvisers;
