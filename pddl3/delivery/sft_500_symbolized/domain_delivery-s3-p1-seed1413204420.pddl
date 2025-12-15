
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_4 - object
        type_3 - type_4
        type_2 - type_4
    )

    (:predicates
        (pred_5 ?v1 - type_4 ?v3 - type_1)
        (pred_3 ?v1 - type_2 ?v3 - type_3)
        (pred_4 ?v1 - type_2)
        (pred_2 ?v1 - type_1 ?v3 - type_1)
          (pred_1 ?v4 - type_2 ?v6 - type_1)   
    )

    (:action op_3
     :parameters (?v4 - type_2 ?v8 - type_3 ?v2 - type_1)
     :precondition (and (pred_5 ?v8 ?v2) (pred_5 ?v4 ?v2) (pred_4 ?v4))
     :effect (and
        (not (pred_5 ?v8 ?v2))
        (not (pred_4 ?v4))
        (pred_3 ?v4 ?v8))
    )

    (:action op_2
     :parameters (?v4 - type_2 ?v8 - type_3 ?v2 - type_1)
     :precondition (and (pred_5 ?v4 ?v2) (pred_3 ?v4 ?v8))
     :effect (and
        (pred_4 ?v4)
        (not (pred_3 ?v4 ?v8))
        (pred_5 ?v8 ?v2))
    )

    (:action op_1
     :parameters (?v4 - type_2 ?v7 - type_1 ?v5 - type_1)
     :precondition (and (pred_2 ?v7 ?v5) (pred_5 ?v4 ?v7) (not (= ?v7 ?v5)))
     :effect (and
        (not (pred_5 ?v4 ?v7))
        (pred_5 ?v4 ?v5)
        (pred_1 ?v4 ?v7))
        )
        
    )
)
