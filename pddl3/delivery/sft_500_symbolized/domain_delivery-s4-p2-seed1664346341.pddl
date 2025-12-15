
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_2 - object
        type_3 - type_2
        type_4 - type_2
    )

    (:predicates
        (pred_5 ?v7 - type_2 ?v1 - type_1)
        (pred_4 ?v7 - type_4 ?v1 - type_3)
        (pred_2 ?v7 - type_4)
        (pred_3 ?v7 - type_1 ?v1 - type_1)
          (pred_1 ?v5 - type_4 ?v2 - type_1)   
    )

    (:action op_3
     :parameters (?v5 - type_4 ?v4 - type_3 ?v8 - type_1)
     :precondition (and (pred_5 ?v4 ?v8) (pred_5 ?v5 ?v8) (pred_2 ?v5))
     :effect (and
        (not (pred_5 ?v4 ?v8))
        (not (pred_2 ?v5))
        (pred_4 ?v5 ?v4))
    )

    (:action op_2
     :parameters (?v5 - type_4 ?v4 - type_3 ?v8 - type_1)
     :precondition (and (pred_5 ?v5 ?v8) (pred_4 ?v5 ?v4))
     :effect (and
        (pred_2 ?v5)
        (not (pred_4 ?v5 ?v4))
        (pred_5 ?v4 ?v8))
    )

    (:action op_1
     :parameters (?v5 - type_4 ?v3 - type_1 ?v6 - type_1)
     :precondition (and (pred_3 ?v3 ?v6) (pred_5 ?v5 ?v3) (not (= ?v3 ?v6)))
     :effect (and
        (not (pred_5 ?v5 ?v3))
        (pred_5 ?v5 ?v6)
        (pred_1 ?v5 ?v3))
        )
        
    )
)
