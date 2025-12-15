
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_3 - object
        type_1 - type_3
        type_2 - type_3
    )

    (:predicates
        (pred_5 ?v8 - type_3 ?v3 - type_4)
        (pred_4 ?v8 - type_2 ?v3 - type_1)
        (pred_3 ?v8 - type_2)
        (pred_2 ?v8 - type_4 ?v3 - type_4)
          (pred_1 ?v5 - type_2 ?v2 - type_4)   
    )

    (:action op_1
     :parameters (?v5 - type_2 ?v1 - type_1 ?v6 - type_4)
     :precondition (and (pred_5 ?v1 ?v6) (pred_5 ?v5 ?v6) (pred_3 ?v5))
     :effect (and
        (not (pred_5 ?v1 ?v6))
        (not (pred_3 ?v5))
        (pred_4 ?v5 ?v1))
    )

    (:action op_2
     :parameters (?v5 - type_2 ?v1 - type_1 ?v6 - type_4)
     :precondition (and (pred_5 ?v5 ?v6) (pred_4 ?v5 ?v1))
     :effect (and
        (pred_3 ?v5)
        (not (pred_4 ?v5 ?v1))
        (pred_5 ?v1 ?v6))
    )

    (:action op_3
     :parameters (?v5 - type_2 ?v7 - type_4 ?v4 - type_4)
     :precondition (and (pred_2 ?v7 ?v4) (pred_5 ?v5 ?v7) (not (= ?v7 ?v4)))
     :effect (and
        (not (pred_5 ?v5 ?v7))
        (pred_5 ?v5 ?v4)
        (pred_1 ?v5 ?v7))
        )
        
    )
)
