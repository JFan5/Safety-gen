
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_3 - object
        type_4 - type_3
        type_2 - type_3
    )

    (:predicates
        (pred_4 ?v2 - type_3 ?v5 - type_1)
        (pred_5 ?v2 - type_2 ?v5 - type_4)
        (pred_1 ?v2 - type_2)
        (pred_2 ?v2 - type_1 ?v5 - type_1)
          (pred_3 ?v7 - type_2 ?v3 - type_1)   
    )

    (:action op_3
     :parameters (?v7 - type_2 ?v6 - type_4 ?v1 - type_1)
     :precondition (and (pred_4 ?v6 ?v1) (pred_4 ?v7 ?v1) (pred_1 ?v7))
     :effect (and
        (not (pred_4 ?v6 ?v1))
        (not (pred_1 ?v7))
        (pred_5 ?v7 ?v6))
    )

    (:action op_1
     :parameters (?v7 - type_2 ?v6 - type_4 ?v1 - type_1)
     :precondition (and (pred_4 ?v7 ?v1) (pred_5 ?v7 ?v6))
     :effect (and
        (pred_1 ?v7)
        (not (pred_5 ?v7 ?v6))
        (pred_4 ?v6 ?v1))
    )

    (:action op_2
     :parameters (?v7 - type_2 ?v4 - type_1 ?v8 - type_1)
     :precondition (and (pred_2 ?v4 ?v8) (pred_4 ?v7 ?v4) (not (= ?v4 ?v8)))
     :effect (and
        (not (pred_4 ?v7 ?v4))
        (pred_4 ?v7 ?v8)
        (pred_3 ?v7 ?v4))
        )
        
    )
)
