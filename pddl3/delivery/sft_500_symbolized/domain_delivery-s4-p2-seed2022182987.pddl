
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_4 - object
        type_3 - type_4
        type_2 - type_4
    )

    (:predicates
        (pred_5 ?v1 - type_4 ?v2 - type_1)
        (pred_1 ?v1 - type_2 ?v2 - type_3)
        (pred_2 ?v1 - type_2)
        (pred_3 ?v1 - type_1 ?v2 - type_1)
          (pred_4 ?v4 - type_2 ?v3 - type_1)   
    )

    (:action op_2
     :parameters (?v4 - type_2 ?v7 - type_3 ?v6 - type_1)
     :precondition (and (pred_5 ?v7 ?v6) (pred_5 ?v4 ?v6) (pred_2 ?v4))
     :effect (and
        (not (pred_5 ?v7 ?v6))
        (not (pred_2 ?v4))
        (pred_1 ?v4 ?v7))
    )

    (:action op_1
     :parameters (?v4 - type_2 ?v7 - type_3 ?v6 - type_1)
     :precondition (and (pred_5 ?v4 ?v6) (pred_1 ?v4 ?v7))
     :effect (and
        (pred_2 ?v4)
        (not (pred_1 ?v4 ?v7))
        (pred_5 ?v7 ?v6))
    )

    (:action op_3
     :parameters (?v4 - type_2 ?v5 - type_1 ?v8 - type_1)
     :precondition (and (pred_3 ?v5 ?v8) (pred_5 ?v4 ?v5) (not (= ?v5 ?v8)))
     :effect (and
        (not (pred_5 ?v4 ?v5))
        (pred_5 ?v4 ?v8)
        (pred_4 ?v4 ?v5))
        )
        
    )
)
