
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_4 - object
        type_2 - type_4
        type_1 - type_4
    )

    (:predicates
        (pred_4 ?v3 - type_4 ?v5 - type_3)
        (pred_5 ?v3 - type_1 ?v5 - type_2)
        (pred_2 ?v3 - type_1)
        (pred_1 ?v3 - type_3 ?v5 - type_3)
          (pred_3 ?v7 - type_1 ?v2 - type_3)   
    )

    (:action op_1
     :parameters (?v7 - type_1 ?v1 - type_2 ?v4 - type_3)
     :precondition (and (pred_4 ?v1 ?v4) (pred_4 ?v7 ?v4) (pred_2 ?v7))
     :effect (and
        (not (pred_4 ?v1 ?v4))
        (not (pred_2 ?v7))
        (pred_5 ?v7 ?v1))
    )

    (:action op_2
     :parameters (?v7 - type_1 ?v1 - type_2 ?v4 - type_3)
     :precondition (and (pred_4 ?v7 ?v4) (pred_5 ?v7 ?v1))
     :effect (and
        (pred_2 ?v7)
        (not (pred_5 ?v7 ?v1))
        (pred_4 ?v1 ?v4))
    )

    (:action op_3
     :parameters (?v7 - type_1 ?v6 - type_3 ?v8 - type_3)
     :precondition (and (pred_1 ?v6 ?v8) (pred_4 ?v7 ?v6) (not (= ?v6 ?v8)))
     :effect (and
        (not (pred_4 ?v7 ?v6))
        (pred_4 ?v7 ?v8)
        (pred_3 ?v7 ?v6))
        )
        
    )
)
