
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_2 - object
        type_3 - type_2
        type_1 - type_2
    )

    (:predicates
        (pred_5 ?v3 - type_2 ?v6 - type_4)
        (pred_3 ?v3 - type_1 ?v6 - type_3)
        (pred_1 ?v3 - type_1)
        (pred_2 ?v3 - type_4 ?v6 - type_4)
          (pred_4 ?v1 - type_1 ?v8 - type_4)   
    )

    (:action op_2
     :parameters (?v1 - type_1 ?v4 - type_3 ?v7 - type_4)
     :precondition (and (pred_5 ?v4 ?v7) (pred_5 ?v1 ?v7) (pred_1 ?v1))
     :effect (and
        (not (pred_5 ?v4 ?v7))
        (not (pred_1 ?v1))
        (pred_3 ?v1 ?v4))
    )

    (:action op_3
     :parameters (?v1 - type_1 ?v4 - type_3 ?v7 - type_4)
     :precondition (and (pred_5 ?v1 ?v7) (pred_3 ?v1 ?v4))
     :effect (and
        (pred_1 ?v1)
        (not (pred_3 ?v1 ?v4))
        (pred_5 ?v4 ?v7))
    )

    (:action op_1
     :parameters (?v1 - type_1 ?v5 - type_4 ?v2 - type_4)
     :precondition (and (pred_2 ?v5 ?v2) (pred_5 ?v1 ?v5) (not (= ?v5 ?v2)))
     :effect (and
        (not (pred_5 ?v1 ?v5))
        (pred_5 ?v1 ?v2)
        (pred_4 ?v1 ?v5))
        )
        
    )
)
