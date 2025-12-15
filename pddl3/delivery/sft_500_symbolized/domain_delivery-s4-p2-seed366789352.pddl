
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_4 - object
        type_1 - type_4
        type_3 - type_4
    )

    (:predicates
        (pred_2 ?v4 - type_4 ?v2 - type_2)
        (pred_5 ?v4 - type_3 ?v2 - type_1)
        (pred_3 ?v4 - type_3)
        (pred_4 ?v4 - type_2 ?v2 - type_2)
          (pred_1 ?v5 - type_3 ?v7 - type_2)   
    )

    (:action op_2
     :parameters (?v5 - type_3 ?v8 - type_1 ?v3 - type_2)
     :precondition (and (pred_2 ?v8 ?v3) (pred_2 ?v5 ?v3) (pred_3 ?v5))
     :effect (and
        (not (pred_2 ?v8 ?v3))
        (not (pred_3 ?v5))
        (pred_5 ?v5 ?v8))
    )

    (:action op_1
     :parameters (?v5 - type_3 ?v8 - type_1 ?v3 - type_2)
     :precondition (and (pred_2 ?v5 ?v3) (pred_5 ?v5 ?v8))
     :effect (and
        (pred_3 ?v5)
        (not (pred_5 ?v5 ?v8))
        (pred_2 ?v8 ?v3))
    )

    (:action op_3
     :parameters (?v5 - type_3 ?v1 - type_2 ?v6 - type_2)
     :precondition (and (pred_4 ?v1 ?v6) (pred_2 ?v5 ?v1) (not (= ?v1 ?v6)))
     :effect (and
        (not (pred_2 ?v5 ?v1))
        (pred_2 ?v5 ?v6)
        (pred_1 ?v5 ?v1))
        )
        
    )
)
