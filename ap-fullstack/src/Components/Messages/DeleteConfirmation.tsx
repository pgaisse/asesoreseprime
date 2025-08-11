import {
  type AlertDialogProps,
  AlertDialog,
  AlertDialogBody,
  AlertDialogContent,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogOverlay,
  Button
} from '@chakra-ui/react'
import React, { type ReactNode } from 'react'

type Props = AlertDialogProps & {
  handleDelete: () => void
}

const DeleteConfirmation = ({ handleDelete, onClose, leastDestructiveRef, ...rest }: Props) => {
  // Create a ref specifically for the Cancel button
  const cancelRef = React.useRef<HTMLButtonElement>(null);

  return (
    <AlertDialog
      {...rest}
      onClose={onClose}
      leastDestructiveRef={cancelRef}
    >
      <AlertDialogOverlay>
        <AlertDialogContent>
          <AlertDialogHeader fontSize="lg" fontWeight="bold">
            Confirm Deletion
          </AlertDialogHeader>
          <AlertDialogBody>
            Are you sure you want to delete this item? This action cannot be undone.
          </AlertDialogBody>
          <AlertDialogFooter>
            <Button ref={cancelRef} onClick={onClose}>
              Cancel
            </Button>
            <Button colorScheme="red" onClick={handleDelete} ml={3}>
              Delete
            </Button>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialogOverlay>
    </AlertDialog>
  )
}

export default DeleteConfirmation
