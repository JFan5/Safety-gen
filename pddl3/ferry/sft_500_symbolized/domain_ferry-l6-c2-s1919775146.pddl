(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v4)
		(pred_3 ?v7)
		(pred_2 ?v2)
		(pred_6 ?v2)
		(pred_5 ?v7 ?v2)
		(pred_1)
		(pred_4 ?v7))

   (:action op_2
       :parameters  (?v6 ?v3)
       :precondition (and (not-eq ?v6 ?v3) 
                          (pred_2 ?v6) (pred_2 ?v3) (pred_6 ?v6))
       :effect (and  (pred_6 ?v3)
		     (not (pred_6 ?v6))))


   (:action op_1
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_3 ?v5) (pred_2 ?v1)
			    (pred_5 ?v5 ?v1) (pred_6 ?v1) (pred_1))
       :effect (and (pred_4 ?v5)
		    (not (pred_5 ?v5 ?v1)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_3 ?v5) (pred_2 ?v1)
			    (pred_4 ?v5) (pred_6 ?v1))
       :effect (and (pred_5 ?v5 ?v1)
		    (pred_1)
		    (not (pred_4 ?v5)))))
