
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_1 - object
        type_2 - type_1
        type_4 - type_1
    )

    (:predicates
        (pred_3 ?v8 - type_1 ?v3 - type_3)
        (pred_5 ?v8 - type_4 ?v3 - type_2)
        (pred_4 ?v8 - type_4)
        (pred_2 ?v8 - type_3 ?v3 - type_3)
          (pred_1 ?v6 - type_4 ?v2 - type_3)   
    )

    (:action op_1
     :parameters (?v6 - type_4 ?v5 - type_2 ?v7 - type_3)
     :precondition (and (pred_3 ?v5 ?v7) (pred_3 ?v6 ?v7) (pred_4 ?v6))
     :effect (and
        (not (pred_3 ?v5 ?v7))
        (not (pred_4 ?v6))
        (pred_5 ?v6 ?v5))
    )

    (:action op_3
     :parameters (?v6 - type_4 ?v5 - type_2 ?v7 - type_3)
     :precondition (and (pred_3 ?v6 ?v7) (pred_5 ?v6 ?v5))
     :effect (and
        (pred_4 ?v6)
        (not (pred_5 ?v6 ?v5))
        (pred_3 ?v5 ?v7))
    )

    (:action op_2
     :parameters (?v6 - type_4 ?v1 - type_3 ?v4 - type_3)
     :precondition (and (pred_2 ?v1 ?v4) (pred_3 ?v6 ?v1) (not (= ?v1 ?v4)))
     :effect (and
        (not (pred_3 ?v6 ?v1))
        (pred_3 ?v6 ?v4)
        (pred_1 ?v6 ?v1))
        )
        
    )
)
