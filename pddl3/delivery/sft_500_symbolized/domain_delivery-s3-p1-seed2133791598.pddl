
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_2 - object
        type_3 - type_2
        type_4 - type_2
    )

    (:predicates
        (pred_5 ?v4 - type_2 ?v3 - type_1)
        (pred_3 ?v4 - type_4 ?v3 - type_3)
        (pred_4 ?v4 - type_4)
        (pred_2 ?v4 - type_1 ?v3 - type_1)
          (pred_1 ?v1 - type_4 ?v6 - type_1)   
    )

    (:action op_2
     :parameters (?v1 - type_4 ?v5 - type_3 ?v7 - type_1)
     :precondition (and (pred_5 ?v5 ?v7) (pred_5 ?v1 ?v7) (pred_4 ?v1))
     :effect (and
        (not (pred_5 ?v5 ?v7))
        (not (pred_4 ?v1))
        (pred_3 ?v1 ?v5))
    )

    (:action op_3
     :parameters (?v1 - type_4 ?v5 - type_3 ?v7 - type_1)
     :precondition (and (pred_5 ?v1 ?v7) (pred_3 ?v1 ?v5))
     :effect (and
        (pred_4 ?v1)
        (not (pred_3 ?v1 ?v5))
        (pred_5 ?v5 ?v7))
    )

    (:action op_1
     :parameters (?v1 - type_4 ?v2 - type_1 ?v8 - type_1)
     :precondition (and (pred_2 ?v2 ?v8) (pred_5 ?v1 ?v2) (not (= ?v2 ?v8)))
     :effect (and
        (not (pred_5 ?v1 ?v2))
        (pred_5 ?v1 ?v8)
        (pred_1 ?v1 ?v2))
        )
        
    )
)
