
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_4 - object
        type_2 - type_4
        type_3 - type_4
    )

    (:predicates
        (pred_1 ?v3 - type_4 ?v5 - type_1)
        (pred_4 ?v3 - type_3 ?v5 - type_2)
        (pred_3 ?v3 - type_3)
        (pred_5 ?v3 - type_1 ?v5 - type_1)
          (pred_2 ?v1 - type_3 ?v8 - type_1)   
    )

    (:action op_3
     :parameters (?v1 - type_3 ?v4 - type_2 ?v7 - type_1)
     :precondition (and (pred_1 ?v4 ?v7) (pred_1 ?v1 ?v7) (pred_3 ?v1))
     :effect (and
        (not (pred_1 ?v4 ?v7))
        (not (pred_3 ?v1))
        (pred_4 ?v1 ?v4))
    )

    (:action op_2
     :parameters (?v1 - type_3 ?v4 - type_2 ?v7 - type_1)
     :precondition (and (pred_1 ?v1 ?v7) (pred_4 ?v1 ?v4))
     :effect (and
        (pred_3 ?v1)
        (not (pred_4 ?v1 ?v4))
        (pred_1 ?v4 ?v7))
    )

    (:action op_1
     :parameters (?v1 - type_3 ?v2 - type_1 ?v6 - type_1)
     :precondition (and (pred_5 ?v2 ?v6) (pred_1 ?v1 ?v2) (not (= ?v2 ?v6)))
     :effect (and
        (not (pred_1 ?v1 ?v2))
        (pred_1 ?v1 ?v6)
        (pred_2 ?v1 ?v2))
        )
        
    )
)
