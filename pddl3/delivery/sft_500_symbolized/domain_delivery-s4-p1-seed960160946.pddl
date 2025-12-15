
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_3 - object
        type_2 - type_3
        type_4 - type_3
    )

    (:predicates
        (pred_4 ?v2 - type_3 ?v4 - type_1)
        (pred_1 ?v2 - type_4 ?v4 - type_2)
        (pred_3 ?v2 - type_4)
        (pred_2 ?v2 - type_1 ?v4 - type_1)
          (pred_5 ?v5 - type_4 ?v6 - type_1)   
    )

    (:action op_2
     :parameters (?v5 - type_4 ?v1 - type_2 ?v8 - type_1)
     :precondition (and (pred_4 ?v1 ?v8) (pred_4 ?v5 ?v8) (pred_3 ?v5))
     :effect (and
        (not (pred_4 ?v1 ?v8))
        (not (pred_3 ?v5))
        (pred_1 ?v5 ?v1))
    )

    (:action op_1
     :parameters (?v5 - type_4 ?v1 - type_2 ?v8 - type_1)
     :precondition (and (pred_4 ?v5 ?v8) (pred_1 ?v5 ?v1))
     :effect (and
        (pred_3 ?v5)
        (not (pred_1 ?v5 ?v1))
        (pred_4 ?v1 ?v8))
    )

    (:action op_3
     :parameters (?v5 - type_4 ?v7 - type_1 ?v3 - type_1)
     :precondition (and (pred_2 ?v7 ?v3) (pred_4 ?v5 ?v7) (not (= ?v7 ?v3)))
     :effect (and
        (not (pred_4 ?v5 ?v7))
        (pred_4 ?v5 ?v3)
        (pred_5 ?v5 ?v7))
        )
        
    )
)
