
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_2 - object
        type_4 - type_2
        type_3 - type_2
    )

    (:predicates
        (pred_1 ?v8 - type_2 ?v6 - type_1)
        (pred_4 ?v8 - type_3 ?v6 - type_4)
        (pred_5 ?v8 - type_3)
        (pred_3 ?v8 - type_1 ?v6 - type_1)
          (pred_2 ?v4 - type_3 ?v1 - type_1)   
    )

    (:action op_3
     :parameters (?v4 - type_3 ?v5 - type_4 ?v2 - type_1)
     :precondition (and (pred_1 ?v5 ?v2) (pred_1 ?v4 ?v2) (pred_5 ?v4))
     :effect (and
        (not (pred_1 ?v5 ?v2))
        (not (pred_5 ?v4))
        (pred_4 ?v4 ?v5))
    )

    (:action op_2
     :parameters (?v4 - type_3 ?v5 - type_4 ?v2 - type_1)
     :precondition (and (pred_1 ?v4 ?v2) (pred_4 ?v4 ?v5))
     :effect (and
        (pred_5 ?v4)
        (not (pred_4 ?v4 ?v5))
        (pred_1 ?v5 ?v2))
    )

    (:action op_1
     :parameters (?v4 - type_3 ?v3 - type_1 ?v7 - type_1)
     :precondition (and (pred_3 ?v3 ?v7) (pred_1 ?v4 ?v3) (not (= ?v3 ?v7)))
     :effect (and
        (not (pred_1 ?v4 ?v3))
        (pred_1 ?v4 ?v7)
        (pred_2 ?v4 ?v3))
        )
        
    )
)
