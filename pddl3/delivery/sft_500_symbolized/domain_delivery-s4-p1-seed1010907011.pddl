
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_1 - object
        type_2 - type_1
        type_3 - type_1
    )

    (:predicates
        (pred_2 ?v7 - type_1 ?v6 - type_4)
        (pred_5 ?v7 - type_3 ?v6 - type_2)
        (pred_1 ?v7 - type_3)
        (pred_4 ?v7 - type_4 ?v6 - type_4)
          (pred_3 ?v3 - type_3 ?v8 - type_4)   
    )

    (:action op_1
     :parameters (?v3 - type_3 ?v2 - type_2 ?v1 - type_4)
     :precondition (and (pred_2 ?v2 ?v1) (pred_2 ?v3 ?v1) (pred_1 ?v3))
     :effect (and
        (not (pred_2 ?v2 ?v1))
        (not (pred_1 ?v3))
        (pred_5 ?v3 ?v2))
    )

    (:action op_2
     :parameters (?v3 - type_3 ?v2 - type_2 ?v1 - type_4)
     :precondition (and (pred_2 ?v3 ?v1) (pred_5 ?v3 ?v2))
     :effect (and
        (pred_1 ?v3)
        (not (pred_5 ?v3 ?v2))
        (pred_2 ?v2 ?v1))
    )

    (:action op_3
     :parameters (?v3 - type_3 ?v4 - type_4 ?v5 - type_4)
     :precondition (and (pred_4 ?v4 ?v5) (pred_2 ?v3 ?v4) (not (= ?v4 ?v5)))
     :effect (and
        (not (pred_2 ?v3 ?v4))
        (pred_2 ?v3 ?v5)
        (pred_3 ?v3 ?v4))
        )
        
    )
)
