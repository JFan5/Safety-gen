(define (domain blocksworld)
  (:requirements :strips :constraints :negative-preconditions)
  (:predicates (pred_2 ?v4)
               (pred_4 ?v4)
               (pred_5)
               (pred_1 ?v4)
               (pred_3 ?v4 ?v3))

  (:action op_2
    :parameters (?v1)
    :precondition (and (pred_2 ?v1) (pred_4 ?v1) (pred_5))
    :effect (and (pred_1 ?v1) (not (pred_2 ?v1)) (not (pred_4 ?v1)) 
                 (not (pred_5))))

  (:action op_3
    :parameters  (?v1)
    :precondition (pred_1 ?v1)
    :effect (and (pred_2 ?v1) (pred_5) (pred_4 ?v1) 
                 (not (pred_1 ?v1))))

  (:action op_4
    :parameters  (?v1 ?v2)
    :precondition (and (pred_2 ?v2) (pred_1 ?v1))
    :effect (and (pred_5) (pred_2 ?v1) (pred_3 ?v1 ?v2)
                 (not (pred_2 ?v2)) (not (pred_1 ?v1))))

  (:action op_1
    :parameters  (?v1 ?v2)
    :precondition (and (pred_3 ?v1 ?v2) (pred_2 ?v1) (pred_5))
    :effect (and (pred_1 ?v1) (pred_2 ?v2)
                 (not (pred_3 ?v1 ?v2)) (not (pred_2 ?v1)) (not (pred_5)))))
