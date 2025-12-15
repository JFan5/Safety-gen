
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_1 - object
        type_2 - type_1
        type_3 - type_1
    )

    (:predicates
        (pred_2 ?v5 - type_1 ?v7 - type_4)
        (pred_1 ?v5 - type_3 ?v7 - type_2)
        (pred_3 ?v5 - type_3)
        (pred_5 ?v5 - type_4 ?v7 - type_4)
          (pred_4 ?v6 - type_3 ?v4 - type_4)   
    )

    (:action op_2
     :parameters (?v6 - type_3 ?v8 - type_2 ?v2 - type_4)
     :precondition (and (pred_2 ?v8 ?v2) (pred_2 ?v6 ?v2) (pred_3 ?v6))
     :effect (and
        (not (pred_2 ?v8 ?v2))
        (not (pred_3 ?v6))
        (pred_1 ?v6 ?v8))
    )

    (:action op_1
     :parameters (?v6 - type_3 ?v8 - type_2 ?v2 - type_4)
     :precondition (and (pred_2 ?v6 ?v2) (pred_1 ?v6 ?v8))
     :effect (and
        (pred_3 ?v6)
        (not (pred_1 ?v6 ?v8))
        (pred_2 ?v8 ?v2))
    )

    (:action op_3
     :parameters (?v6 - type_3 ?v1 - type_4 ?v3 - type_4)
     :precondition (and (pred_5 ?v1 ?v3) (pred_2 ?v6 ?v1) (not (= ?v1 ?v3)))
     :effect (and
        (not (pred_2 ?v6 ?v1))
        (pred_2 ?v6 ?v3)
        (pred_4 ?v6 ?v1))
        )
        
    )
)
