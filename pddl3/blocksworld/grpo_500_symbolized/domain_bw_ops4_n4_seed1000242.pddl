(define (domain blocksworld)
  (:requirements :strips :constraints :negative-preconditions)
  (:predicates (pred_3 ?v4)
               (pred_1 ?v4)
               (pred_2)
               (pred_4 ?v4)
               (pred_5 ?v4 ?v3))

  (:action op_2
    :parameters (?v2)
    :precondition (and (pred_3 ?v2) (pred_1 ?v2) (pred_2))
    :effect (and (pred_4 ?v2) (not (pred_3 ?v2)) (not (pred_1 ?v2)) 
                 (not (pred_2))))

  (:action op_4
    :parameters  (?v2)
    :precondition (pred_4 ?v2)
    :effect (and (pred_3 ?v2) (pred_2) (pred_1 ?v2) 
                 (not (pred_4 ?v2))))

  (:action op_3
    :parameters  (?v2 ?v1)
    :precondition (and (pred_3 ?v1) (pred_4 ?v2))
    :effect (and (pred_2) (pred_3 ?v2) (pred_5 ?v2 ?v1)
                 (not (pred_3 ?v1)) (not (pred_4 ?v2))))

  (:action op_1
    :parameters  (?v2 ?v1)
    :precondition (and (pred_5 ?v2 ?v1) (pred_3 ?v2) (pred_2))
    :effect (and (pred_4 ?v2) (pred_3 ?v1)
                 (not (pred_5 ?v2 ?v1)) (not (pred_3 ?v2)) (not (pred_2)))))
