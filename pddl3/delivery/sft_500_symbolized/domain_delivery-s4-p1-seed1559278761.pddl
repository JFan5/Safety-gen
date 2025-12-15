
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_4 - object
        type_2 - type_4
        type_1 - type_4
    )

    (:predicates
        (pred_2 ?v3 - type_4 ?v2 - type_3)
        (pred_3 ?v3 - type_1 ?v2 - type_2)
        (pred_5 ?v3 - type_1)
        (pred_1 ?v3 - type_3 ?v2 - type_3)
          (pred_4 ?v1 - type_1 ?v8 - type_3)   
    )

    (:action op_1
     :parameters (?v1 - type_1 ?v5 - type_2 ?v4 - type_3)
     :precondition (and (pred_2 ?v5 ?v4) (pred_2 ?v1 ?v4) (pred_5 ?v1))
     :effect (and
        (not (pred_2 ?v5 ?v4))
        (not (pred_5 ?v1))
        (pred_3 ?v1 ?v5))
    )

    (:action op_3
     :parameters (?v1 - type_1 ?v5 - type_2 ?v4 - type_3)
     :precondition (and (pred_2 ?v1 ?v4) (pred_3 ?v1 ?v5))
     :effect (and
        (pred_5 ?v1)
        (not (pred_3 ?v1 ?v5))
        (pred_2 ?v5 ?v4))
    )

    (:action op_2
     :parameters (?v1 - type_1 ?v7 - type_3 ?v6 - type_3)
     :precondition (and (pred_1 ?v7 ?v6) (pred_2 ?v1 ?v7) (not (= ?v7 ?v6)))
     :effect (and
        (not (pred_2 ?v1 ?v7))
        (pred_2 ?v1 ?v6)
        (pred_4 ?v1 ?v7))
        )
        
    )
)
