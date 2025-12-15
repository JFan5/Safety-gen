
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_3 - object
        type_1 - type_3
        type_2 - type_3
    )

    (:predicates
        (pred_3 ?v8 - type_3 ?v2 - type_4)
        (pred_2 ?v8 - type_2 ?v2 - type_1)
        (pred_4 ?v8 - type_2)
        (pred_1 ?v8 - type_4 ?v2 - type_4)
          (pred_5 ?v7 - type_2 ?v4 - type_4)   
    )

    (:action op_1
     :parameters (?v7 - type_2 ?v6 - type_1 ?v3 - type_4)
     :precondition (and (pred_3 ?v6 ?v3) (pred_3 ?v7 ?v3) (pred_4 ?v7))
     :effect (and
        (not (pred_3 ?v6 ?v3))
        (not (pred_4 ?v7))
        (pred_2 ?v7 ?v6))
    )

    (:action op_2
     :parameters (?v7 - type_2 ?v6 - type_1 ?v3 - type_4)
     :precondition (and (pred_3 ?v7 ?v3) (pred_2 ?v7 ?v6))
     :effect (and
        (pred_4 ?v7)
        (not (pred_2 ?v7 ?v6))
        (pred_3 ?v6 ?v3))
    )

    (:action op_3
     :parameters (?v7 - type_2 ?v1 - type_4 ?v5 - type_4)
     :precondition (and (pred_1 ?v1 ?v5) (pred_3 ?v7 ?v1) (not (= ?v1 ?v5)))
     :effect (and
        (not (pred_3 ?v7 ?v1))
        (pred_3 ?v7 ?v5)
        (pred_5 ?v7 ?v1))
        )
        
    )
)
