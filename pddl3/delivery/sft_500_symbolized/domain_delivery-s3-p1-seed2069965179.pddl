
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_1 - object
        type_4 - type_1
        type_3 - type_1
    )

    (:predicates
        (pred_5 ?v5 - type_1 ?v6 - type_2)
        (pred_1 ?v5 - type_3 ?v6 - type_4)
        (pred_2 ?v5 - type_3)
        (pred_4 ?v5 - type_2 ?v6 - type_2)
          (pred_3 ?v7 - type_3 ?v2 - type_2)   
    )

    (:action op_1
     :parameters (?v7 - type_3 ?v3 - type_4 ?v4 - type_2)
     :precondition (and (pred_5 ?v3 ?v4) (pred_5 ?v7 ?v4) (pred_2 ?v7))
     :effect (and
        (not (pred_5 ?v3 ?v4))
        (not (pred_2 ?v7))
        (pred_1 ?v7 ?v3))
    )

    (:action op_2
     :parameters (?v7 - type_3 ?v3 - type_4 ?v4 - type_2)
     :precondition (and (pred_5 ?v7 ?v4) (pred_1 ?v7 ?v3))
     :effect (and
        (pred_2 ?v7)
        (not (pred_1 ?v7 ?v3))
        (pred_5 ?v3 ?v4))
    )

    (:action op_3
     :parameters (?v7 - type_3 ?v1 - type_2 ?v8 - type_2)
     :precondition (and (pred_4 ?v1 ?v8) (pred_5 ?v7 ?v1) (not (= ?v1 ?v8)))
     :effect (and
        (not (pred_5 ?v7 ?v1))
        (pred_5 ?v7 ?v8)
        (pred_3 ?v7 ?v1))
        )
        
    )
)
