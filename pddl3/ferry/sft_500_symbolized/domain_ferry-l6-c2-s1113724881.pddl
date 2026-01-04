(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_2 ?v3)
		(pred_4 ?v7)
		(pred_5 ?v7)
		(pred_6 ?v3 ?v7)
		(pred_1)
		(pred_3 ?v3))

   (:action op_1
       :parameters  (?v6 ?v2)
       :precondition (and (not-eq ?v6 ?v2) 
                          (pred_4 ?v6) (pred_4 ?v2) (pred_5 ?v6))
       :effect (and  (pred_5 ?v2)
		     (not (pred_5 ?v6))))


   (:action op_3
       :parameters (?v4 ?v5)
       :precondition  (and  (pred_2 ?v4) (pred_4 ?v5)
			    (pred_6 ?v4 ?v5) (pred_5 ?v5) (pred_1))
       :effect (and (pred_3 ?v4)
		    (not (pred_6 ?v4 ?v5)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v4  ?v5)
       :precondition  (and  (pred_2 ?v4) (pred_4 ?v5)
			    (pred_3 ?v4) (pred_5 ?v5))
       :effect (and (pred_6 ?v4 ?v5)
		    (pred_1)
		    (not (pred_3 ?v4)))))
