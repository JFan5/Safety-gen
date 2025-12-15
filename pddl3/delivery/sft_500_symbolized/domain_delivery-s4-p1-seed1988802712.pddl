
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_2 - object
        type_3 - type_2
        type_1 - type_2
    )

    (:predicates
        (pred_3 ?v6 - type_2 ?v2 - type_4)
        (pred_5 ?v6 - type_1 ?v2 - type_3)
        (pred_2 ?v6 - type_1)
        (pred_4 ?v6 - type_4 ?v2 - type_4)
          (pred_1 ?v1 - type_1 ?v4 - type_4)   
    )

    (:action op_1
     :parameters (?v1 - type_1 ?v7 - type_3 ?v3 - type_4)
     :precondition (and (pred_3 ?v7 ?v3) (pred_3 ?v1 ?v3) (pred_2 ?v1))
     :effect (and
        (not (pred_3 ?v7 ?v3))
        (not (pred_2 ?v1))
        (pred_5 ?v1 ?v7))
    )

    (:action op_3
     :parameters (?v1 - type_1 ?v7 - type_3 ?v3 - type_4)
     :precondition (and (pred_3 ?v1 ?v3) (pred_5 ?v1 ?v7))
     :effect (and
        (pred_2 ?v1)
        (not (pred_5 ?v1 ?v7))
        (pred_3 ?v7 ?v3))
    )

    (:action op_2
     :parameters (?v1 - type_1 ?v5 - type_4 ?v8 - type_4)
     :precondition (and (pred_4 ?v5 ?v8) (pred_3 ?v1 ?v5) (not (= ?v5 ?v8)))
     :effect (and
        (not (pred_3 ?v1 ?v5))
        (pred_3 ?v1 ?v8)
        (pred_1 ?v1 ?v5))
        )
        
    )
)
