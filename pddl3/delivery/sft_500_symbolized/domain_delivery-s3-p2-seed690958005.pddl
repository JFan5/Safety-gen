
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_1 - object
        type_2 - type_1
        type_4 - type_1
    )

    (:predicates
        (pred_5 ?v7 - type_1 ?v8 - type_3)
        (pred_3 ?v7 - type_4 ?v8 - type_2)
        (pred_1 ?v7 - type_4)
        (pred_4 ?v7 - type_3 ?v8 - type_3)
          (pred_2 ?v2 - type_4 ?v4 - type_3)   
    )

    (:action op_1
     :parameters (?v2 - type_4 ?v6 - type_2 ?v1 - type_3)
     :precondition (and (pred_5 ?v6 ?v1) (pred_5 ?v2 ?v1) (pred_1 ?v2))
     :effect (and
        (not (pred_5 ?v6 ?v1))
        (not (pred_1 ?v2))
        (pred_3 ?v2 ?v6))
    )

    (:action op_2
     :parameters (?v2 - type_4 ?v6 - type_2 ?v1 - type_3)
     :precondition (and (pred_5 ?v2 ?v1) (pred_3 ?v2 ?v6))
     :effect (and
        (pred_1 ?v2)
        (not (pred_3 ?v2 ?v6))
        (pred_5 ?v6 ?v1))
    )

    (:action op_3
     :parameters (?v2 - type_4 ?v3 - type_3 ?v5 - type_3)
     :precondition (and (pred_4 ?v3 ?v5) (pred_5 ?v2 ?v3) (not (= ?v3 ?v5)))
     :effect (and
        (not (pred_5 ?v2 ?v3))
        (pred_5 ?v2 ?v5)
        (pred_2 ?v2 ?v3))
        )
        
    )
)
