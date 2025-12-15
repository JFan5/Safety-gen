
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_4 - object
        type_1 - type_4
        type_3 - type_4
    )

    (:predicates
        (pred_3 ?v2 - type_4 ?v4 - type_2)
        (pred_2 ?v2 - type_3 ?v4 - type_1)
        (pred_5 ?v2 - type_3)
        (pred_1 ?v2 - type_2 ?v4 - type_2)
          (pred_4 ?v6 - type_3 ?v5 - type_2)   
    )

    (:action op_2
     :parameters (?v6 - type_3 ?v1 - type_1 ?v8 - type_2)
     :precondition (and (pred_3 ?v1 ?v8) (pred_3 ?v6 ?v8) (pred_5 ?v6))
     :effect (and
        (not (pred_3 ?v1 ?v8))
        (not (pred_5 ?v6))
        (pred_2 ?v6 ?v1))
    )

    (:action op_1
     :parameters (?v6 - type_3 ?v1 - type_1 ?v8 - type_2)
     :precondition (and (pred_3 ?v6 ?v8) (pred_2 ?v6 ?v1))
     :effect (and
        (pred_5 ?v6)
        (not (pred_2 ?v6 ?v1))
        (pred_3 ?v1 ?v8))
    )

    (:action op_3
     :parameters (?v6 - type_3 ?v7 - type_2 ?v3 - type_2)
     :precondition (and (pred_1 ?v7 ?v3) (pred_3 ?v6 ?v7) (not (= ?v7 ?v3)))
     :effect (and
        (not (pred_3 ?v6 ?v7))
        (pred_3 ?v6 ?v3)
        (pred_4 ?v6 ?v7))
        )
        
    )
)
