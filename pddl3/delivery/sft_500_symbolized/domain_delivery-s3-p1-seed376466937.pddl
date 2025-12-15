
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_4 - object
        type_1 - type_4
        type_2 - type_4
    )

    (:predicates
        (pred_3 ?v4 - type_4 ?v3 - type_3)
        (pred_1 ?v4 - type_2 ?v3 - type_1)
        (pred_4 ?v4 - type_2)
        (pred_5 ?v4 - type_3 ?v3 - type_3)
          (pred_2 ?v5 - type_2 ?v6 - type_3)   
    )

    (:action op_3
     :parameters (?v5 - type_2 ?v2 - type_1 ?v8 - type_3)
     :precondition (and (pred_3 ?v2 ?v8) (pred_3 ?v5 ?v8) (pred_4 ?v5))
     :effect (and
        (not (pred_3 ?v2 ?v8))
        (not (pred_4 ?v5))
        (pred_1 ?v5 ?v2))
    )

    (:action op_1
     :parameters (?v5 - type_2 ?v2 - type_1 ?v8 - type_3)
     :precondition (and (pred_3 ?v5 ?v8) (pred_1 ?v5 ?v2))
     :effect (and
        (pred_4 ?v5)
        (not (pred_1 ?v5 ?v2))
        (pred_3 ?v2 ?v8))
    )

    (:action op_2
     :parameters (?v5 - type_2 ?v7 - type_3 ?v1 - type_3)
     :precondition (and (pred_5 ?v7 ?v1) (pred_3 ?v5 ?v7) (not (= ?v7 ?v1)))
     :effect (and
        (not (pred_3 ?v5 ?v7))
        (pred_3 ?v5 ?v1)
        (pred_2 ?v5 ?v7))
        )
        
    )
)
