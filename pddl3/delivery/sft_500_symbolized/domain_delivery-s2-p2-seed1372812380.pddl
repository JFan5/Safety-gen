
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_4 - object
        type_3 - type_4
        type_1 - type_4
    )

    (:predicates
        (pred_2 ?v4 - type_4 ?v1 - type_2)
        (pred_1 ?v4 - type_1 ?v1 - type_3)
        (pred_4 ?v4 - type_1)
        (pred_5 ?v4 - type_2 ?v1 - type_2)
          (pred_3 ?v7 - type_1 ?v8 - type_2)   
    )

    (:action op_3
     :parameters (?v7 - type_1 ?v3 - type_3 ?v5 - type_2)
     :precondition (and (pred_2 ?v3 ?v5) (pred_2 ?v7 ?v5) (pred_4 ?v7))
     :effect (and
        (not (pred_2 ?v3 ?v5))
        (not (pred_4 ?v7))
        (pred_1 ?v7 ?v3))
    )

    (:action op_1
     :parameters (?v7 - type_1 ?v3 - type_3 ?v5 - type_2)
     :precondition (and (pred_2 ?v7 ?v5) (pred_1 ?v7 ?v3))
     :effect (and
        (pred_4 ?v7)
        (not (pred_1 ?v7 ?v3))
        (pred_2 ?v3 ?v5))
    )

    (:action op_2
     :parameters (?v7 - type_1 ?v6 - type_2 ?v2 - type_2)
     :precondition (and (pred_5 ?v6 ?v2) (pred_2 ?v7 ?v6) (not (= ?v6 ?v2)))
     :effect (and
        (not (pred_2 ?v7 ?v6))
        (pred_2 ?v7 ?v2)
        (pred_3 ?v7 ?v6))
        )
        
    )
)
