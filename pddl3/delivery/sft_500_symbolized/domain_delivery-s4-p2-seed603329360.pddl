
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_3 - object
        type_2 - type_3
        type_4 - type_3
    )

    (:predicates
        (pred_4 ?v7 - type_3 ?v8 - type_1)
        (pred_2 ?v7 - type_4 ?v8 - type_2)
        (pred_1 ?v7 - type_4)
        (pred_5 ?v7 - type_1 ?v8 - type_1)
          (pred_3 ?v2 - type_4 ?v3 - type_1)   
    )

    (:action op_2
     :parameters (?v2 - type_4 ?v6 - type_2 ?v4 - type_1)
     :precondition (and (pred_4 ?v6 ?v4) (pred_4 ?v2 ?v4) (pred_1 ?v2))
     :effect (and
        (not (pred_4 ?v6 ?v4))
        (not (pred_1 ?v2))
        (pred_2 ?v2 ?v6))
    )

    (:action op_3
     :parameters (?v2 - type_4 ?v6 - type_2 ?v4 - type_1)
     :precondition (and (pred_4 ?v2 ?v4) (pred_2 ?v2 ?v6))
     :effect (and
        (pred_1 ?v2)
        (not (pred_2 ?v2 ?v6))
        (pred_4 ?v6 ?v4))
    )

    (:action op_1
     :parameters (?v2 - type_4 ?v5 - type_1 ?v1 - type_1)
     :precondition (and (pred_5 ?v5 ?v1) (pred_4 ?v2 ?v5) (not (= ?v5 ?v1)))
     :effect (and
        (not (pred_4 ?v2 ?v5))
        (pred_4 ?v2 ?v1)
        (pred_3 ?v2 ?v5))
        )
        
    )
)
