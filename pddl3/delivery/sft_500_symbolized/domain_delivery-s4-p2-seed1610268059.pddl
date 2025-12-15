
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_4 - object
        type_2 - type_4
        type_3 - type_4
    )

    (:predicates
        (pred_3 ?v2 - type_4 ?v5 - type_1)
        (pred_5 ?v2 - type_3 ?v5 - type_2)
        (pred_1 ?v2 - type_3)
        (pred_2 ?v2 - type_1 ?v5 - type_1)
          (pred_4 ?v6 - type_3 ?v1 - type_1)   
    )

    (:action op_1
     :parameters (?v6 - type_3 ?v7 - type_2 ?v8 - type_1)
     :precondition (and (pred_3 ?v7 ?v8) (pred_3 ?v6 ?v8) (pred_1 ?v6))
     :effect (and
        (not (pred_3 ?v7 ?v8))
        (not (pred_1 ?v6))
        (pred_5 ?v6 ?v7))
    )

    (:action op_2
     :parameters (?v6 - type_3 ?v7 - type_2 ?v8 - type_1)
     :precondition (and (pred_3 ?v6 ?v8) (pred_5 ?v6 ?v7))
     :effect (and
        (pred_1 ?v6)
        (not (pred_5 ?v6 ?v7))
        (pred_3 ?v7 ?v8))
    )

    (:action op_3
     :parameters (?v6 - type_3 ?v3 - type_1 ?v4 - type_1)
     :precondition (and (pred_2 ?v3 ?v4) (pred_3 ?v6 ?v3) (not (= ?v3 ?v4)))
     :effect (and
        (not (pred_3 ?v6 ?v3))
        (pred_3 ?v6 ?v4)
        (pred_4 ?v6 ?v3))
        )
        
    )
)
