(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_1 ?v7)
		(pred_6 ?v8)
		(pred_4 ?v8)
		(pred_2 ?v7 ?v8)
		(pred_3)
		(pred_5 ?v7))

   (:action op_3
       :parameters  (?v6 ?v1)
       :precondition (and (not-eq ?v6 ?v1) 
                          (pred_6 ?v6) (pred_6 ?v1) (pred_4 ?v6))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v6))))


   (:action op_1
       :parameters (?v2 ?v5)
       :precondition  (and  (pred_1 ?v2) (pred_6 ?v5)
			    (pred_2 ?v2 ?v5) (pred_4 ?v5) (pred_3))
       :effect (and (pred_5 ?v2)
		    (not (pred_2 ?v2 ?v5)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v2  ?v5)
       :precondition  (and  (pred_1 ?v2) (pred_6 ?v5)
			    (pred_5 ?v2) (pred_4 ?v5))
       :effect (and (pred_2 ?v2 ?v5)
		    (pred_3)
		    (not (pred_5 ?v2)))))
