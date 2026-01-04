(define (domain blocksworld)
  (:requirements :strips :constraints :negative-preconditions)
  (:predicates (pred_5 ?v3)
               (pred_4 ?v3)
               (pred_3)
               (pred_1 ?v3)
               (pred_2 ?v3 ?v4))

  (:action op_3
    :parameters (?v1)
    :precondition (and (pred_5 ?v1) (pred_4 ?v1) (pred_3))
    :effect (and (pred_1 ?v1) (not (pred_5 ?v1)) (not (pred_4 ?v1)) 
                 (not (pred_3))))

  (:action op_4
    :parameters  (?v1)
    :precondition (pred_1 ?v1)
    :effect (and (pred_5 ?v1) (pred_3) (pred_4 ?v1) 
                 (not (pred_1 ?v1))))

  (:action op_1
    :parameters  (?v1 ?v2)
    :precondition (and (pred_5 ?v2) (pred_1 ?v1))
    :effect (and (pred_3) (pred_5 ?v1) (pred_2 ?v1 ?v2)
                 (not (pred_5 ?v2)) (not (pred_1 ?v1))))

  (:action op_2
    :parameters  (?v1 ?v2)
    :precondition (and (pred_2 ?v1 ?v2) (pred_5 ?v1) (pred_3))
    :effect (and (pred_1 ?v1) (pred_5 ?v2)
                 (not (pred_2 ?v1 ?v2)) (not (pred_5 ?v1)) (not (pred_3)))))
