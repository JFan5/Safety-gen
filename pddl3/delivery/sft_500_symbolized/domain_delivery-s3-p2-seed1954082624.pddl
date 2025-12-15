
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_4 - object
        type_2 - type_4
        type_3 - type_4
    )

    (:predicates
        (pred_3 ?v3 - type_4 ?v4 - type_1)
        (pred_4 ?v3 - type_3 ?v4 - type_2)
        (pred_1 ?v3 - type_3)
        (pred_2 ?v3 - type_1 ?v4 - type_1)
          (pred_5 ?v5 - type_3 ?v2 - type_1)   
    )

    (:action op_2
     :parameters (?v5 - type_3 ?v1 - type_2 ?v7 - type_1)
     :precondition (and (pred_3 ?v1 ?v7) (pred_3 ?v5 ?v7) (pred_1 ?v5))
     :effect (and
        (not (pred_3 ?v1 ?v7))
        (not (pred_1 ?v5))
        (pred_4 ?v5 ?v1))
    )

    (:action op_3
     :parameters (?v5 - type_3 ?v1 - type_2 ?v7 - type_1)
     :precondition (and (pred_3 ?v5 ?v7) (pred_4 ?v5 ?v1))
     :effect (and
        (pred_1 ?v5)
        (not (pred_4 ?v5 ?v1))
        (pred_3 ?v1 ?v7))
    )

    (:action op_1
     :parameters (?v5 - type_3 ?v8 - type_1 ?v6 - type_1)
     :precondition (and (pred_2 ?v8 ?v6) (pred_3 ?v5 ?v8) (not (= ?v8 ?v6)))
     :effect (and
        (not (pred_3 ?v5 ?v8))
        (pred_3 ?v5 ?v6)
        (pred_5 ?v5 ?v8))
        )
        
    )
)
