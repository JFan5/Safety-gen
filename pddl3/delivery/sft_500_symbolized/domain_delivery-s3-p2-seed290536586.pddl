
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_1 - object
        type_2 - type_1
        type_3 - type_1
    )

    (:predicates
        (pred_4 ?v4 - type_1 ?v6 - type_4)
        (pred_5 ?v4 - type_3 ?v6 - type_2)
        (pred_2 ?v4 - type_3)
        (pred_3 ?v4 - type_4 ?v6 - type_4)
          (pred_1 ?v2 - type_3 ?v5 - type_4)   
    )

    (:action op_3
     :parameters (?v2 - type_3 ?v7 - type_2 ?v8 - type_4)
     :precondition (and (pred_4 ?v7 ?v8) (pred_4 ?v2 ?v8) (pred_2 ?v2))
     :effect (and
        (not (pred_4 ?v7 ?v8))
        (not (pred_2 ?v2))
        (pred_5 ?v2 ?v7))
    )

    (:action op_1
     :parameters (?v2 - type_3 ?v7 - type_2 ?v8 - type_4)
     :precondition (and (pred_4 ?v2 ?v8) (pred_5 ?v2 ?v7))
     :effect (and
        (pred_2 ?v2)
        (not (pred_5 ?v2 ?v7))
        (pred_4 ?v7 ?v8))
    )

    (:action op_2
     :parameters (?v2 - type_3 ?v1 - type_4 ?v3 - type_4)
     :precondition (and (pred_3 ?v1 ?v3) (pred_4 ?v2 ?v1) (not (= ?v1 ?v3)))
     :effect (and
        (not (pred_4 ?v2 ?v1))
        (pred_4 ?v2 ?v3)
        (pred_1 ?v2 ?v1))
        )
        
    )
)
