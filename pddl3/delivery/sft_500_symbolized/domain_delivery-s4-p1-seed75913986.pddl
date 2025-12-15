
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_3 - object
        type_2 - type_3
        type_4 - type_3
    )

    (:predicates
        (pred_1 ?v6 - type_3 ?v8 - type_1)
        (pred_2 ?v6 - type_4 ?v8 - type_2)
        (pred_3 ?v6 - type_4)
        (pred_4 ?v6 - type_1 ?v8 - type_1)
          (pred_5 ?v7 - type_4 ?v3 - type_1)   
    )

    (:action op_3
     :parameters (?v7 - type_4 ?v2 - type_2 ?v5 - type_1)
     :precondition (and (pred_1 ?v2 ?v5) (pred_1 ?v7 ?v5) (pred_3 ?v7))
     :effect (and
        (not (pred_1 ?v2 ?v5))
        (not (pred_3 ?v7))
        (pred_2 ?v7 ?v2))
    )

    (:action op_1
     :parameters (?v7 - type_4 ?v2 - type_2 ?v5 - type_1)
     :precondition (and (pred_1 ?v7 ?v5) (pred_2 ?v7 ?v2))
     :effect (and
        (pred_3 ?v7)
        (not (pred_2 ?v7 ?v2))
        (pred_1 ?v2 ?v5))
    )

    (:action op_2
     :parameters (?v7 - type_4 ?v1 - type_1 ?v4 - type_1)
     :precondition (and (pred_4 ?v1 ?v4) (pred_1 ?v7 ?v1) (not (= ?v1 ?v4)))
     :effect (and
        (not (pred_1 ?v7 ?v1))
        (pred_1 ?v7 ?v4)
        (pred_5 ?v7 ?v1))
        )
        
    )
)
