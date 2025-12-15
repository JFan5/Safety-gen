
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_3 - object
        type_2 - type_3
        type_4 - type_3
    )

    (:predicates
        (pred_3 ?v8 - type_3 ?v5 - type_1)
        (pred_4 ?v8 - type_4 ?v5 - type_2)
        (pred_1 ?v8 - type_4)
        (pred_5 ?v8 - type_1 ?v5 - type_1)
          (pred_2 ?v4 - type_4 ?v2 - type_1)   
    )

    (:action op_1
     :parameters (?v4 - type_4 ?v7 - type_2 ?v1 - type_1)
     :precondition (and (pred_3 ?v7 ?v1) (pred_3 ?v4 ?v1) (pred_1 ?v4))
     :effect (and
        (not (pred_3 ?v7 ?v1))
        (not (pred_1 ?v4))
        (pred_4 ?v4 ?v7))
    )

    (:action op_3
     :parameters (?v4 - type_4 ?v7 - type_2 ?v1 - type_1)
     :precondition (and (pred_3 ?v4 ?v1) (pred_4 ?v4 ?v7))
     :effect (and
        (pred_1 ?v4)
        (not (pred_4 ?v4 ?v7))
        (pred_3 ?v7 ?v1))
    )

    (:action op_2
     :parameters (?v4 - type_4 ?v6 - type_1 ?v3 - type_1)
     :precondition (and (pred_5 ?v6 ?v3) (pred_3 ?v4 ?v6) (not (= ?v6 ?v3)))
     :effect (and
        (not (pred_3 ?v4 ?v6))
        (pred_3 ?v4 ?v3)
        (pred_2 ?v4 ?v6))
        )
        
    )
)
