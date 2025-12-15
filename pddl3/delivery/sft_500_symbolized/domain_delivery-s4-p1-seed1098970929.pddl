
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_2 - object
        type_3 - type_2
        type_4 - type_2
    )

    (:predicates
        (pred_4 ?v7 - type_2 ?v4 - type_1)
        (pred_2 ?v7 - type_4 ?v4 - type_3)
        (pred_1 ?v7 - type_4)
        (pred_3 ?v7 - type_1 ?v4 - type_1)
          (pred_5 ?v8 - type_4 ?v3 - type_1)   
    )

    (:action op_3
     :parameters (?v8 - type_4 ?v5 - type_3 ?v1 - type_1)
     :precondition (and (pred_4 ?v5 ?v1) (pred_4 ?v8 ?v1) (pred_1 ?v8))
     :effect (and
        (not (pred_4 ?v5 ?v1))
        (not (pred_1 ?v8))
        (pred_2 ?v8 ?v5))
    )

    (:action op_2
     :parameters (?v8 - type_4 ?v5 - type_3 ?v1 - type_1)
     :precondition (and (pred_4 ?v8 ?v1) (pred_2 ?v8 ?v5))
     :effect (and
        (pred_1 ?v8)
        (not (pred_2 ?v8 ?v5))
        (pred_4 ?v5 ?v1))
    )

    (:action op_1
     :parameters (?v8 - type_4 ?v6 - type_1 ?v2 - type_1)
     :precondition (and (pred_3 ?v6 ?v2) (pred_4 ?v8 ?v6) (not (= ?v6 ?v2)))
     :effect (and
        (not (pred_4 ?v8 ?v6))
        (pred_4 ?v8 ?v2)
        (pred_5 ?v8 ?v6))
        )
        
    )
)
