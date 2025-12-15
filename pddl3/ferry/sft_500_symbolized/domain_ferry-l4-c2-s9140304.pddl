(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v7)
		(pred_4 ?v1)
		(pred_6 ?v8)
		(pred_2 ?v8)
		(pred_3 ?v1 ?v8)
		(pred_1)
		(pred_5 ?v1))

   (:action op_3
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_6 ?v6) (pred_6 ?v5) (pred_2 ?v6))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v6))))


   (:action op_1
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_4 ?v2) (pred_6 ?v4)
			    (pred_3 ?v2 ?v4) (pred_2 ?v4) (pred_1))
       :effect (and (pred_5 ?v2)
		    (not (pred_3 ?v2 ?v4)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_4 ?v2) (pred_6 ?v4)
			    (pred_5 ?v2) (pred_2 ?v4))
       :effect (and (pred_3 ?v2 ?v4)
		    (pred_1)
		    (not (pred_5 ?v2)))))
