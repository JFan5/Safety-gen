
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_3 - object
        type_1 - type_3
        type_4 - type_3
    )

    (:predicates
        (pred_1 ?v3 - type_3 ?v4 - type_2)
        (pred_2 ?v3 - type_4 ?v4 - type_1)
        (pred_5 ?v3 - type_4)
        (pred_3 ?v3 - type_2 ?v4 - type_2)
          (pred_4 ?v5 - type_4 ?v6 - type_2)   
    )

    (:action op_2
     :parameters (?v5 - type_4 ?v1 - type_1 ?v2 - type_2)
     :precondition (and (pred_1 ?v1 ?v2) (pred_1 ?v5 ?v2) (pred_5 ?v5))
     :effect (and
        (not (pred_1 ?v1 ?v2))
        (not (pred_5 ?v5))
        (pred_2 ?v5 ?v1))
    )

    (:action op_1
     :parameters (?v5 - type_4 ?v1 - type_1 ?v2 - type_2)
     :precondition (and (pred_1 ?v5 ?v2) (pred_2 ?v5 ?v1))
     :effect (and
        (pred_5 ?v5)
        (not (pred_2 ?v5 ?v1))
        (pred_1 ?v1 ?v2))
    )

    (:action op_3
     :parameters (?v5 - type_4 ?v7 - type_2 ?v8 - type_2)
     :precondition (and (pred_3 ?v7 ?v8) (pred_1 ?v5 ?v7) (not (= ?v7 ?v8)))
     :effect (and
        (not (pred_1 ?v5 ?v7))
        (pred_1 ?v5 ?v8)
        (pred_4 ?v5 ?v7))
        )
        
    )
)
