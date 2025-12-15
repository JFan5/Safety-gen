
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_2 - object
        type_3 - type_2
        type_1 - type_2
    )

    (:predicates
        (pred_4 ?v8 - type_2 ?v6 - type_4)
        (pred_5 ?v8 - type_1 ?v6 - type_3)
        (pred_2 ?v8 - type_1)
        (pred_3 ?v8 - type_4 ?v6 - type_4)
          (pred_1 ?v4 - type_1 ?v5 - type_4)   
    )

    (:action op_1
     :parameters (?v4 - type_1 ?v7 - type_3 ?v2 - type_4)
     :precondition (and (pred_4 ?v7 ?v2) (pred_4 ?v4 ?v2) (pred_2 ?v4))
     :effect (and
        (not (pred_4 ?v7 ?v2))
        (not (pred_2 ?v4))
        (pred_5 ?v4 ?v7))
    )

    (:action op_2
     :parameters (?v4 - type_1 ?v7 - type_3 ?v2 - type_4)
     :precondition (and (pred_4 ?v4 ?v2) (pred_5 ?v4 ?v7))
     :effect (and
        (pred_2 ?v4)
        (not (pred_5 ?v4 ?v7))
        (pred_4 ?v7 ?v2))
    )

    (:action op_3
     :parameters (?v4 - type_1 ?v1 - type_4 ?v3 - type_4)
     :precondition (and (pred_3 ?v1 ?v3) (pred_4 ?v4 ?v1) (not (= ?v1 ?v3)))
     :effect (and
        (not (pred_4 ?v4 ?v1))
        (pred_4 ?v4 ?v3)
        (pred_1 ?v4 ?v1))
        )
        
    )
)
