import { Text, Card, CardBody, CardHeader, Heading, Stack, type CardProps } from '@chakra-ui/react'
import React, { type ReactNode } from 'react'

type Props = CardProps & {
    children: ReactNode
}

function CardGeneralView({ children, ...rest }: Props) {
    return (
        <Card  {...rest}>
            {children}
        </Card>
    )
}

export default CardGeneralView