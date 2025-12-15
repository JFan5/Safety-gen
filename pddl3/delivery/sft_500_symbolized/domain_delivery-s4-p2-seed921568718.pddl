
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_3 - object
        type_1 - type_3
        type_2 - type_3
    )

    (:predicates
        (pred_4 ?v3 - type_3 ?v2 - type_4)
        (pred_3 ?v3 - type_2 ?v2 - type_1)
        (pred_1 ?v3 - type_2)
        (pred_2 ?v3 - type_4 ?v2 - type_4)
          (pred_5 ?v5 - type_2 ?v1 - type_4)   
    )

    (:action op_1
     :parameters (?v5 - type_2 ?v8 - type_1 ?v4 - type_4)
     :precondition (and (pred_4 ?v8 ?v4) (pred_4 ?v5 ?v4) (pred_1 ?v5))
     :effect (and
        (not (pred_4 ?v8 ?v4))
        (not (pred_1 ?v5))
        (pred_3 ?v5 ?v8))
    )

    (:action op_3
     :parameters (?v5 - type_2 ?v8 - type_1 ?v4 - type_4)
     :precondition (and (pred_4 ?v5 ?v4) (pred_3 ?v5 ?v8))
     :effect (and
        (pred_1 ?v5)
        (not (pred_3 ?v5 ?v8))
        (pred_4 ?v8 ?v4))
    )

    (:action op_2
     :parameters (?v5 - type_2 ?v7 - type_4 ?v6 - type_4)
     :precondition (and (pred_2 ?v7 ?v6) (pred_4 ?v5 ?v7) (not (= ?v7 ?v6)))
     :effect (and
        (not (pred_4 ?v5 ?v7))
        (pred_4 ?v5 ?v6)
        (pred_5 ?v5 ?v7))
        )
        
    )
)
