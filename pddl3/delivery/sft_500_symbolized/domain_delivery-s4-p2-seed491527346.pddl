
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_2 - object
        type_1 - type_2
        type_3 - type_2
    )

    (:predicates
        (pred_3 ?v6 - type_2 ?v3 - type_4)
        (pred_1 ?v6 - type_3 ?v3 - type_1)
        (pred_2 ?v6 - type_3)
        (pred_4 ?v6 - type_4 ?v3 - type_4)
          (pred_5 ?v4 - type_3 ?v7 - type_4)   
    )

    (:action op_2
     :parameters (?v4 - type_3 ?v1 - type_1 ?v8 - type_4)
     :precondition (and (pred_3 ?v1 ?v8) (pred_3 ?v4 ?v8) (pred_2 ?v4))
     :effect (and
        (not (pred_3 ?v1 ?v8))
        (not (pred_2 ?v4))
        (pred_1 ?v4 ?v1))
    )

    (:action op_3
     :parameters (?v4 - type_3 ?v1 - type_1 ?v8 - type_4)
     :precondition (and (pred_3 ?v4 ?v8) (pred_1 ?v4 ?v1))
     :effect (and
        (pred_2 ?v4)
        (not (pred_1 ?v4 ?v1))
        (pred_3 ?v1 ?v8))
    )

    (:action op_1
     :parameters (?v4 - type_3 ?v2 - type_4 ?v5 - type_4)
     :precondition (and (pred_4 ?v2 ?v5) (pred_3 ?v4 ?v2) (not (= ?v2 ?v5)))
     :effect (and
        (not (pred_3 ?v4 ?v2))
        (pred_3 ?v4 ?v5)
        (pred_5 ?v4 ?v2))
        )
        
    )
)
