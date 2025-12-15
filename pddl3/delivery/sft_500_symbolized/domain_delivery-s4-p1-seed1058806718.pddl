
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_2 - object
        type_1 - type_2
        type_3 - type_2
    )

    (:predicates
        (pred_4 ?v2 - type_2 ?v3 - type_4)
        (pred_5 ?v2 - type_3 ?v3 - type_1)
        (pred_1 ?v2 - type_3)
        (pred_2 ?v2 - type_4 ?v3 - type_4)
          (pred_3 ?v1 - type_3 ?v4 - type_4)   
    )

    (:action op_1
     :parameters (?v1 - type_3 ?v8 - type_1 ?v5 - type_4)
     :precondition (and (pred_4 ?v8 ?v5) (pred_4 ?v1 ?v5) (pred_1 ?v1))
     :effect (and
        (not (pred_4 ?v8 ?v5))
        (not (pred_1 ?v1))
        (pred_5 ?v1 ?v8))
    )

    (:action op_3
     :parameters (?v1 - type_3 ?v8 - type_1 ?v5 - type_4)
     :precondition (and (pred_4 ?v1 ?v5) (pred_5 ?v1 ?v8))
     :effect (and
        (pred_1 ?v1)
        (not (pred_5 ?v1 ?v8))
        (pred_4 ?v8 ?v5))
    )

    (:action op_2
     :parameters (?v1 - type_3 ?v7 - type_4 ?v6 - type_4)
     :precondition (and (pred_2 ?v7 ?v6) (pred_4 ?v1 ?v7) (not (= ?v7 ?v6)))
     :effect (and
        (not (pred_4 ?v1 ?v7))
        (pred_4 ?v1 ?v6)
        (pred_3 ?v1 ?v7))
        )
        
    )
)
