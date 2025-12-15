
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_4 - object
        type_3 - type_4
        type_2 - type_4
    )

    (:predicates
        (pred_5 ?v4 - type_4 ?v1 - type_1)
        (pred_2 ?v4 - type_2 ?v1 - type_3)
        (pred_4 ?v4 - type_2)
        (pred_1 ?v4 - type_1 ?v1 - type_1)
          (pred_3 ?v3 - type_2 ?v8 - type_1)   
    )

    (:action op_2
     :parameters (?v3 - type_2 ?v2 - type_3 ?v6 - type_1)
     :precondition (and (pred_5 ?v2 ?v6) (pred_5 ?v3 ?v6) (pred_4 ?v3))
     :effect (and
        (not (pred_5 ?v2 ?v6))
        (not (pred_4 ?v3))
        (pred_2 ?v3 ?v2))
    )

    (:action op_1
     :parameters (?v3 - type_2 ?v2 - type_3 ?v6 - type_1)
     :precondition (and (pred_5 ?v3 ?v6) (pred_2 ?v3 ?v2))
     :effect (and
        (pred_4 ?v3)
        (not (pred_2 ?v3 ?v2))
        (pred_5 ?v2 ?v6))
    )

    (:action op_3
     :parameters (?v3 - type_2 ?v5 - type_1 ?v7 - type_1)
     :precondition (and (pred_1 ?v5 ?v7) (pred_5 ?v3 ?v5) (not (= ?v5 ?v7)))
     :effect (and
        (not (pred_5 ?v3 ?v5))
        (pred_5 ?v3 ?v7)
        (pred_3 ?v3 ?v5))
        )
        
    )
)
