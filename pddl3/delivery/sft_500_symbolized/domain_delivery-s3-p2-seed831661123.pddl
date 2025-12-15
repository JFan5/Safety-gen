
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_2 - object
        type_4 - type_2
        type_3 - type_2
    )

    (:predicates
        (pred_1 ?v6 - type_2 ?v8 - type_1)
        (pred_2 ?v6 - type_3 ?v8 - type_4)
        (pred_5 ?v6 - type_3)
        (pred_4 ?v6 - type_1 ?v8 - type_1)
          (pred_3 ?v3 - type_3 ?v2 - type_1)   
    )

    (:action op_1
     :parameters (?v3 - type_3 ?v4 - type_4 ?v1 - type_1)
     :precondition (and (pred_1 ?v4 ?v1) (pred_1 ?v3 ?v1) (pred_5 ?v3))
     :effect (and
        (not (pred_1 ?v4 ?v1))
        (not (pred_5 ?v3))
        (pred_2 ?v3 ?v4))
    )

    (:action op_3
     :parameters (?v3 - type_3 ?v4 - type_4 ?v1 - type_1)
     :precondition (and (pred_1 ?v3 ?v1) (pred_2 ?v3 ?v4))
     :effect (and
        (pred_5 ?v3)
        (not (pred_2 ?v3 ?v4))
        (pred_1 ?v4 ?v1))
    )

    (:action op_2
     :parameters (?v3 - type_3 ?v7 - type_1 ?v5 - type_1)
     :precondition (and (pred_4 ?v7 ?v5) (pred_1 ?v3 ?v7) (not (= ?v7 ?v5)))
     :effect (and
        (not (pred_1 ?v3 ?v7))
        (pred_1 ?v3 ?v5)
        (pred_3 ?v3 ?v7))
        )
        
    )
)
