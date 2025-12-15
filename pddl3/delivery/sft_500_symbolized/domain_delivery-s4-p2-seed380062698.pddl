
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_1 - object
        type_4 - type_1
        type_2 - type_1
    )

    (:predicates
        (pred_2 ?v1 - type_1 ?v6 - type_3)
        (pred_1 ?v1 - type_2 ?v6 - type_4)
        (pred_5 ?v1 - type_2)
        (pred_3 ?v1 - type_3 ?v6 - type_3)
          (pred_4 ?v7 - type_2 ?v5 - type_3)   
    )

    (:action op_3
     :parameters (?v7 - type_2 ?v2 - type_4 ?v8 - type_3)
     :precondition (and (pred_2 ?v2 ?v8) (pred_2 ?v7 ?v8) (pred_5 ?v7))
     :effect (and
        (not (pred_2 ?v2 ?v8))
        (not (pred_5 ?v7))
        (pred_1 ?v7 ?v2))
    )

    (:action op_2
     :parameters (?v7 - type_2 ?v2 - type_4 ?v8 - type_3)
     :precondition (and (pred_2 ?v7 ?v8) (pred_1 ?v7 ?v2))
     :effect (and
        (pred_5 ?v7)
        (not (pred_1 ?v7 ?v2))
        (pred_2 ?v2 ?v8))
    )

    (:action op_1
     :parameters (?v7 - type_2 ?v4 - type_3 ?v3 - type_3)
     :precondition (and (pred_3 ?v4 ?v3) (pred_2 ?v7 ?v4) (not (= ?v4 ?v3)))
     :effect (and
        (not (pred_2 ?v7 ?v4))
        (pred_2 ?v7 ?v3)
        (pred_4 ?v7 ?v4))
        )
        
    )
)
