import { CardBody, type CardBodyProps } from '@chakra-ui/react'
import React, { type ReactNode } from 'react'

type Props = CardBodyProps & {
    children: ReactNode
}

function CustomCardBody({ children, ...rest }: Props) {
    return (
        <CardBody {...rest}>
            {children}
        </CardBody>
    )
}

export default CustomCardBody