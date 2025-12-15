
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_4 - object
        type_3 - type_4
        type_1 - type_4
    )

    (:predicates
        (pred_3 ?v4 - type_4 ?v1 - type_2)
        (pred_1 ?v4 - type_1 ?v1 - type_3)
        (pred_4 ?v4 - type_1)
        (pred_2 ?v4 - type_2 ?v1 - type_2)
          (pred_5 ?v7 - type_1 ?v6 - type_2)   
    )

    (:action op_3
     :parameters (?v7 - type_1 ?v5 - type_3 ?v3 - type_2)
     :precondition (and (pred_3 ?v5 ?v3) (pred_3 ?v7 ?v3) (pred_4 ?v7))
     :effect (and
        (not (pred_3 ?v5 ?v3))
        (not (pred_4 ?v7))
        (pred_1 ?v7 ?v5))
    )

    (:action op_1
     :parameters (?v7 - type_1 ?v5 - type_3 ?v3 - type_2)
     :precondition (and (pred_3 ?v7 ?v3) (pred_1 ?v7 ?v5))
     :effect (and
        (pred_4 ?v7)
        (not (pred_1 ?v7 ?v5))
        (pred_3 ?v5 ?v3))
    )

    (:action op_2
     :parameters (?v7 - type_1 ?v2 - type_2 ?v8 - type_2)
     :precondition (and (pred_2 ?v2 ?v8) (pred_3 ?v7 ?v2) (not (= ?v2 ?v8)))
     :effect (and
        (not (pred_3 ?v7 ?v2))
        (pred_3 ?v7 ?v8)
        (pred_5 ?v7 ?v2))
        )
        
    )
)
