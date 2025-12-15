
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_3 - object
        type_4 - type_3
        type_2 - type_3
    )

    (:predicates
        (pred_5 ?v4 - type_3 ?v1 - type_1)
        (pred_4 ?v4 - type_2 ?v1 - type_4)
        (pred_2 ?v4 - type_2)
        (pred_3 ?v4 - type_1 ?v1 - type_1)
          (pred_1 ?v6 - type_2 ?v8 - type_1)   
    )

    (:action op_3
     :parameters (?v6 - type_2 ?v2 - type_4 ?v7 - type_1)
     :precondition (and (pred_5 ?v2 ?v7) (pred_5 ?v6 ?v7) (pred_2 ?v6))
     :effect (and
        (not (pred_5 ?v2 ?v7))
        (not (pred_2 ?v6))
        (pred_4 ?v6 ?v2))
    )

    (:action op_2
     :parameters (?v6 - type_2 ?v2 - type_4 ?v7 - type_1)
     :precondition (and (pred_5 ?v6 ?v7) (pred_4 ?v6 ?v2))
     :effect (and
        (pred_2 ?v6)
        (not (pred_4 ?v6 ?v2))
        (pred_5 ?v2 ?v7))
    )

    (:action op_1
     :parameters (?v6 - type_2 ?v3 - type_1 ?v5 - type_1)
     :precondition (and (pred_3 ?v3 ?v5) (pred_5 ?v6 ?v3) (not (= ?v3 ?v5)))
     :effect (and
        (not (pred_5 ?v6 ?v3))
        (pred_5 ?v6 ?v5)
        (pred_1 ?v6 ?v3))
        )
        
    )
)
