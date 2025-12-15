
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_4 - object
        type_1 - type_4
        type_2 - type_4
    )

    (:predicates
        (pred_3 ?v3 - type_4 ?v2 - type_3)
        (pred_5 ?v3 - type_2 ?v2 - type_1)
        (pred_2 ?v3 - type_2)
        (pred_1 ?v3 - type_3 ?v2 - type_3)
          (pred_4 ?v4 - type_2 ?v7 - type_3)   
    )

    (:action op_2
     :parameters (?v4 - type_2 ?v8 - type_1 ?v6 - type_3)
     :precondition (and (pred_3 ?v8 ?v6) (pred_3 ?v4 ?v6) (pred_2 ?v4))
     :effect (and
        (not (pred_3 ?v8 ?v6))
        (not (pred_2 ?v4))
        (pred_5 ?v4 ?v8))
    )

    (:action op_1
     :parameters (?v4 - type_2 ?v8 - type_1 ?v6 - type_3)
     :precondition (and (pred_3 ?v4 ?v6) (pred_5 ?v4 ?v8))
     :effect (and
        (pred_2 ?v4)
        (not (pred_5 ?v4 ?v8))
        (pred_3 ?v8 ?v6))
    )

    (:action op_3
     :parameters (?v4 - type_2 ?v1 - type_3 ?v5 - type_3)
     :precondition (and (pred_1 ?v1 ?v5) (pred_3 ?v4 ?v1) (not (= ?v1 ?v5)))
     :effect (and
        (not (pred_3 ?v4 ?v1))
        (pred_3 ?v4 ?v5)
        (pred_4 ?v4 ?v1))
        )
        
    )
)
