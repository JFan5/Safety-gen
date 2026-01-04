(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_5 ?v2)
		(pred_3 ?v7)
		(pred_1 ?v7)
		(pred_4 ?v2 ?v7)
		(pred_6)
		(pred_2 ?v2))

   (:action op_1
       :parameters  (?v6 ?v4)
       :precondition (and (not-eq ?v6 ?v4) 
                          (pred_3 ?v6) (pred_3 ?v4) (pred_1 ?v6))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v6))))


   (:action op_3
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_5 ?v5) (pred_3 ?v1)
			    (pred_4 ?v5 ?v1) (pred_1 ?v1) (pred_6))
       :effect (and (pred_2 ?v5)
		    (not (pred_4 ?v5 ?v1)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_5 ?v5) (pred_3 ?v1)
			    (pred_2 ?v5) (pred_1 ?v1))
       :effect (and (pred_4 ?v5 ?v1)
		    (pred_6)
		    (not (pred_2 ?v5)))))
