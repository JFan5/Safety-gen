
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_3 - object
        type_2 - type_3
        type_4 - type_3
    )

    (:predicates
        (pred_5 ?v4 - type_3 ?v3 - type_1)
        (pred_1 ?v4 - type_4 ?v3 - type_2)
        (pred_3 ?v4 - type_4)
        (pred_4 ?v4 - type_1 ?v3 - type_1)
          (pred_2 ?v8 - type_4 ?v6 - type_1)   
    )

    (:action op_1
     :parameters (?v8 - type_4 ?v2 - type_2 ?v5 - type_1)
     :precondition (and (pred_5 ?v2 ?v5) (pred_5 ?v8 ?v5) (pred_3 ?v8))
     :effect (and
        (not (pred_5 ?v2 ?v5))
        (not (pred_3 ?v8))
        (pred_1 ?v8 ?v2))
    )

    (:action op_3
     :parameters (?v8 - type_4 ?v2 - type_2 ?v5 - type_1)
     :precondition (and (pred_5 ?v8 ?v5) (pred_1 ?v8 ?v2))
     :effect (and
        (pred_3 ?v8)
        (not (pred_1 ?v8 ?v2))
        (pred_5 ?v2 ?v5))
    )

    (:action op_2
     :parameters (?v8 - type_4 ?v7 - type_1 ?v1 - type_1)
     :precondition (and (pred_4 ?v7 ?v1) (pred_5 ?v8 ?v7) (not (= ?v7 ?v1)))
     :effect (and
        (not (pred_5 ?v8 ?v7))
        (pred_5 ?v8 ?v1)
        (pred_2 ?v8 ?v7))
        )
        
    )
)
