(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v3)
		(pred_5 ?v4)
		(pred_1 ?v8)
		(pred_2 ?v8)
		(pred_6 ?v4 ?v8)
		(pred_4)
		(pred_3 ?v4))

   (:action op_1
       :parameters  (?v7 ?v1)
       :precondition (and (not-eq ?v7 ?v1) 
                          (pred_1 ?v7) (pred_1 ?v1) (pred_2 ?v7))
       :effect (and  (pred_2 ?v1)
		     (not (pred_2 ?v7))))


   (:action op_3
       :parameters (?v2 ?v5)
       :precondition  (and  (pred_5 ?v2) (pred_1 ?v5)
			    (pred_6 ?v2 ?v5) (pred_2 ?v5) (pred_4))
       :effect (and (pred_3 ?v2)
		    (not (pred_6 ?v2 ?v5)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v2  ?v5)
       :precondition  (and  (pred_5 ?v2) (pred_1 ?v5)
			    (pred_3 ?v2) (pred_2 ?v5))
       :effect (and (pred_6 ?v2 ?v5)
		    (pred_4)
		    (not (pred_3 ?v2)))))
