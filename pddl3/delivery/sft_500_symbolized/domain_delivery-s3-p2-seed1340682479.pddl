
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_3 - object
        type_4 - type_3
        type_1 - type_3
    )

    (:predicates
        (pred_4 ?v1 - type_3 ?v7 - type_2)
        (pred_1 ?v1 - type_1 ?v7 - type_4)
        (pred_3 ?v1 - type_1)
        (pred_2 ?v1 - type_2 ?v7 - type_2)
          (pred_5 ?v2 - type_1 ?v3 - type_2)   
    )

    (:action op_3
     :parameters (?v2 - type_1 ?v8 - type_4 ?v4 - type_2)
     :precondition (and (pred_4 ?v8 ?v4) (pred_4 ?v2 ?v4) (pred_3 ?v2))
     :effect (and
        (not (pred_4 ?v8 ?v4))
        (not (pred_3 ?v2))
        (pred_1 ?v2 ?v8))
    )

    (:action op_1
     :parameters (?v2 - type_1 ?v8 - type_4 ?v4 - type_2)
     :precondition (and (pred_4 ?v2 ?v4) (pred_1 ?v2 ?v8))
     :effect (and
        (pred_3 ?v2)
        (not (pred_1 ?v2 ?v8))
        (pred_4 ?v8 ?v4))
    )

    (:action op_2
     :parameters (?v2 - type_1 ?v5 - type_2 ?v6 - type_2)
     :precondition (and (pred_2 ?v5 ?v6) (pred_4 ?v2 ?v5) (not (= ?v5 ?v6)))
     :effect (and
        (not (pred_4 ?v2 ?v5))
        (pred_4 ?v2 ?v6)
        (pred_5 ?v2 ?v5))
        )
        
    )
)
