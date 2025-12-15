
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_2 - object
        type_4 - type_2
        type_3 - type_2
    )

    (:predicates
        (pred_3 ?v1 - type_2 ?v4 - type_1)
        (pred_1 ?v1 - type_3 ?v4 - type_4)
        (pred_5 ?v1 - type_3)
        (pred_2 ?v1 - type_1 ?v4 - type_1)
          (pred_4 ?v3 - type_3 ?v2 - type_1)   
    )

    (:action op_1
     :parameters (?v3 - type_3 ?v6 - type_4 ?v7 - type_1)
     :precondition (and (pred_3 ?v6 ?v7) (pred_3 ?v3 ?v7) (pred_5 ?v3))
     :effect (and
        (not (pred_3 ?v6 ?v7))
        (not (pred_5 ?v3))
        (pred_1 ?v3 ?v6))
    )

    (:action op_3
     :parameters (?v3 - type_3 ?v6 - type_4 ?v7 - type_1)
     :precondition (and (pred_3 ?v3 ?v7) (pred_1 ?v3 ?v6))
     :effect (and
        (pred_5 ?v3)
        (not (pred_1 ?v3 ?v6))
        (pred_3 ?v6 ?v7))
    )

    (:action op_2
     :parameters (?v3 - type_3 ?v8 - type_1 ?v5 - type_1)
     :precondition (and (pred_2 ?v8 ?v5) (pred_3 ?v3 ?v8) (not (= ?v8 ?v5)))
     :effect (and
        (not (pred_3 ?v3 ?v8))
        (pred_3 ?v3 ?v5)
        (pred_4 ?v3 ?v8))
        )
        
    )
)
