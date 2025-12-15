
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_4 - object
        type_3 - type_4
        type_1 - type_4
    )

    (:predicates
        (pred_4 ?v1 - type_4 ?v7 - type_2)
        (pred_2 ?v1 - type_1 ?v7 - type_3)
        (pred_1 ?v1 - type_1)
        (pred_3 ?v1 - type_2 ?v7 - type_2)
          (pred_5 ?v5 - type_1 ?v8 - type_2)   
    )

    (:action op_3
     :parameters (?v5 - type_1 ?v4 - type_3 ?v3 - type_2)
     :precondition (and (pred_4 ?v4 ?v3) (pred_4 ?v5 ?v3) (pred_1 ?v5))
     :effect (and
        (not (pred_4 ?v4 ?v3))
        (not (pred_1 ?v5))
        (pred_2 ?v5 ?v4))
    )

    (:action op_1
     :parameters (?v5 - type_1 ?v4 - type_3 ?v3 - type_2)
     :precondition (and (pred_4 ?v5 ?v3) (pred_2 ?v5 ?v4))
     :effect (and
        (pred_1 ?v5)
        (not (pred_2 ?v5 ?v4))
        (pred_4 ?v4 ?v3))
    )

    (:action op_2
     :parameters (?v5 - type_1 ?v6 - type_2 ?v2 - type_2)
     :precondition (and (pred_3 ?v6 ?v2) (pred_4 ?v5 ?v6) (not (= ?v6 ?v2)))
     :effect (and
        (not (pred_4 ?v5 ?v6))
        (pred_4 ?v5 ?v2)
        (pred_5 ?v5 ?v6))
        )
        
    )
)
