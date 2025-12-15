
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_4 - object
        type_1 - type_4
        type_3 - type_4
    )

    (:predicates
        (pred_4 ?v3 - type_4 ?v2 - type_2)
        (pred_1 ?v3 - type_3 ?v2 - type_1)
        (pred_2 ?v3 - type_3)
        (pred_3 ?v3 - type_2 ?v2 - type_2)
          (pred_5 ?v5 - type_3 ?v1 - type_2)   
    )

    (:action op_1
     :parameters (?v5 - type_3 ?v7 - type_1 ?v6 - type_2)
     :precondition (and (pred_4 ?v7 ?v6) (pred_4 ?v5 ?v6) (pred_2 ?v5))
     :effect (and
        (not (pred_4 ?v7 ?v6))
        (not (pred_2 ?v5))
        (pred_1 ?v5 ?v7))
    )

    (:action op_3
     :parameters (?v5 - type_3 ?v7 - type_1 ?v6 - type_2)
     :precondition (and (pred_4 ?v5 ?v6) (pred_1 ?v5 ?v7))
     :effect (and
        (pred_2 ?v5)
        (not (pred_1 ?v5 ?v7))
        (pred_4 ?v7 ?v6))
    )

    (:action op_2
     :parameters (?v5 - type_3 ?v4 - type_2 ?v8 - type_2)
     :precondition (and (pred_3 ?v4 ?v8) (pred_4 ?v5 ?v4) (not (= ?v4 ?v8)))
     :effect (and
        (not (pred_4 ?v5 ?v4))
        (pred_4 ?v5 ?v8)
        (pred_5 ?v5 ?v4))
        )
        
    )
)
