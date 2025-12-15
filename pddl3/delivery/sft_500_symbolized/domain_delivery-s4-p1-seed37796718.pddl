
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_1 - object
        type_2 - type_1
        type_3 - type_1
    )

    (:predicates
        (pred_2 ?v8 - type_1 ?v2 - type_4)
        (pred_5 ?v8 - type_3 ?v2 - type_2)
        (pred_4 ?v8 - type_3)
        (pred_3 ?v8 - type_4 ?v2 - type_4)
          (pred_1 ?v3 - type_3 ?v7 - type_4)   
    )

    (:action op_3
     :parameters (?v3 - type_3 ?v6 - type_2 ?v1 - type_4)
     :precondition (and (pred_2 ?v6 ?v1) (pred_2 ?v3 ?v1) (pred_4 ?v3))
     :effect (and
        (not (pred_2 ?v6 ?v1))
        (not (pred_4 ?v3))
        (pred_5 ?v3 ?v6))
    )

    (:action op_2
     :parameters (?v3 - type_3 ?v6 - type_2 ?v1 - type_4)
     :precondition (and (pred_2 ?v3 ?v1) (pred_5 ?v3 ?v6))
     :effect (and
        (pred_4 ?v3)
        (not (pred_5 ?v3 ?v6))
        (pred_2 ?v6 ?v1))
    )

    (:action op_1
     :parameters (?v3 - type_3 ?v5 - type_4 ?v4 - type_4)
     :precondition (and (pred_3 ?v5 ?v4) (pred_2 ?v3 ?v5) (not (= ?v5 ?v4)))
     :effect (and
        (not (pred_2 ?v3 ?v5))
        (pred_2 ?v3 ?v4)
        (pred_1 ?v3 ?v5))
        )
        
    )
)
