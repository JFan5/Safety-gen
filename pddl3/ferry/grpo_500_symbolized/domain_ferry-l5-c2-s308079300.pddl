(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v8)
		(pred_6 ?v5)
		(pred_3 ?v1)
		(pred_1 ?v1)
		(pred_2 ?v5 ?v1)
		(pred_5)
		(pred_4 ?v5))

   (:action op_2
       :parameters  (?v3 ?v2)
       :precondition (and (not-eq ?v3 ?v2) 
                          (pred_3 ?v3) (pred_3 ?v2) (pred_1 ?v3))
       :effect (and  (pred_1 ?v2)
		     (not (pred_1 ?v3))))


   (:action op_1
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_6 ?v7) (pred_3 ?v4)
			    (pred_2 ?v7 ?v4) (pred_1 ?v4) (pred_5))
       :effect (and (pred_4 ?v7)
		    (not (pred_2 ?v7 ?v4)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_6 ?v7) (pred_3 ?v4)
			    (pred_4 ?v7) (pred_1 ?v4))
       :effect (and (pred_2 ?v7 ?v4)
		    (pred_5)
		    (not (pred_4 ?v7)))))
