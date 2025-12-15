
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_1 - object
        type_3 - type_1
        type_2 - type_1
    )

    (:predicates
        (pred_1 ?v4 - type_1 ?v6 - type_4)
        (pred_5 ?v4 - type_2 ?v6 - type_3)
        (pred_3 ?v4 - type_2)
        (pred_2 ?v4 - type_4 ?v6 - type_4)
          (pred_4 ?v5 - type_2 ?v3 - type_4)   
    )

    (:action op_3
     :parameters (?v5 - type_2 ?v2 - type_3 ?v1 - type_4)
     :precondition (and (pred_1 ?v2 ?v1) (pred_1 ?v5 ?v1) (pred_3 ?v5))
     :effect (and
        (not (pred_1 ?v2 ?v1))
        (not (pred_3 ?v5))
        (pred_5 ?v5 ?v2))
    )

    (:action op_2
     :parameters (?v5 - type_2 ?v2 - type_3 ?v1 - type_4)
     :precondition (and (pred_1 ?v5 ?v1) (pred_5 ?v5 ?v2))
     :effect (and
        (pred_3 ?v5)
        (not (pred_5 ?v5 ?v2))
        (pred_1 ?v2 ?v1))
    )

    (:action op_1
     :parameters (?v5 - type_2 ?v8 - type_4 ?v7 - type_4)
     :precondition (and (pred_2 ?v8 ?v7) (pred_1 ?v5 ?v8) (not (= ?v8 ?v7)))
     :effect (and
        (not (pred_1 ?v5 ?v8))
        (pred_1 ?v5 ?v7)
        (pred_4 ?v5 ?v8))
        )
        
    )
)
