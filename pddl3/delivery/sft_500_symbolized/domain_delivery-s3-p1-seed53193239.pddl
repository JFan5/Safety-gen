
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_2 - object
        type_4 - type_2
        type_1 - type_2
    )

    (:predicates
        (pred_3 ?v5 - type_2 ?v7 - type_3)
        (pred_1 ?v5 - type_1 ?v7 - type_4)
        (pred_2 ?v5 - type_1)
        (pred_4 ?v5 - type_3 ?v7 - type_3)
          (pred_5 ?v3 - type_1 ?v6 - type_3)   
    )

    (:action op_3
     :parameters (?v3 - type_1 ?v4 - type_4 ?v2 - type_3)
     :precondition (and (pred_3 ?v4 ?v2) (pred_3 ?v3 ?v2) (pred_2 ?v3))
     :effect (and
        (not (pred_3 ?v4 ?v2))
        (not (pred_2 ?v3))
        (pred_1 ?v3 ?v4))
    )

    (:action op_1
     :parameters (?v3 - type_1 ?v4 - type_4 ?v2 - type_3)
     :precondition (and (pred_3 ?v3 ?v2) (pred_1 ?v3 ?v4))
     :effect (and
        (pred_2 ?v3)
        (not (pred_1 ?v3 ?v4))
        (pred_3 ?v4 ?v2))
    )

    (:action op_2
     :parameters (?v3 - type_1 ?v1 - type_3 ?v8 - type_3)
     :precondition (and (pred_4 ?v1 ?v8) (pred_3 ?v3 ?v1) (not (= ?v1 ?v8)))
     :effect (and
        (not (pred_3 ?v3 ?v1))
        (pred_3 ?v3 ?v8)
        (pred_5 ?v3 ?v1))
        )
        
    )
)
