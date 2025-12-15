
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_4 - object
        type_2 - type_4
        type_3 - type_4
    )

    (:predicates
        (pred_3 ?v7 - type_4 ?v5 - type_1)
        (pred_1 ?v7 - type_3 ?v5 - type_2)
        (pred_2 ?v7 - type_3)
        (pred_5 ?v7 - type_1 ?v5 - type_1)
          (pred_4 ?v8 - type_3 ?v6 - type_1)   
    )

    (:action op_3
     :parameters (?v8 - type_3 ?v3 - type_2 ?v4 - type_1)
     :precondition (and (pred_3 ?v3 ?v4) (pred_3 ?v8 ?v4) (pred_2 ?v8))
     :effect (and
        (not (pred_3 ?v3 ?v4))
        (not (pred_2 ?v8))
        (pred_1 ?v8 ?v3))
    )

    (:action op_1
     :parameters (?v8 - type_3 ?v3 - type_2 ?v4 - type_1)
     :precondition (and (pred_3 ?v8 ?v4) (pred_1 ?v8 ?v3))
     :effect (and
        (pred_2 ?v8)
        (not (pred_1 ?v8 ?v3))
        (pred_3 ?v3 ?v4))
    )

    (:action op_2
     :parameters (?v8 - type_3 ?v2 - type_1 ?v1 - type_1)
     :precondition (and (pred_5 ?v2 ?v1) (pred_3 ?v8 ?v2) (not (= ?v2 ?v1)))
     :effect (and
        (not (pred_3 ?v8 ?v2))
        (pred_3 ?v8 ?v1)
        (pred_4 ?v8 ?v2))
        )
        
    )
)
