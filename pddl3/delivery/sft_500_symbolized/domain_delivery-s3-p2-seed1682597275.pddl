
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_4 - object
        type_1 - type_4
        type_2 - type_4
    )

    (:predicates
        (pred_5 ?v7 - type_4 ?v5 - type_3)
        (pred_3 ?v7 - type_2 ?v5 - type_1)
        (pred_4 ?v7 - type_2)
        (pred_1 ?v7 - type_3 ?v5 - type_3)
          (pred_2 ?v4 - type_2 ?v3 - type_3)   
    )

    (:action op_2
     :parameters (?v4 - type_2 ?v6 - type_1 ?v1 - type_3)
     :precondition (and (pred_5 ?v6 ?v1) (pred_5 ?v4 ?v1) (pred_4 ?v4))
     :effect (and
        (not (pred_5 ?v6 ?v1))
        (not (pred_4 ?v4))
        (pred_3 ?v4 ?v6))
    )

    (:action op_3
     :parameters (?v4 - type_2 ?v6 - type_1 ?v1 - type_3)
     :precondition (and (pred_5 ?v4 ?v1) (pred_3 ?v4 ?v6))
     :effect (and
        (pred_4 ?v4)
        (not (pred_3 ?v4 ?v6))
        (pred_5 ?v6 ?v1))
    )

    (:action op_1
     :parameters (?v4 - type_2 ?v2 - type_3 ?v8 - type_3)
     :precondition (and (pred_1 ?v2 ?v8) (pred_5 ?v4 ?v2) (not (= ?v2 ?v8)))
     :effect (and
        (not (pred_5 ?v4 ?v2))
        (pred_5 ?v4 ?v8)
        (pred_2 ?v4 ?v2))
        )
        
    )
)
