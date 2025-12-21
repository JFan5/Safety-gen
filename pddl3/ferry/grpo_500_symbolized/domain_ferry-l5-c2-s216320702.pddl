(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v3)
		(pred_6 ?v5)
		(pred_3 ?v2)
		(pred_2 ?v2)
		(pred_5 ?v5 ?v2)
		(pred_4)
		(pred_1 ?v5))

   (:action op_1
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_3 ?v1) (pred_3 ?v4) (pred_2 ?v1))
       :effect (and  (pred_2 ?v4)
		     (not (pred_2 ?v1))))


   (:action op_3
       :parameters (?v7 ?v8)
       :precondition  (and  (pred_6 ?v7) (pred_3 ?v8)
			    (pred_5 ?v7 ?v8) (pred_2 ?v8) (pred_4))
       :effect (and (pred_1 ?v7)
		    (not (pred_5 ?v7 ?v8)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v7  ?v8)
       :precondition  (and  (pred_6 ?v7) (pred_3 ?v8)
			    (pred_1 ?v7) (pred_2 ?v8))
       :effect (and (pred_5 ?v7 ?v8)
		    (pred_4)
		    (not (pred_1 ?v7)))))
